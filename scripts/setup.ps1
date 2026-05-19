# =========================================================
# MY DEV SETUP V2
# Safe Bootstrap Orchestrator
# =========================================================

Write-Host ""
Write-Host "========================================="
Write-Host "         MY DEV SETUP V2"
Write-Host "========================================="
Write-Host ""

# =========================================================
# GLOBAL ERROR HANDLING
# =========================================================

# Stop immediately on PowerShell errors
$ErrorActionPreference = "Stop"

# =========================================================
# RESOLVE SCRIPT ROOT
# =========================================================

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# =========================================================
# LOGGING
# =========================================================

$LogDir = "$ScriptRoot/../logs"

if (!(Test-Path $LogDir)) {

    New-Item `
        -ItemType Directory `
        -Path $LogDir `
        -Force | Out-Null
}

$LogFile = "$LogDir/setup.log"

Start-Transcript `
    -Path $LogFile `
    -Append

# =========================================================
# PRE-FLIGHT CHECKS
# =========================================================

Write-Host "[CHECK] Running pre-flight checks..."
Write-Host ""

# Check PowerShell version
if ($PSVersionTable.PSVersion.Major -lt 5) {

    throw "PowerShell 5+ is required."
}

Write-Host "[OK] PowerShell version valid."

# Check internet connection
try {

    Test-Connection `
        -ComputerName "github.com" `
        -Count 1 `
        -Quiet `
        -ErrorAction Stop | Out-Null

    Write-Host "[OK] Internet connection detected."
}
catch {

    throw "Internet connection unavailable."
}

Write-Host ""

# =========================================================
# SAFE MODULE EXECUTION FUNCTION
# =========================================================

function Invoke-SetupModule {

    param (
        [string]$ModuleName
    )

    Write-Host ""
    Write-Host "-----------------------------------------"
    Write-Host "[MODULE] $ModuleName"
    Write-Host "-----------------------------------------"

    $ModulePath = "$ScriptRoot/$ModuleName"

    if (!(Test-Path $ModulePath)) {

        throw "Module not found: $ModuleName"
    }

    try {

        & $ModulePath

        if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {

            throw "Module exited with code: $LASTEXITCODE"
        }

        Write-Host "[SUCCESS] $ModuleName completed."
    }
    catch {

        Write-Host ""
        Write-Host "[FATAL] Module failed: $ModuleName"
        Write-Host $_

        Stop-Transcript

        exit 1
    }
}

# =========================================================
# EXECUTE MODULES
# =========================================================

Invoke-SetupModule "install-scoop.ps1"
Invoke-SetupModule "install-git.ps1"
Invoke-SetupModule "install-node.ps1"
Invoke-SetupModule "install-java.ps1"
Invoke-SetupModule "install-vscode.ps1"
Invoke-SetupModule "install-vscode-extensions.ps1"
Invoke-SetupModule "apply-vscode-settings.ps1"

# =========================================================
# FINISHED
# =========================================================

Write-Host ""
Write-Host "========================================="
Write-Host "         SETUP COMPLETED"
Write-Host "========================================="
Write-Host ""

Write-Host "[DONE] Development environment ready."
Write-Host "[INFO] Log file: $LogFile"

Stop-Transcript