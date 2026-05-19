Write-Host "[MODULE] VS Code Settings"

$vscodeUserPath = "$env:APPDATA\Code\User"

if (!(Test-Path $vscodeUserPath)) {

    New-Item `
        -ItemType Directory `
        -Path $vscodeUserPath `
        -Force
}

# settings.json
$settingsSource =
"$PSScriptRoot/../vscode/settings.json"

if (Test-Path $settingsSource) {

    Copy-Item `
        $settingsSource `
        "$vscodeUserPath/settings.json" `
        -Force

    Write-Host "[OK] settings.json applied."
}

# keybindings.json
$keybindingsSource =
"$PSScriptRoot/../vscode/keybindings.json"

if (Test-Path $keybindingsSource) {

    Copy-Item `
        $keybindingsSource `
        "$vscodeUserPath/keybindings.json" `
        -Force

    Write-Host "[OK] keybindings.json applied."
}