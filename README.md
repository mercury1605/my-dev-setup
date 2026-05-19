# My Dev Setup

A modular, PowerShell-driven bootstrap repository for quickly recreating a consistent Windows development environment.

## 🚀 Overview

This repository automates the installation and configuration of core development tools. It is designed to be reproducible, portable, and version-controlled, ensuring you can go from a fresh Windows install to a ready-to-code state in minutes.

## ✨ Key Features

- **Package Management**: Automated setup of [Scoop](https://scoop.sh/).
- **Core Runtimes**: Automated installation of **Git**, **Node.js**, and **Java**.
- **VS Code Optimization**: 
  - Bulk installation of extensions from `vscode/extensions.txt`.
  - Synchronization of `settings.json` and `keybindings.json` to `%APPDATA%`.
- **Modular Architecture**: Independent PowerShell modules for each component, making it easy to add or remove tools.
- **Safe Execution**: Includes pre-flight checks (PowerShell version, connectivity) and comprehensive logging.

## 📁 Repository Structure

```text
my-dev-setup/
├── git/                # Git configuration (e.g., .gitconfig)
├── scripts/            # Modular PowerShell scripts
│   ├── setup.ps1       # Main orchestrator script
│   └── install-*.ps1   # Component-specific installation modules
└── vscode/             # VS Code settings and extension lists
```

## 🛠️ Prerequisites

- **Windows 10/11**
- **PowerShell 5.1+**
- Internet connection

## 📥 Getting Started

1. **Clone the repository**:
   ```powershell
   git clone <repo-url>
   cd my-dev-setup
   ```

2. **Run the bootstrap script**:
   ```powershell
   ./scripts/setup.ps1
   ```

3. **Verification**:
   Review the `logs/setup.log` file to ensure all modules completed successfully.

## ⚙️ Customization

- **VS Code Extensions**: Update `vscode/extensions.txt` with your extension IDs (one per line).
- **VS Code Settings**: Customize `vscode/settings.json` to suit your workflow.
- **Adding Tools**: Create a new `install-xxx.ps1` script in the `scripts/` directory and invoke it from `setup.ps1`.

## 📝 Notes

- **Security**: Never commit sensitive information (API keys, personal credentials) to this repository.
- **Portability**: This setup focuses on portable tools via Scoop to keep the system clean.
