Write-Host "[MODULE] Node.js"

$nodeExists = Get-Command node -ErrorAction SilentlyContinue

if (-not $nodeExists) {

    Write-Host "[INFO] Installing Node.js LTS..."
    scoop install nodejs-lts

    Write-Host "[OK] Node.js installed."
}
else {

    Write-Host "[OK] Node.js already installed."
}

# pnpm
$pnpmExists = Get-Command pnpm -ErrorAction SilentlyContinue

if (-not $pnpmExists) {

    Write-Host "[INFO] Installing pnpm..."
    scoop install pnpm

    Write-Host "[OK] pnpm installed."
}
else {

    Write-Host "[OK] pnpm already installed."
}