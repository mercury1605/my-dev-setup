Write-Host "[MODULE] Git"

$gitExists = Get-Command git -ErrorAction SilentlyContinue

if (-not $gitExists) {

    Write-Host "[INFO] Installing Git..."
    scoop install git

    Write-Host "[OK] Git installed."
}
else {

    Write-Host "[OK] Git already installed."
}