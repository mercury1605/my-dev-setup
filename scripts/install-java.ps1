Write-Host "[MODULE] Java"

$javaExists = Get-Command java -ErrorAction SilentlyContinue

if (-not $javaExists) {

    Write-Host "[INFO] Installing Temurin JDK 21..."
    scoop install temurin21-jdk

    Write-Host "[OK] Java installed."
}
else {

    Write-Host "[OK] Java already installed."
}