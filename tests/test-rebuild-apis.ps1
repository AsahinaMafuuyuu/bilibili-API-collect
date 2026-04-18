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

foreach ($file in $targets) {
    $raw = Get-Content -Path $file.FullName -Raw
    try {
        $doc = $raw | ConvertFrom-Json
    } catch {
        $results.Add([ordered]@{
            file = $file.FullName
            api_id = $null
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

    foreach ($api in $doc.apis) {
        $baseUrl = [string]$api.test_request.url
        $query = @()

        if ($api.test_request.query) {
            foreach ($prop in $api.test_request.query.PSObject.Properties) {
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

        $uri = if ($query.Count -gt 0) { "${baseUrl}?" + ($query -join '&') } else { $baseUrl }
        $headers = @{}
        if ($api.test_request.headers) {
            foreach ($prop in $api.test_request.headers.PSObject.Properties) {
                $headers[[string]$prop.Name] = [string]$prop.Value
            }
        }

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $httpStatus = $null
        $bodyText = ''
        $errText = $null

        try {
            $resp = Invoke-WebRequest -Uri $uri -Method ([string]$api.method) -Headers $headers -UseBasicParsing -TimeoutSec 20
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
            api_id = [string]$api.id
            api_name = [string]$api.name
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
} | ConvertTo-Json -Depth 20

[System.IO.File]::WriteAllText($OutputPath, $jsonOutput, $enc)
Write-Host "API test report written: $OutputPath"
Write-Host "Total: $($results.Count), Passed: $(($results | Where-Object { $_.success }).Count), Failed: $(($results | Where-Object { -not $_.success }).Count)"
