Write-Host "[MODULE] VS Code Extensions"

$extensionsFile = "$PSScriptRoot/../vscode/extensions.txt"

if (!(Test-Path $extensionsFile)) {

    Write-Host "[WARNING] extensions.txt not found."
    return
}

$installedExtensions = code --list-extensions

Get-Content $extensionsFile | ForEach-Object {

    $extension = $_.Trim()

    if ($extension -eq "") {
        return
    }

    if ($installedExtensions -contains $extension) {

        Write-Host "[OK] Extension already installed: $extension"
    }
    else {

        Write-Host "[INFO] Installing extension: $extension"

        code --install-extension $extension
    }
}