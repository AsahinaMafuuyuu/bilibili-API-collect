param(
    [string[]]$BatchFiles = @()
)

$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$todoPath = Join-Path $repoRoot 'TODO.md'
$docsRoot = Join-Path $repoRoot 'docs'
$rebuildRoot = Join-Path $repoRoot 'Rebuild-Api-Docs'

if (-not (Test-Path $todoPath)) {
    Write-Error "TODO.md not found: $todoPath"
}

if (-not (Test-Path $rebuildRoot)) {
    Write-Error "Rebuild-Api-Docs not found: $rebuildRoot"
}

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

$todoContent = Get-Content -Path $todoPath -Raw
$errors = New-Object System.Collections.Generic.List[string]
$checkedCount = 0

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

    $rawJson = Get-Content -Path $target -Raw
    try {
        $json = $rawJson | ConvertFrom-Json
    } catch {
        $errors.Add("Invalid JSON: Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        continue
    }

    if (-not $json.meta) {
        $errors.Add("Missing 'meta' object: Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if (-not $json.apis -or $json.apis.Count -lt 1) {
        $errors.Add("Missing or empty 'apis': Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if ($json.meta.source_doc -ne $normalizedSource) {
        $errors.Add("meta.source_doc mismatch in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if ($json.meta.encoding -ne 'UTF-8') {
        $errors.Add("meta.encoding must be UTF-8 in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    if ($json.meta.test_base_url -ne 'https://api.bilibili.com') {
        $errors.Add("meta.test_base_url must be https://api.bilibili.com in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
    }

    foreach ($api in $json.apis) {
        if (-not $api.id -or -not $api.name -or -not $api.method -or -not $api.path) {
            $errors.Add("API core fields missing in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
            continue
        }

        if (-not $api.original_url) {
            $errors.Add("API original_url missing for $($api.id) in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        }

        if (-not $api.test_request -or -not $api.test_request.url) {
            $errors.Add("API test_request.url missing for $($api.id) in Rebuild-Api-Docs/$($relativeJson.Replace('\','/'))")
        } elseif (-not $api.test_request.url.StartsWith('https://api.bilibili.com')) {
            $errors.Add("API test_request.url must start with https://api.bilibili.com for $($api.id)")
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
