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

if (-not $BatchFiles -or $BatchFiles.Count -eq 0) {
    $BatchFiles = Get-ChildItem $rebuildRoot -Recurse -File -Filter *.md |
        ForEach-Object {
            $_.FullName.Substring($rebuildRoot.Length + 1).Replace('\', '/')
        } |
        ForEach-Object { "docs/$_" }
}

$requiredMarkers = @(
    '#### 接口信息',
    '#### 请求参数',
    '#### 错误码',
    '#### 请求示例',
    '#### 成功响应示例',
    '#### 失败响应示例',
    '#### OpenAPI 3.0 片段',
    'openapi: 3.0.3'
)

$todoContent = Get-Content -Path $todoPath -Raw
$errors = New-Object System.Collections.Generic.List[string]
$checkedCount = 0

# Check mirror relation for all rebuilt docs.
$allRebuildFiles = Get-ChildItem $rebuildRoot -Recurse -File -Filter *.md
foreach ($file in $allRebuildFiles) {
    $relative = $file.FullName.Substring($rebuildRoot.Length + 1)
    $sourcePath = Join-Path $docsRoot $relative
    if (-not (Test-Path $sourcePath)) {
        $errors.Add("Mirror check failed: missing source file docs/$($relative.Replace('\','/'))")
    }
}

foreach ($source in $BatchFiles) {
    $normalizedSource = $source.Replace('\', '/').TrimStart('/')
    if (-not $normalizedSource.StartsWith('docs/')) {
        $normalizedSource = "docs/$normalizedSource"
    }

    $relative = $normalizedSource.Substring(5)
    $target = Join-Path $rebuildRoot $relative

    if (-not (Test-Path $target)) {
        $errors.Add("Target file missing: Rebuild-Api-Docs/$($relative.Replace('\','/'))")
        continue
    }

    $content = Get-Content -Path $target -Raw

    if (-not $content.StartsWith('# ')) {
        $errors.Add("Markdown title missing in: Rebuild-Api-Docs/$($relative.Replace('\','/'))")
    }

    foreach ($marker in $requiredMarkers) {
        if ($content -notmatch [regex]::Escape($marker)) {
            $errors.Add("Required marker '$marker' missing in: Rebuild-Api-Docs/$($relative.Replace('\','/'))")
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

Write-Host "Validation passed. Batch files checked: $($BatchFiles.Count); TODO checked: $checkedCount" -ForegroundColor Green
exit 0
