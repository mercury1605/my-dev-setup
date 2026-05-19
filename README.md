# My Dev Setup

Personal development environment bootstrap repository.

This repository contains the configuration files, scripts, and setup resources I use to quickly recreate my development environment on a new machine.

The goal is to make my setup:
- reproducible
- portable
- version controlled
- easy to maintain

---

# Included Setup

Currently this repository manages:

- VS Code extensions
- VS Code settings
- Development bootstrap scripts
- General development tooling configuration

This repository may later expand to include:
- IntelliJ IDEA settings/plugins
- Git configuration
- Terminal configuration
- Node.js / pnpm setup
- Java / Tomcat setup
- Docker setup
- AI engineering tooling

---

# Repository Structure

```txt
my-dev-setup/
│
├── vscode/
│   ├── extensions.txt
│   ├── settings.json
│   └── keybindings.json
│
├── scripts/
│   └── setup.ps1
│
└── README.md
```

---

# VS Code Extensions

Export installed extensions:

```bash
code --list-extensions --show-versions > vscode/extensions.txt
```

Install all extensions from file:

## PowerShell

```powershell
Get-Content vscode/extensions.txt |
ForEach-Object {
    code --install-extension $_
}
```

---

# VS Code Settings

VS Code user settings are stored at:

## Windows

```txt
%APPDATA%\Code\User\
```

Files may include:
- settings.json
- keybindings.json

---

# Setup Workflow

## Clone Repository

```bash
git clone <repo-url>
```

## Run Setup Script

```powershell
./scripts/setup.ps1
```

The setup script may:
- install VS Code extensions
- copy configuration files
- install development tools
- configure the local environment

---

# Philosophy

This repository is not intended to back up an entire machine.

Instead, it stores:
- configuration
- setup instructions
- environment declarations

The objective is to rebuild a clean development environment quickly and consistently.

---

# Notes

- Some tools still require manual installation.
- Sensitive information should never be committed.
- Machine-specific paths may require adjustment.

---

# Future Improvements

Potential future additions:
- Automated package installation
- Cross-platform support
- Docker/dev container setup
- WSL integration
- AI development tooling
- Full machine bootstrap automation