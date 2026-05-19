Write-Host "[MODULE] VS Code"

$codeExists = Get-Command code -ErrorAction SilentlyContinue

if (-not $codeExists) {

    Write-Host "[INFO] Installing VS Code..."
    scoop install vscode

    Write-Host "[OK] VS Code installed."
}
else {

    Write-Host "[OK] VS Code already installed."
}