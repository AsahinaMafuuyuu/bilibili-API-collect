param(
    [string[]]$BatchFiles = @()
)

$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$todoPath = Join-Path $repoRoot 'TODO.md'
$docsRoot = Join-Path $repoRoot 'docs'
$rebuildRoot = Join-Path $repoRoot 'Rebuild-Api-Docs'
$templatePath = Join-Path $repoRoot 'Template/template.json'

if (-not (Test-Path $todoPath)) {
    Write-Error "TODO.md not found: $todoPath"
}

if (-not (Test-Path $rebuildRoot)) {
    Write-Error "Rebuild-Api-Docs not found: $rebuildRoot"
}

if (-not (Test-Path $templatePath)) {
    Write-Error "Template file not found: $templatePath"
}

$templateRaw = Get-Content -Path $templatePath -Raw -Encoding UTF8
try {
    $templateDoc = $templateRaw | ConvertFrom-Json
} catch {
    Write-Error "Template JSON is invalid: $templatePath"
}
$templateTopKeys = @($templateDoc.PSObject.Properties.Name)

$allRebuildFiles = Get-ChildItem $rebuildRoot -Recurse -File -Filter *.json
if (-not $allRebuildFiles -or $allRebuildFiles.Count -eq 0) {
    Write-Error 'No JSON rebuild files found under Rebuild-Api-Docs/**'
}

if (-not $BatchFiles -or $BatchFiles.Count -eq 0) {
    $BatchFiles = $allRebuildFiles |
        ForEach-Object {
            $relative = $_.FullName.Substring($rebuildRoot.Length + 1).Replace('\', '/')
            "docs/$([System.IO.Path]::ChangeExtension($relative, 'md'))"
        }
}

$todoContent = Get-Content -Path $todoPath -Raw -Encoding UTF8
$errors = New-Object System.Collections.Generic.List[string]
$checkedCount = 0

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
                    Method = $method
                    Operation = $op
                })
            }
        }
    }

    return $entries
}

# Check mirror relation for all rebuilt JSON files.
foreach ($file in $allRebuildFiles) {
    $relativeJson = $file.FullName.Substring($rebuildRoot.Length + 1)
    $relativeDoc = [System.IO.Path]::ChangeExtension($relativeJson, 'md')
    $sourcePath = Join-Path $docsRoot $relativeDoc
    if (-not (Test-Path $sourcePath)) {
        $errors.Add("Mirror check failed: missing source file docs/$($relativeDoc.Replace('\','/'))")
    }
}

foreach ($source in $BatchFiles) {
    $normalizedSource = $source.Replace('\', '/').TrimStart('/')
    if (-not $normalizedSource.StartsWith('docs/')) {
        $normalizedSource = "docs/$normalizedSource"
    }

    if (-not $normalizedSource.EndsWith('.md')) {
        $normalizedSource = "$normalizedSource.md"
    }

    $relativeDoc = $normalizedSource.Substring(5)
    $relativeJson = [System.IO.Path]::ChangeExtension($relativeDoc, 'json')
    $target = Join-Path $rebuildRoot $relativeJson

    if (-not (Test-Path $target)) {
        $errors.Add("Target JSON missing: Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        continue
    }

    $rawJson = Get-Content -Path $target -Raw -Encoding UTF8
    try {
        $json = $rawJson | ConvertFrom-Json
    } catch {
        $errors.Add("Invalid JSON: Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        continue
    }

    foreach ($key in @('openapi', 'info', 'servers', 'components', 'paths')) {
        if (-not ($json.PSObject.Properties.Name -contains $key)) {
            $errors.Add("Missing top-level key '$key': Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }
    }

    foreach ($templateKey in $templateTopKeys) {
        if ($templateKey -in @('openapi', 'info', 'servers', 'tags', 'components', 'paths')) {
            if (-not ($json.PSObject.Properties.Name -contains $templateKey)) {
                $errors.Add("Template key '$templateKey' missing: Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
            }
        }
    }

    if ([string]::IsNullOrWhiteSpace([string]$json.openapi) -or -not ([string]$json.openapi -match '^3\.(0|1)\.')) {
        $errors.Add("openapi must be 3.0.x or 3.1.x in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if (-not $json.info -or [string]::IsNullOrWhiteSpace([string]$json.info.title) -or [string]::IsNullOrWhiteSpace([string]$json.info.version) -or [string]::IsNullOrWhiteSpace([string]$json.info.description)) {
        $errors.Add("info.title/info.version/info.description required in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if ($json.'x-source-doc' -ne $normalizedSource) {
        $errors.Add("x-source-doc mismatch in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if ($json.'x-template-file' -ne 'Template/template.json') {
        $errors.Add("x-template-file must be Template/template.json in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if ($json.'x-test-base-url' -ne 'https://api.bilibili.com') {
        $errors.Add("x-test-base-url must be https://api.bilibili.com in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    $ops = Get-OperationEntries -PathsObject $json.paths
    if (-not $ops -or $ops.Count -lt 1) {
        $errors.Add("No operations found in paths: Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    foreach ($entry in $ops) {
        $pathName = [string]$entry.Path
        $method = [string]$entry.Method
        $op = $entry.Operation
        $opLabel = "$method $pathName"

        if (-not $pathName.StartsWith('/')) {
            $errors.Add("Path must start with '/': $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if ([string]::IsNullOrWhiteSpace([string]$op.summary)) {
            $errors.Add("Operation summary missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if ([string]::IsNullOrWhiteSpace([string]$op.description)) {
            $errors.Add("Operation description missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if (-not ($op.PSObject.Properties.Name -contains 'parameters')) {
            $errors.Add("Operation parameters missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if (-not $op.responses) {
            $errors.Add("Operation responses missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
            continue
        }

        if (-not ($op.responses.PSObject.Properties.Name -contains '200')) {
            $errors.Add("Operation response 200 missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        } else {
            $ok = $op.responses.'200'
            $okContent = $ok.content.'application/json'
            if (-not $okContent) {
                $errors.Add("Operation 200 content.application/json missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
            } else {
                if (-not $okContent.schema) {
                    $errors.Add("Operation 200 schema missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
                }
                if (-not $okContent.examples -or -not $okContent.examples.success) {
                    $errors.Add("Operation 200 success example missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
                }
            }
        }

        $hasErrorResponse = $false
        foreach ($respProp in $op.responses.PSObject.Properties) {
            $respCode = [string]$respProp.Name
            if ($respCode.StartsWith('2')) {
                continue
            }
            $hasErrorResponse = $true
            break
        }
        if (-not $hasErrorResponse) {
            $errors.Add("At least one non-2xx error response is required: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if (-not $op.'x-original-url') {
            $errors.Add("x-original-url missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if (-not $op.'x-test-request') {
            $errors.Add("x-test-request missing: $opLabel in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }
    }

    $todoPattern = "- \[(?<mark>[ xX])\] \[DOC\] ``$([regex]::Escape($normalizedSource))``"
    $match = [regex]::Match($todoContent, $todoPattern)
    if (-not $match.Success) {
        $errors.Add("TODO item missing for: $normalizedSource")
    } elseif ($match.Groups['mark'].Value -notin @('x', 'X')) {
        $errors.Add("TODO item is not checked: $normalizedSource")
    } else {
        $checkedCount++
    }
}

if ($errors.Count -gt 0) {
    Write-Host 'Validation failed:' -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host "Validation passed. Batch docs checked: $($BatchFiles.Count); TODO checked: $checkedCount" -ForegroundColor Green
exit 0
