# Fedora KDE Post-Installation Setup

**Comprehensive setup scripts and configuration for Fedora KDE Plasma**

A collection of post-installation scripts, system tweaks, and configuration files to transform a fresh Fedora KDE installation into a fully-configured data engineering workstation.

---

## 🎯 What This Includes

### System Configuration
- **Ultimate System Tweaks**: Performance optimizations, swap configuration, power management
- **Browser RAM Setup**: Firefox/Chrome memory optimization for 40GB systems
- **Health Timers**: 20-20-20 eye timer, 50-10 work timer, screen lock utilities

### Development Environment
- **Bash Prompt**: Advanced starship-style prompt with Git integration
- **BLE.sh Integration**: Enhanced bash line editor
- **SSH Configuration**: Complete SSH setup and key management guide

### Database & Tools
- **PostgreSQL 18**: Installation and configuration
- **MariaDB**: Setup scripts
- **SQL Server**: Container-based setup
- **DuckDB**: Local analytics database
- **VS Code**: Editor configuration and extensions

### Documentation
- Complete step-by-step setup guides
- Troubleshooting references
- Configuration file templates

---

## 🚀 Quick Start

### Prerequisites
- Fresh Fedora KDE installation (Fedora 43+)
- Sudo access
- Internet connection

### Setup Steps

1. **Clone this repository**:
```bash
   git clone git@github.com:bijoynandi/fedora-setup.git
   cd fedora-setup
```

2. **Create environment file**:
```bash
   cp .env.example .env
   nano .env  # Set your passwords
```

3. **Source environment variables**:
```bash
   source .env
```

4. **Run setup scripts** (in order):
```bash
   # Follow the main setup guide:
   cat Post-Installation-Setup/0-Post-Installation-Fedora-Setup.md
   
   # Or run individual scripts as needed
```

---

## 📂 Repository Structure
```
fedora-setup/
├── .env.example                               # Password template (root)
├── .env                                       # Your passwords (root, not in git)
├── Post-Installation-Setup/
│   ├── 0-Post-Installation-Fedora-Setup.md    # Main setup guide
│   ├── 1-Ultimate-System-Tweaks.md            # Performance optimization
│   ├── 2-Browser-RAM-Setup-Guide.md           # Browser tuning
│   ├── 3-The-Ultimate-Bash-Prompt.md          # Prompt customization
│   ├── 4-Ultimate-Linux-Compilation-Guide.md  # Software compilation
│   ├── 5-BLE.SH-Installation.md               # Bash line editor
│   ├── 6-Health-Timers.md                     # Productivity timers
│   ├── 7-SSH-Fedora-Reference-Manual.md       # SSH setup
│   ├── 8-VS-Code-Settings.json                # VS Code config
│   ├── .env.example                           # Password template
│   ├── aliases.sh                             # Bash aliases
│   ├── bashrc.sh                              # Bash configuration
│   ├── history.sh                             # History settings
│   ├── prompt.sh                              # Prompt configuration
│   └── tools.sh                               # Development tools
├── Bashrc-Configurations/
│   └── 0-Fedora-Bashrc-Configurations.md
└── Bash-History/
    └── 0-Fedora-Bash-History.sh               # Command reference
```

---

## 🔒 Security Notes

### Environment Variables
- **Never commit `.env` to git** - Contains passwords!
- `.env` is in `.gitignore` for safety
- `.env` is located in repository root
- Use `.env.example` as template

### Password Management
All database and service passwords are stored in `.env` (root directory):
- `SQLSERVER_PASSWORD`: SQL Server SA password
- `POSTGRES_PASSWORD`: PostgreSQL password
- `MARIADB_PASSWORD`: MariaDB root password
- `PGADMIN_PASSWORD`: PgAdmin4 password

### Sourcing Environment Variables
Scripts use absolute path to source `.env`:
```bash
# In scripts:
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../.env"  # Sources from repo root
```

### Git Configuration
All commits to this repo are GPG-signed. Verify signatures:
```bash
git log --show-signature
```

---

## 🎓 Usage

### For Fresh Installation
1. Copy `.env.example` to `.env` in repository root
2. Edit `.env` with your passwords
3. Follow the guides in order, starting with `0-Post-Installation-Fedora-Setup.md`

### For Specific Components
Jump to any guide based on what you need to configure.

### For Reference
Use `Bash-History/0-Fedora-Bash-History.sh` as a command reference for common tasks.

---

## 🛠️ Technologies Configured

- **OS**: Fedora KDE Plasma 43+
- **Databases**: PostgreSQL 18, MariaDB 10.11, SQL Server 2022, DuckDB 1.4.4
- **Languages**: Python 3.14 (Conda), Bash
- **Tools**: Git, SSH, GPG, Podman, VS Code, DBeaver
- **Shell**: Bash with BLE.sh and custom prompt

---

## 📝 Notes

- Tested on Fedora 43 KDE Plasma
- Designed for 32GB RAM systems (adjust browser configs for different specs)
- All database containers use Podman (Docker-compatible)
- GPG commit signing configured by default
- `.env` file is in repository root, not in subdirectories

---

## 🤝 Contributing

This is a personal configuration repository, but feel free to:
- Fork and adapt for your own use
- Report issues if you find errors
- Suggest improvements

---

## 📜 License

This is free and unencumbered software released into the public domain.

---

## ✨ Author

**Bijoy Nandi**
- GitHub: [@bijoynandi](https://github.com/bijoynandi)
- Focus: Data Engineering

---

*Last updated: March 2026*
