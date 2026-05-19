Write-Host "[MODULE] VS Code Settings"

$vscodeUserPath = "$env:APPDATA\Code\User"

if (!(Test-Path $vscodeUserPath)) {

    New-Item `
        -ItemType Directory `
        -Path $vscodeUserPath `
        -Force
}

function Apply-VscodeConfig {
    param (
        [string]$FileName
    )

    $source = "$PSScriptRoot/../vscode/$FileName"
    $dest = "$vscodeUserPath/$FileName"

    if (Test-Path $source) {
        
        if (Test-Path $dest) {
            $item = Get-Item $dest
            
            # If it's already a symlink, just remove it to recreate
            if ($item.Attributes -match "ReparsePoint") {
                Remove-Item $dest -Force
            }
            else {
                # Backup real file
                $backup = "$dest.bak"
                Write-Host "[INFO] Backing up existing $FileName to $FileName.bak"
                Move-Item $dest $backup -Force
            }
        }

        try {
            New-Item -ItemType SymbolicLink -Path $dest -Target $source -Force | Out-Null
            Write-Host "[OK] Symbolic link created for $FileName."
        }
        catch {
            Write-Host "[WARNING] Could not create symlink for $FileName. Falling back to copy."
            Copy-Item $source $dest -Force
            Write-Host "[OK] $FileName applied via copy."
        }
    }
}

# Apply configurations
Apply-VscodeConfig "settings.json"
Apply-VscodeConfig "keybindings.json"