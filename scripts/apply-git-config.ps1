Write-Host "[MODULE] Git Configuration"

$gitConfigSource = "$PSScriptRoot/../git/.gitconfig"
$gitConfigDest = "$HOME/.gitconfig"

if (Test-Path $gitConfigSource) {

    # Backup existing .gitconfig if it's not a link and exists
    if (Test-Path $gitConfigDest) {
        
        $item = Get-Item $gitConfigDest
        if ($item.Attributes -match "ReparsePoint") {
            Write-Host "[INFO] Git config is already a symbolic link."
            Remove-Item $gitConfigDest -Force
        }
        else {
            $backupPath = "$gitConfigDest.bak"
            Write-Host "[INFO] Backing up existing Git config to $backupPath"
            Move-Item $gitConfigDest $backupPath -Force
        }
    }

    try {
        New-Item -ItemType SymbolicLink -Path $gitConfigDest -Target $gitConfigSource -Force | Out-Null
        Write-Host "[OK] Git config symlink created."
    }
    catch {
        Write-Host "[WARNING] Could not create symlink (requires Admin or Dev Mode). Falling back to copy."
        Copy-Item $gitConfigSource $gitConfigDest -Force
        Write-Host "[OK] Git config copied."
    }
}
else {
    Write-Host "[WARNING] Git config source not found: $gitConfigSource"
}