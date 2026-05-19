Write-Host "[MODULE] Scoop"

$scoopExists = Get-Command scoop -ErrorAction SilentlyContinue

if (-not $scoopExists) {

    Write-Host "[INFO] Installing Scoop..."

    Set-ExecutionPolicy RemoteSigned `
        -Scope CurrentUser `
        -Force

    Invoke-RestMethod `
        -Uri https://get.scoop.sh |
        Invoke-Expression

    Write-Host "[OK] Scoop installed."
}
else {

    Write-Host "[OK] Scoop already installed."
}

# Add common buckets
$buckets = @(
    "main",
    "extras",
    "java"
)

foreach ($bucket in $buckets) {

    $exists = scoop bucket list |
        Select-String "^$bucket$"

    if (-not $exists) {

        Write-Host "[INFO] Adding bucket: $bucket"
        scoop bucket add $bucket
    }
}