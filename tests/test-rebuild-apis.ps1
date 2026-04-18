param(
    [string[]]$BatchFiles = @(),
    [string]$OutputPath = ''
)

$ErrorActionPreference = 'Continue'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$rebuildRoot = Join-Path $repoRoot 'Rebuild-Api-Docs'
$reportRoot = Join-Path $repoRoot 'Aengt-Report'

if (-not (Test-Path $rebuildRoot)) {
    Write-Error "Rebuild-Api-Docs not found: $rebuildRoot"
    exit 1
}

if (-not (Test-Path $reportRoot)) {
    New-Item -ItemType Directory -Path $reportRoot -Force | Out-Null
}

if (-not $BatchFiles -or $BatchFiles.Count -eq 0) {
    $targets = Get-ChildItem $rebuildRoot -Recurse -File -Filter *.json
} else {
    $targets = @()
    foreach ($source in $BatchFiles) {
        $normalized = $source.Replace('\\', '/').TrimStart('/')
        if (-not $normalized.StartsWith('docs/')) {
            $normalized = "docs/$normalized"
        }
        if (-not $normalized.EndsWith('.md')) {
            $normalized = "$normalized.md"
        }
        $relativeDoc = $normalized.Substring(5)
        $relativeJson = [System.IO.Path]::ChangeExtension($relativeDoc, 'json')
        $targetPath = Join-Path $rebuildRoot $relativeJson
        if (Test-Path $targetPath) {
            $targets += Get-Item $targetPath
        } else {
            Write-Warning "JSON target not found for batch file: $source"
        }
    }
}

if (-not $targets -or $targets.Count -eq 0) {
    Write-Error 'No rebuild JSON files to test.'
    exit 1
}

$results = New-Object System.Collections.Generic.List[object]

function Get-OperationEntries {
    param(
        [object]$PathsObject
    )

    $entries = New-Object System.Collections.Generic.List[object]
    if (-not $PathsObject) {
        return $entries
    }

    foreach ($pathProp in $PathsObject.PSObject.Properties) {
        $pathName = [string]$pathProp.Name
        $pathItem = $pathProp.Value
        foreach ($method in @('get', 'post', 'put', 'patch', 'delete')) {
            $op = $pathItem.$method
            if ($null -ne $op) {
                $entries.Add([ordered]@{
                    Path = $pathName
                    Method = $method.ToUpperInvariant()
                    Operation = $op
                })
            }
        }
    }

    return $entries
}

foreach ($file in $targets) {
    $raw = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    try {
        $doc = $raw | ConvertFrom-Json
    } catch {
        $results.Add([ordered]@{
            file = $file.FullName
            source_doc = $null
            operation_id = $null
            method = $null
            path = $null
            original_url = $null
            test_url = $null
            http_status = $null
            biz_code = $null
            biz_message = $null
            success = $false
            error = 'Invalid JSON'
            elapsed_ms = 0
        })
        continue
    }

    $baseUrl = [string]$doc.'x-test-base-url'
    if ([string]::IsNullOrWhiteSpace($baseUrl)) {
        $baseUrl = 'https://api.bilibili.com'
    }
    $baseUrl = $baseUrl.TrimEnd('/')
    $sourceDoc = [string]$doc.'x-source-doc'

    $ops = Get-OperationEntries -PathsObject $doc.paths
    if (-not $ops -or $ops.Count -eq 0) {
        $results.Add([ordered]@{
            file = $file.FullName
            source_doc = $sourceDoc
            operation_id = $null
            method = $null
            path = $null
            original_url = $null
            test_url = $null
            http_status = $null
            biz_code = $null
            biz_message = $null
            success = $false
            error = 'No operations in OpenAPI paths'
            elapsed_ms = 0
        })
        continue
    }

    foreach ($entry in $ops) {
        $pathName = [string]$entry.Path
        $method = [string]$entry.Method
        $op = $entry.Operation
        $opId = [string]$op.operationId
        $originalUrl = [string]$op.'x-original-url'

        $testReq = $op.'x-test-request'
        $query = @()
        if ($testReq -and $testReq.query) {
            foreach ($prop in $testReq.query.PSObject.Properties) {
                $k = [string]$prop.Name
                $v = [string]$prop.Value
                if ([string]::IsNullOrWhiteSpace($v)) {
                    continue
                }
                if ($v.Contains('<') -or $v.Contains('>') -or $v.StartsWith('__')) {
                    continue
                }
                $query += ('{0}={1}' -f [System.Uri]::EscapeDataString($k), [System.Uri]::EscapeDataString($v))
            }
        }

        $uri = "$baseUrl$pathName"
        if ($query.Count -gt 0) {
            $uri = "${uri}?" + ($query -join '&')
        }

        $headers = @{}
        if ($testReq -and $testReq.headers) {
            foreach ($prop in $testReq.headers.PSObject.Properties) {
                $headers[[string]$prop.Name] = [string]$prop.Value
            }
        }
        if (-not $headers.ContainsKey('Accept')) {
            $headers['Accept'] = 'application/json'
        }
        if (-not $headers.ContainsKey('User-Agent')) {
            $headers['User-Agent'] = 'Mozilla/5.0'
        }

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $httpStatus = $null
        $bodyText = ''
        $errText = $null

        try {
            $resp = Invoke-WebRequest -Uri $uri -Method $method -Headers $headers -UseBasicParsing -TimeoutSec 20
            $httpStatus = [int]$resp.StatusCode
            $bodyText = [string]$resp.Content
        } catch {
            $errText = $_.Exception.Message
            if ($_.Exception.Response) {
                try {
                    $httpStatus = [int]$_.Exception.Response.StatusCode
                } catch {
                    $httpStatus = $null
                }
                try {
                    $stream = $_.Exception.Response.GetResponseStream()
                    if ($stream) {
                        $reader = New-Object System.IO.StreamReader($stream)
                        $bodyText = $reader.ReadToEnd()
                        $reader.Close()
                    }
                } catch {
                }
            }
        }
        $stopwatch.Stop()

        $bizCode = $null
        $bizMessage = $null
        if (-not [string]::IsNullOrWhiteSpace($bodyText)) {
            try {
                $bodyJson = $bodyText | ConvertFrom-Json
                if ($bodyJson.PSObject.Properties.Name -contains 'code') {
                    $bizCode = $bodyJson.code
                }
                if ($bodyJson.PSObject.Properties.Name -contains 'message') {
                    $bizMessage = [string]$bodyJson.message
                }
            } catch {
            }
        }

        $results.Add([ordered]@{
            file = $file.FullName
            source_doc = $sourceDoc
            operation_id = $opId
            method = $method
            path = $pathName
            original_url = $originalUrl
            test_url = $uri
            http_status = $httpStatus
            biz_code = $bizCode
            biz_message = $bizMessage
            success = [bool]($httpStatus -ge 200 -and $httpStatus -lt 500)
            error = $errText
            elapsed_ms = [int]$stopwatch.ElapsedMilliseconds
        })
    }
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $reportRoot ("api-test-" + (Get-Date -Format 'yyyy-MM-dd_HHmmss') + '.json')
}

$enc = New-Object System.Text.UTF8Encoding($false)
$jsonOutput = [ordered]@{
    generated_at = (Get-Date -Format 'yyyy-MM-ddTHH:mm:ssK')
    test_base_url = 'https://api.bilibili.com'
    total = $results.Count
    passed = ($results | Where-Object { $_.success }).Count
    failed = ($results | Where-Object { -not $_.success }).Count
    results = $results
} | ConvertTo-Json -Depth 30

[System.IO.File]::WriteAllText($OutputPath, $jsonOutput, $enc)
Write-Host "API test report written: $OutputPath"
Write-Host "Total: $($results.Count), Passed: $(($results | Where-Object { $_.success }).Count), Failed: $(($results | Where-Object { -not $_.success }).Count)"
