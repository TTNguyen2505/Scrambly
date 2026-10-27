<#
.SYNOPSIS
    Fast repository formatter honoring .gitignore.
.DESCRIPTION
    Uses `git ls-files` to query all tracked and untracked (non-ignored) source files,
    ignoring build outputs and temporary artifacts.
.PARAMETER ModifiedOnly
    If set, formats only modified/uncommitted files instead of the entire repo.
#>

[CmdletBinding()]
param(
    [switch]$ModifiedOnly
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Fast Codebase Formatter (.gitignore) " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# 1. Ensure tools and Git are available
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is required to resolve .gitignore rules."
    exit 1
}

$hasClangFormat = Get-Command clang-format -ErrorAction SilentlyContinue
$hasQmlFormat   = Get-Command qmlformat -ErrorAction SilentlyContinue

if (-not $hasClangFormat) { Write-Warning "clang-format not found in PATH. Skipping C/C++." }
if (-not $hasQmlFormat)   { Write-Warning "qmlformat not found in PATH. Skipping QML." }

# 2. Query non-ignored repository files via Git
Push-Location $PSScriptRoot
try {
    if ($ModifiedOnly) {
        Write-Host "Mode: Formatting modified/uncommitted files only..." -ForegroundColor DarkCyan
        # Diff filter ACMR: Added, Copied, Modified, Renamed
        $tracked   = git diff --name-only --diff-filter=ACMR HEAD 2>$null
        $untracked = git ls-files --others --exclude-standard
        $allFiles  = @($tracked) + @($untracked) | Where-Object { $_ } | Select-Object -Unique
    } else {
        Write-Host "Mode: Formatting all non-ignored project files..." -ForegroundColor DarkCyan
        # --cached (tracked) + --others --exclude-standard (untracked, not in .gitignore)
        $allFiles = git ls-files --cached --others --exclude-standard
    }

    # 3. Filter file lists
    $cppFiles = $allFiles | Where-Object { $_ -match '\.(cpp|h|hpp|cxx|hxx|c)$' }
    $qmlFiles = $allFiles | Where-Object { $_ -match '\.qml$' }

    # 4. Batch format C/C++ files
    if ($hasClangFormat -and $cppFiles) {
        Write-Host "Formatting $($cppFiles.Count) C/C++ file(s) with clang-format..." -ForegroundColor Green
        # Pass file list directly to avoid launching clang-format per file
        & clang-format -i -style=file @cppFiles
    } else {
        Write-Host "No C/C++ files to format." -ForegroundColor Gray
    }

    # 5. Batch format QML files
    if ($hasQmlFormat -and $qmlFiles) {
        Write-Host "Formatting $($qmlFiles.Count) QML file(s) with qmlformat..." -ForegroundColor Green
        & qmlformat -i @qmlFiles
    } else {
        Write-Host "No QML files to format." -ForegroundColor Gray
    }

    # 6. Session Status Summary
    Write-Host "`nGit Status:" -ForegroundColor Yellow
    $changes = git status --short
    if ($changes) {
        git status --short
    } else {
        Write-Host "Working tree clean. All files already matched formatting rules!" -ForegroundColor Green
    }
}
finally {
    Pop-Location
}