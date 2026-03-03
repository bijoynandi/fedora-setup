# 🚀 The ULTIMATE Fedora Setup Guide

*"Someone has to plant trees they'll never sit under."*

> **Philosophy:** "Deep understanding over convenience, quality over speed, ancient wisdom with fresh perspective"
> **Version:** Fedora 43 KDE Edition
> **Hardware:** Intel i3-10100, 40GB DDR4, MSI H410M Pro-E, 1TB + 512GB btrfs
> **Last Updated:** March 2026
> **Status:** Battle-tested, Production-ready, Friend-approved! ✨

---

## 📋 Table of Contents

1. [🎯 First Boot - Essential Setup](#-first-boot---essential-setup)
2. [⚙️ System Tweaks & Customization](#-system-tweaks--customization)
3. [📦 Package Management & Repositories](#-package-management--repositories)
4. [🎬 Multimedia & Codecs](#-multimedia--codecs)
5. [🌐 Google Chrome](#-google-chrome)
6. [🛡️ Earlyoom - RAM Guardian](#-earlyoom---ram-guardian)
7. [⚡ Boot Time Optimization & 🧹 Masking Useless Services](#-boot-time-optimization-and-masking-useless-services)
8. [🔵 Fixing Annoying Bluetooth Spam](#-fixing-annoying-bluetooth-spam)
9. [🐍 Anaconda - Python Environment](#-anaconda---python-environment)
10. [🐋 Container Platform (Podman/Docker)](#-container-platform-podmandocker)
11. [🗄️ Database Servers](#-database-servers)
    - [PostgreSQL & pgAdmin](#-postgresql--pgadmin)
    - [MariaDB/MySQL](#-mariadbmysql)
12. [🦆DuckDB & Motherduck](#-duckdb--motherduck)
13. [💻 Integrated Development Environments](#-Integrated-development-environments)
14. [🛠️ Development Tools](#-development-tools)
15. [🧰 Essential CLI Tools](#-essential-cli-tools)
16. [🖥️ Virtualization Stack (QEMU/KVM)](#-virtualization-stack-qemukvm)
17. [📂 Backup Strategies](#-backup-strategies)
18. [🔧 System Maintenance](#-system-maintenance)
19. [🆙 Upgrading Fedora](#-upgrading-fedora)
20. [💡 Pro Tips & Best Practices](#-pro-tips--best-practices)

---

## 🎯 First Boot - Essential Setup

### Enable Third-Party Repositories 🎁

**In the Welcome Screen:**
- Check "Enable Third-Party Repositories"
- This gets you Google Chrome, VS Code repos, codecs, etc.

**OR manually:**
```bash
sudo dnf install fedora-workstation-repositories
```

**Why this matters:** Official Fedora is PURE open source. Third-party repos add the "real world" stuff (Chrome, proprietary codecs, etc.)

**The repo files are located at:**
```bash
ls /etc/yum.repos.d/
```

---

### Update Everything First! 🔄

```bash
# Always start fresh
sudo dnf upgrade

# Reboot to apply kernel updates
reboot
```

**⏰ Time to make coffee!** Updates take 5-15 minutes depending on internet speed.

**Why reboot?** Kernel updates don't apply until reboot. Old kernel = old security holes!

---

### Set Your Hostname 🏷️

```bash
# Make your workstation identifiable
sudo hostnamectl set-hostname ws
```

**Pro tip:** Use simple names. No spaces, no special chars!

**Check it worked:**
```bash
hostnamectl
# Should show: Static hostname: ws
```

---

### Restore Data 💾

```bash
# First restore these (IMPORTANT)
rsync -avH --dry-run /run/media/bijoy/system-backup-sp/home/bijoy/Documents/ /home/bijoy/Documents/
rsync -avH --dry-run /run/media/bijoy/system-backup-sp/home/bijoy/Music/ /home/bijoy/Music/
rsync -avH --dry-run /run/media/bijoy/system-backup-sp/home/bijoy/Pictures/ /home/bijoy/Pictures/

# After all setup done (LATER)
# From system-backup-sp
rsync -avH --dry-run /run/media/bijoy/system-backup-sp/home/bijoy/Videos/ /home/bijoy/Videos/

# From system-backup-hp
rsync -avH --dry-run /run/media/bijoy/system-backup-hp/home/bijoy/Videos/ /home/bijoy/Videos/
```

**See Backup Strategies below to backup and restore the system**

---

## ⚙️ System Tweaks & Customization

### KDE Plasma Settings 🎨

**Colors and Themes:**
- System Settings → Appearance & Style → Colors & Themes → Global Theme
- Select: **Breeze Dark** (easy on eyes for long coding sessions!)

**Digital Clock - ISO Date Format:**
- Right-click clock → Configure Digital Clock
- Appearance → Date format: **ISO date** (YYYY-MM-DD)
- Why? Sorts properly, internationally recognized, no ambiguity!

**Focus Follows Mouse:**
- Window Management → Window Behavior → Focus
- Window activation policy: **Focus follows mouse**
- Pro tip: Hover to focus = faster workflow! No clicking needed!

**Power Management - Never Sleep While Working:**
- Power Management → Energy Saving
- When inactive: **Do nothing**
- Why? You control when to sleep, not the OS!

**Audio Volume Shortcuts:**
- Keyboard → Shortcuts → Audio Volume
- Decrease: `Ctrl+Shift+Down`
- Increase: `Ctrl+Shift+Up`
- Pro tip: Keep hands on keyboard, control volume without reaching for mouse!

**Disable Virtual Keyboard:**
- Keyboard → Virtual Keyboard → None → Apply

**Assigning Gesture Mouse Button → Return Key**
- Mouse & Touchpad → Mouse → Configure Extra Buttons...
- Add Binding... → Press the gesture mouse button → Hit Return key for input → Apply

---

### Konsole Tweaks 🖥️

**Settings → Edit Current Profile → General:**
- Profile name: `bijoy (Default)`
- Initial terminal size: `140 x 35` (plenty of space!)

**Appearance:**
- Font size: **16** (readable but not huge)
- Background transparency: **10%** (subtle, professional)
- Margins: **8 px** (breathing room for text)
- Uncheck "Show hint for terminal size after resizing" (annoying!)

**Scrolling**
- Scrollback - Set it to 100,000 lines

**Memory**
- Right click on Konsole → Menu → Settings → Configure Konsole → Memory
- Memory limit: 1024 MB (1GB) (crash resistant)

**Why these settings?** You'll stare at this terminal for HOURS. Make it comfortable!

---

### KWrite Tweaks ✍️

**Settings → Configure KWrite → Appearance:**
- Font size: **16**
- Why? Consistency with Konsole = easier on eyes!

---

### Okulur Tweaks 📚

**Settings → Configure Okular → General:**
- Default zoom: **Fit Page**
- Why? Optimal viewing instantly!
---

### Create bin directory for custom scripts 📝

```bash
mkdir ~/bin
# Add all the necessary custom scripts here.
```

---

### Setting Fedora VM native resolution to 2560x1440p (⚠️ For QEMU/KVM Virtual Machines Use Only)

```bash
# Edit GRUB
sudo nano /etc/default/grub
```

**Find this line:**
```
GRUB_CMDLINE_LINUX="root=UUID=... ro rhgb quiet"
```

**Change to:**
```
GRUB_CMDLINE_LINUX="root=UUID=... ro video=2560x1440 rhgb quiet"
```

**Update grub:**
```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
# Reboot VM
# After reboot, set resolution to 2560×1440 → Apply → Keep
```

**Now VM boots at 2560×1440!** ✅

---

## 📦 Package Management & Repositories

### Check Your DNF Config 🔍

```bash
# Old way (Fedora <40)
cat /etc/dnf/dnf.conf

# New way (Fedora 40+, dnf5)
dnf --dump-main-config

# Check repo configuration
dnf --dump-repo-config="*"

# Check variables
dnf --dump-variables

# See enabled repos
dnf repolist

# Check if RPM Fusion is there
dnf repolist | grep -i rpmfusion
```

**Understanding repos:**
- **fedora** = Core open source packages
- **updates** = Security fixes, bug fixes
- **google-chrome** = Third-party (Google)
- **rpmfusion-free** = Free software not in official repos
- **rpmfusion-nonfree** = Proprietary stuff (NVIDIA drivers, codecs)

---

### Add RPM Fusion Free 🆓

**If you have nonfree but not free:**
```bash
# Install RPM Fusion Free
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Refresh repos
sudo dnf makecache
```

**Why RPM Fusion?** Codecs, drivers, tools that Fedora can't legally include by default.

---

## 🎬 Multimedia & Codecs

### The Codec Problem 🎭

**By default, Fedora can't play:**
- MP3, MP4, H.264 videos
- Netflix, YouTube in Firefox (properly)
- DVDs

**Why?** Patent issues, licensing restrictions.

**Solution:** Swap limited codecs for full ones!

---

### Install Full Multimedia Support 📹

**First, backup what you have:**
```bash
BACKUP_DIR=~/Documents/backups/$(date +%Y-%m-%d_%H-%M-%S)_multimedia_setup
mkdir -p "$BACKUP_DIR"
rpm -qa | grep -i codec > "$BACKUP_DIR/codecs_before.txt"
```

**Swap crippled ffmpeg for full version:**
```bash
# This is the magic command
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
```

**What this does:**
- Removes: `ffmpeg-free` (limited, patent-free version)
- Installs: `ffmpeg` (full version with ALL codecs)
- `--allowerasing`: "Yes, remove the old one, I know what I'm doing!"

**Check what changed:**
```bash
rpm -qa | grep -i codec > "$BACKUP_DIR/codecs_after.txt"
diff "$BACKUP_DIR/codecs_before.txt" "$BACKUP_DIR/codecs_after.txt"
```

**Now you can:**
- ✅ Play MP3s in Elisa
- ✅ Watch MP4 videos in VLC
- ✅ Stream Netflix in Firefox
- ✅ Edit videos in Kdenlive
- ✅ Convert media with ffmpeg

---

## 🌐 Google Chrome

```bash
# Third-party repo includes Google's repo!
sudo dnf install google-chrome-stable

# Refresh
sudo dnf makecache
```

**Why Chrome over Chromium?** Proprietary codecs, DRM (Netflix, Spotify), Google sync.

---



## 🛡️ Earlyoom - RAM Guardian

### The Problem: OOM Killer 💀

**What happens when RAM fills up:**
1. System slows to crawl
2. Everything freezes
3. Kernel panics and kills processes **randomly**
4. Might kill your database, terminal, or editor!
5. Data loss, crashed work, sadness 😢

**Default OOM killer:** Kills processes based on "badness" score. Often kills WRONG things!

---

### The Solution: earlyoom 🛡️

**What earlyoom does:**
- Monitors RAM usage constantly
- **BEFORE** system freezes, kills low-priority processes
- Smart targeting: Kill browser tabs, NOT your terminal!
- Configurable thresholds

**Think of it as:** Bouncer at nightclub. Kicks out drunk people BEFORE they start fights!

---

### Installation & Configuration 📥

**Install:**
```bash
sudo dnf install earlyoom

# Enable and start
sudo systemctl enable --now earlyoom

# Check status
systemctl status earlyoom
```

**Create optimized config:**
```bash
sudo nano /etc/default/earlyoom
```

**Paste this EPIC configuration:**
```bash
# Optimized for Fedora KDE Plasma with Development Workflow
# Adaptive/default interval
# RAM threshold: 10% (SIGTERM), 5% (SIGKILL)
# Swap threshold: 15% (SIGTERM), 10% (SIGKILL)

EARLYOOM_ARGS="-r 0 -m 10,5 -s 15,10 --prefer '^(Web Content|Isolated Web Co|chromium|chrome|firefox)$' --avoid '^(konsole|code|pycharm|datagrip|postgres|mariadb|mysqld|podman|conmon|qemu-system-x86|virtqemudd|python|anaconda|libreoffice|pgadmin4|sqlitebrowser|dnf|packagekitd|plasmashell|kwin_x11|kwin_wayland|ksmserver|plasma_session|startplasma-way|systemd|systemd-logind|dbus-daemon|dbus-broker|sddm|Xorg|Xwayland)$'"
```

**Configuration explained:**
- `-r 0`: Adaptive interval (checks more often when RAM is low)
- `-m 10,5`: RAM thresholds
  - `10%` free → Send SIGTERM (polite "please close")
  - `5%` free → Send SIGKILL (forceful "DIE NOW!")
- `-s 15,10`: Swap thresholds (similar but for swap)

**`--prefer` (kill these FIRST):**
- Browser tabs: `Web Content`, `chrome`, `firefox`, `chromium`
- Why? Tabs are disposable, easily recovered!

**`--avoid` (protect these):**
- Your tools: `konsole`, `code`, `pycharm`, `datagrip`, `dbeaver`
- Databases: `postgres`, `mariadb`, `mysqld`
- Containers: `podman`, `conmon`
- VMs: `qemu-system-x86`
- Python/Anaconda: Your data analytics work!
- KDE: `plasmashell`, `kwin` (don't kill desktop!)
- System: `systemd`, `dbus` (critical!)

**About konsole:** It's in `--avoid` because killing your terminal mid-work = DISASTER! But if konsole itself is the memory hog, earlyoom will still kill it (avoid isn't absolute protection).

---

### Restart earlyoom 🔄

```bash
sudo systemctl restart earlyoom
systemctl status earlyoom
```

---

### Monitoring 📊

**Check current memory:**
```bash
free -h
```

**Find memory hogs:**
```bash
# Top 20 memory consumers
ps aux --sort=-%mem | head -20

# Monitor over time
watch -n 10 'ps aux --sort=-%mem | head -20'
```

**Check zram (compressed RAM):**
```bash
zramctl
# Your 8GB zram is already configured! Good!
```

**See earlyoom in action:**
```bash
# Live monitoring (see kills as they happen)
journalctl -u earlyoom -f

# Recent activity (last 50 lines)
journalctl -u earlyoom -n 50

# Activity from today
journalctl -u earlyoom --since today

# Search for actual kills
journalctl -u earlyoom | grep -i "sending SIGTERM\|sending SIGKILL"
```

---

### Pro Tips 💡

**earlyoom will save you when:**
- Chrome goes rogue with 100 tabs
- Firefox memory leak
- Runaway Python script
- Docker container eating RAM
- VM using too much memory

**What NOT to do:**
- Don't disable earlyoom to "save resources" (it uses ~5MB RAM)
- Don't set thresholds too high (defeats the purpose)
- Don't remove your workflow tools from `--avoid` (you'll regret it!)

**With 40GB RAM:** You might NEVER trigger earlyoom! But it's there when you need it! 🛡️

---

## ⚡ Boot Time Optimization & 🧹 Masking Useless Services

### Check Current Boot Time ⏱️

```bash
# Total boot time
systemd-analyze

# What's slow?
systemd-analyze blame | head -20

# Critical path
systemd-analyze critical-chain
```

### 🧹 Masking Useless Services

#### Why Mask Services? 🤔

**Masking vs Disabling:**
- **Disable:** Service won't start automatically, but CAN be started
- **Mask:** Service CANNOT be started at all (symlinked to /dev/null!)

**When to mask:** Services for hardware you don't have OR don't use

---

#### Services to Mask (bijoy's Setup) 🎯

```bash
# Boot delays
sudo systemctl mask NetworkManager-wait-online.service
sudo systemctl mask initial-setup.service

# Mobile broadband modem manager (if no modem)
sudo systemctl stop ModemManager.service
sudo systemctl mask ModemManager.service

# Smart card reader daemon (if no smart card reader)
sudo systemctl stop pcscd.service
sudo systemctl mask pcscd.service
sudo systemctl mask pcscd.socket

# Hybrid GPU switcher (if single GPU only)
sudo systemctl stop switcheroo-control.service
sudo systemctl mask switcheroo-control.service

# Network discovery (if no network printers/AppleTV)
sudo systemctl stop avahi-daemon.service
sudo systemctl mask avahi-daemon.service
sudo systemctl mask avahi-daemon.socket

# Printing service (if no printer)
sudo systemctl stop cups.service
sudo systemctl mask cups.service
sudo systemctl mask cups.socket
sudo systemctl mask cups.path

# ABRT crash reporter (HUGE RAM hog - 1GB+!)
# Only needed if you report bugs to Fedora
sudo systemctl stop abrtd.service
sudo systemctl stop abrt-journal-core.service
sudo systemctl stop abrt-oops.service
sudo systemctl stop abrt-xorg.service
sudo systemctl mask abrtd.service
sudo systemctl mask abrt-journal-core.service
sudo systemctl mask abrt-oops.service
sudo systemctl mask abrt-xorg.service
```

**Result:**
- ✅ 1.1 GB RAM freed!
- ✅ Faster boot time!
- ✅ Cleaner logs!

**Check masked services:**
```bash
systemctl list-unit-files --state=masked
```

---

## 🔵 Fixing Annoying Bluetooth Spam

### The Problem 😤

**Your system spams journal logs every 30 seconds:**
```
bluetooth.service - Bluetooth service was skipped...
kdeconnectd: Cannot find Bluez 5 adapter...
```

**WHY?!**
- You have **NO Bluetooth hardware** (anti-WiFi philosophy!)
- systemd keeps checking if hardware appeared
- KDE Connect keeps looking for Bluetooth
- **Result:** 2 log entries every 30 seconds = **5,760 per day!** 🤯

---

### The Fix 🛠️

**Step 1: Remove Bluetooth Service Entirely**
```bash
# First stop bluetooth service
sudo systemctl stop bluetooth.service

# Remove the entire bluetooth stack
sudo dnf remove bluez bluez-obexd
```

**Step 2: Remove KDE Connect Entirely**
```bash
# Kill it
killall kdeconnectd

# Remove it
sudo dnf remove kdeconnectd
```

**Result:** Clean logs, easier debugging, no wasted CPU cycles! 🎉

---

## 🐍 Anaconda - Python Environment

### Why Anaconda? 🤔

**vs system Python:**
- ❌ System Python: Can break system packages if you mess up!
- ✅ Anaconda: Isolated environments, safe experimentation!

**For data analytics:** Anaconda is THE standard. Period.

### Installation 📥

```bash
cd ~/Downloads

# Download latest Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2025.12-2-Linux-x86_64.sh

# Verify it's a shell script (should say "shell script")
file Anaconda3-2025.12-2-Linux-x86_64.sh

# Verify SHA256 checksum
sha256sum Anaconda3-2025.12-2-Linux-x86_64.sh
# Should match: 57b2b48cc5b8665e25fce7011f0389d47c1288288007844b3b1ba482d4f39029

# Make executable
chmod +x Anaconda3-2025.12-2-Linux-x86_64.sh

# Peek inside (just curious!)
cat Anaconda3-2025.12-2-Linux-x86_64.sh | head

# Install (accept defaults, type "yes")
bash Anaconda3-2025.12-2-Linux-x86_64.sh

# Reload shell
exec bash

# Clean up installer
rm Anaconda3-2025.12-2-Linux-x86_64.sh
```

**Installation notes:**
- Default location: `~/anaconda3`
- Adds to `~/.bashrc` automatically
- Base environment activates by default (shows `(base)` in prompt)

---

### Conda Configuration ⚙️
```bash
# Update conda
conda update -n base -c defaults conda

# Configure channels
conda config --add channels conda-forge
conda config --set channel_priority strict

# Verify
conda config --show channels
```

### Creating Environments 🌍

```bash
# List environments
conda env list

# Create data analytics environment
conda create -n analytics python=3.12

# Activate it
conda activate analytics
```

**Environment concept:**
- `base`: Default Anaconda packages (don't install stuff here!)
- `analytics`: Your custom environment (install everything here!)

**Why separate environments?** Dependency conflicts! Project A needs pandas 1.5, Project B needs pandas 2.0? No problem with separate environments!

---

### Installing Packages 📦

```bash
# Make sure environment is active
conda activate analytics

# Install essential data science stack
conda install -c conda-forge \
  numpy pandas matplotlib \
  datasets jupyter ipykernel \
  ipywidgets jupysql psycopg2 openpyxl
```

**What you just installed:**
- **numpy**: Array math (foundation of everything)
- **pandas**: DataFrames (Excel on steroids)
- **matplotlib**: Plotting (the OG)
- **datasets**: Hugging Face datasets
- **jupyter**: Jupyter notebooks
- **ipykernel**: Jupyter kernel for this environment
- **ipywidgets**: Interactive widgets
- **jupysql**: SQL magic in Jupyter
- **psycopg2**: PostgreSQL adapter
- **openpyxl**: Excel file support

**All optimized binaries!** No compiling from source! 🎉

---

### Maintenance 🧹

```bash
# Clean up cached packages
conda clean -all

# Check environment health
conda doctor

# Check specific environment
conda doctor -n analytics

# List installed packages
conda list

# Update Conda
conda update conda
```

---

### Pro Tips 💡

**Jupyter Lab Default Directory**
```bash
# Set Jupyter to open in your notebooks directory
jupyter lab --generate-config
# Edit: 
nano ~/.jupyter/jupyter_lab_config.py
# Set and Uncomment the line: c.ServerApp.root_dir = '/home/bijoy/Documents/Data-Engineering/Notebooks'
# Save: Ctrl O, Return, Ctrl X
```

**Jupyter in custom environment:**
```bash
# Activate environment
conda activate analytics

# Install ipykernel (already did this!)
conda install ipykernel

# Add kernel to Jupyter
python -m ipykernel install --user --name=analytics

# Now start Jupyter
jupyter notebook
# Select "analytics" kernel in notebook!
```

**Quick environment switching:**
```bash
# Work on project A
conda activate project_a

# Work on project B
conda activate project_b

# Back to base
conda deactivate
```

**Don't pollute base environment!** Always create project-specific environments!

---

## 🐋 Container Platform (Podman/Docker)

### Podman - The Modern Choice ✅

**Why Podman > Docker:**
- ✅ Rootless containers (more secure!)
- ✅ No daemon (lighter!)
- ✅ Docker-compatible (same commands!)
- ✅ Already in Fedora repos!
- ✅ Works with libvirt (no conflicts!)

---

### Podman Installation 📦

```bash
# Install podman-compose (podman already pre-installed!)
sudo dnf install podman-compose

# Enable user lingering (containers persist after logout!)
sudo loginctl enable-linger $USER

# Verify lingering enabled
loginctl show-user $USER | grep Linger
# Should show: Linger=yes
```

**What is lingering?**
- Without: Containers stop when you log out!
- With: Containers keep running! ✅

---

### Test Podman 🧪

```bash
# Check versions
podman --version
podman compose version
podman buildx version

# Test with cleanup
podman run --rm hello-world
podman run --rm alpine echo "podman is ready to rock!"

# Check functionality
podman info
podman ps
```

---

### SQL Server in Podman 🗄️

**Database Setup**

**First, source the environment variables:**
```bash
source /home/bijoy/Documents/Fedora/.env
```

**Create rootless SQL Server container:**

```bash
podman run -e "ACCEPT_EULA=Y" \
   -e "SA_PASSWORD=$SQLSERVER_PASSWORD" \
   -e "MSSQL_USER=root" \
   -p 1433:1433 \
   --name sql-server \
   -v /home/bijoy/Documents/Data-Engineering:/opt/analytics:Z \
   -d mcr.microsoft.com/mssql/server:2022-latest
```

**What's `:Z` flag?**
- Handles SELinux labeling automatically!
- Without it: Permission denied errors!
- Fedora has SELinux enabled by default!

---

### Manage SQL Server Container 🔧

```bash
# Check if running
podman ps

# Start if stopped
podman start sql-server

# Stop when needed
podman stop sql-server

# View logs
podman logs sql-server

# Connect to SQL Server
podman exec -it sql-server /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P "$SQLSERVER_PASSWORD" -C

# Common fix: Remove and recreate if corrupted
podman stop sql-server
podman rm sql-server
# Then run the creation command again
```

---

### SQL Server Connection Details 📝

```
Server: localhost,1433
Trust Server Certificate: ✅ Enabled
Authentication: SQL Server Authentication
Username: SA
Password: $SQLSERVER_PASSWORD
```

---

### Test SQL Server 🧪

```sql
-- Test connection
SELECT @@VERSION;
GO

-- Create test database
CREATE DATABASE MyTestDB;
GO

USE MyTestDB;
GO

-- Create table
CREATE TABLE Users (ID INT, Name VARCHAR(50));
GO

-- Insert data
INSERT INTO Users VALUES (1, 'John Doe');
GO

-- Query
SELECT * FROM Users;
GO

-- Drop test database
Use master;
GO

DROP DATABASE MyTestDB;
GO

-- Show all databases
SELECT name FROM sys.databases;
GO
```

### Quick Reference Card

```bash
# Load SQL file into SQL Server (Pipe Method):
cat /path/to/file.sql | \
  podman exec -i sql-server /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U SA -P "$SQLSERVER_PASSWORD" -C

# Load the SQL file
cat /home/bijoy/Documents/Data-Engineering/Learning/sql/Basics/Baraa/Tutorial-Scripts/db_sql_tutorial_sqlserver.sql | \
  podman exec -i sql-server /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U SA -P "$SQLSERVER_PASSWORD" -C
```

---

### Access External Data Files 📂

**Volume mount setup allows BULK INSERT:**

```sql
-- Load CSV from mounted folder
BULK INSERT MyTable
FROM '/opt/analytics/Learning/sql/YourProject/datasets/data.csv'
WITH (
    FIRSTROW = 2,           -- Skip header row
    FIELDTERMINATOR = ',',  -- CSV delimiter
    TABLOCK                 -- Table lock for performance
);
GO
```

**File path translation:**
- Host: `/home/bijoy/Documents/Data-Engineering/Learning/sql/YourProject/datasets/data.csv`
- Container: `/opt/analytics/Learning/sql/YourProject/datasets/data.csv`

---

### Docker (If You Prefer Chaos) ⚠️💀

**⚠️⚠️ Warning: Podman is better! ⚠️⚠️**

**But if you REALLY want Docker:**

```bash
# Create Docker repo
sudo tee /etc/yum.repos.d/docker-ce.repo << 'EOF'
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://download.docker.com/linux/fedora/$releasever/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/fedora/gpg
EOF

# Import GPG key
sudo rpm --import https://download.docker.com/linux/fedora/gpg

# Refresh repos
sudo dnf makecache

# Verify GPG key import
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' | grep -i docker

# Verify Docker repo
dnf repolist | grep docker

# Install Docker
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable and start
sudo systemctl enable --now docker

# Add to docker group
sudo usermod -aG docker $USER

# Verify service status
systemctl is-active docker
systemctl is-enabled docker

# Check Docker status
sudo systemctl status docker

# Verify (need to log out/in for group!)
sudo docker --version
sudo docker compose version
docker buildx version
sudo docker run --rm hello-world
```

**After logout/in:**
```bash

# Check group membership (After logging out and in)
groups $USER | grep docker

# Test functionality
docker info
docker ps

# Test without sudo
docker run --rm alpine echo "Docker working without sudo!"
```

### Setting up SQL Server in Docker - The Bulletproof Guide

```bash
# The bulletproof command that just works
docker run -e "ACCEPT_EULA=Y" \
   -e "SA_PASSWORD=$SQLSERVER_PASSWORD" \
   -e "MSSQL_USER=root" \
   -p 1433:1433 \
   --name sql-server \
   -v /home/bijoy/Documents/Data-Engineering:/opt/analytics:Z \
   -d mcr.microsoft.com/mssql/server:2022-latest


# Check whether sql-server is running or not
docker ps

# Start sql-server if it is not already running
docker start sql-server

# Connect to sql-server
docker exec -it sql-server /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P "$SQLSERVER_PASSWORD" -C

# Check if container is running
docker ps

# If not running, start it
docker start sql-server

# Stop when needed
docker stop sql-server

# Check container status (including stopped containers)
docker ps -a

# View container logs to debug startup issues
docker logs sql-server

# Common fix: Remove and recreate if corrupted
docker stop sql-server
docker rm sql-server
# Then run the creation command again
```

### External Tool Connection Details
| Setting | Value |
|---------|-------|
| **Server** | `localhost,1433` |
| **Trust Server Certificate** | ✅ Enabled |
| **Authentication** | SQL Server Authentication |
| **Username** | `SA` |
| **Password** | `$SQLSERVER_PASSWORD` |

### Create a test database
-- Test the connection
SELECT @@VERSION;
GO

-- Create a test database
CREATE DATABASE MyTestDB;
GO

USE MyTestDB;
GO

-- Create and test a table
CREATE TABLE Users (ID INT, Name VARCHAR(50));
GO

INSERT INTO Users VALUES (1, 'John Doe');
GO

SELECT * FROM Users;
GO


### Access External Data Files

With the volume mount setup, you can now use BULK INSERT to load CSV files:

```sql
-- Example: Loading a CSV file from your mounted analytics folder
BULK INSERT MyTable
FROM '/opt/analytics/Learning/sql/YourProject/datasets/data.csv'
WITH (
    FIRSTROW = 2,           -- Skip header row
    FIELDTERMINATOR = ',',  -- CSV delimiter
    TABLOCK                 -- Table lock for better performance
);
GO
```

**File Path Translation:**
- Host: `/home/bijoy/Documents/Data-Engineering/Learning/sql/YourProject/datasets/data.csv`
- Container: `/opt/analytics/Learning/sql/YourProject/datasets/data.csv`

---

## 🗄️ Database Servers

### PostgreSQL & pgAdmin 🐘

#### Installation

```bash
# Install core packages
sudo dnf install postgresql postgresql-server postgresql-contrib

# Initialize database
sudo postgresql-setup --initdb

# Enable and start service
sudo systemctl enable --now postgresql

# Verify service status
systemctl status postgresql
```

## 2. Create Backup Before Changes (bijoy's Method)
```bash
# Create timestamped backup directory
BACKUP_DIR=~/Documents/backups/$(date +%Y-%m-%d_%H-%M-%S)_postgresql_setup
mkdir -p "$BACKUP_DIR"

# Backup PostgreSQL configs
sudo cp /var/lib/pgsql/data/pg_hba.conf "$BACKUP_DIR/"
sudo cp /var/lib/pgsql/data/postgresql.conf "$BACKUP_DIR/"

# Record current status
systemctl status postgresql > "$BACKUP_DIR/postgresql_status.txt"
sudo -i -u postgres psql -c "\l" > "$BACKUP_DIR/initial_databases.txt" 2>/dev/null || echo "No initial connection" > "$BACKUP_DIR/initial_databases.txt"

echo "Configs backed up to: $BACKUP_DIR"
```

## 3. Set PostgreSQL Password
```bash
# Switch to postgres system user
sudo -i -u postgres

# Access PostgreSQL prompt
psql

# Set password for postgres user (use your own secure password)
\password postgres
# Enter and confirm a strong password

# List databases to verify connection
\l

# Exit PostgreSQL prompt
\q

# Exit postgres user
exit
```

## 4. Configure Authentication for Network Access
```bash
# Edit authentication config
sudo nano /var/lib/pgsql/data/pg_hba.conf

# Find these lines and change ident/peer to md5:
# Change FROM:
# host    all             all             127.0.0.1/32            ident
# host    all             all             ::1/128                 ident

# Change TO:
# host    all             all             127.0.0.1/32            md5  
# host    all             all             ::1/128                 md5

# Keep this line unchanged (for local socket access):
# local   all             all                                     peer
```

## 5. Enable Network Connections
```bash
# Enable localhost connections
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = 'localhost'/" /var/lib/pgsql/data/postgresql.conf

# Verify the change
sudo grep "listen_addresses" /var/lib/pgsql/data/postgresql.conf
```

## 6. Apply Changes
```bash
# Restart PostgreSQL
sudo systemctl restart postgresql

# Verify service is running
systemctl status postgresql
```

## 7. Test Both Connection Methods
```bash
# Method 1: Local socket (no password needed)
sudo -i -u postgres
psql
\l
\q
exit

# Method 2: Network connection with password
psql -U postgres -h localhost -d postgres
# Enter your postgres password
\l
\q
```

## 8. Quick Reference Card

```bash
# Load SQL file into PostgreSQL:
psql -U postgres -h localhost -d postgres < "path/to/the/file.sql"

# Load the SQL file
psql -U postgres -h localhost -d postgres < "/home/bijoy/Documents/Data-Engineering/Learning/sql/Basics/Baraa/Tutorial-Scripts/db_sql_tutorial_postgresql.sql"
# Press Enter when prompted for password
```

## 9. Install pgAdmin4
```bash
# 1. Add PostgreSQL official repository
sudo rpm -Uvh https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm

# 2. Refresh DNF metadata cache
sudo dnf makecache

# 3. Import GPG key when prompted (verify fingerprint: E8697E2EEF76C02D3A6332778881B2A8210976F2)
# Answer 'y' to import key

# Install pgAdmin4 desktop version
sudo dnf install pgadmin4-desktop

# Import GPG key again during package installation (if prompted)
# Answer 'y' to confirm

# Launch pgAdmin4
pgadmin4
# Or find in Applications > Development > pgAdmin4

# Future updates
sudo dnf upgrade
```

## 10. Connection Details for DataGrip/DBeaver/VS Code
```
Host: localhost
Port: 5432
Database: postgres
Username: postgres
Password: [your secure password]
```

## 11. Connecting pgAdmin to PostgreSQL

### Initial Setup

1. **Launch pgAdmin4**: Find it in Applications menu or run `pgadmin4`
2. **Set Master Password**: This protects your saved connections (different from PostgreSQL passwords)

### Register Server Connections

**For postgres user:**

1. Right-click **"Servers"** → **"Register"** → **"Server..."**
   
   > ⚠️ **Important**: Use "Register" → "Server..." NOT "Create" → "Server Group"

2. Fill connection details:

   **General Tab:**
   - **Name**: `PostgreSQL - postgres user`

   **Connection Tab:**
   - **Host**: `localhost`
   - **Port**: `5432`
   - **Database**: `postgres`
   - **Username**: `postgres`
   - **Password**: [your postgres password]

3. Click **"Save"**

## Your Backup Location
All original configs are safely stored in your Documents backup directory with timestamp for easy restoration if needed.

---

### MariaDB/MySQL 🐬

#### Installation

```bash
# Check if pre-installed
dnf info mariadb

# Check status
systemctl status mariadb

# Enable and start
sudo systemctl enable --now mariadb
```

---

#### Secure Installation

```bash
# Run security script
sudo mysql_secure_installation
```

**Prompts:**
- `Enter current password for root:` → Press Return (first time!)
- `Switch to unix_socket authentication?` → `n` (keep password auth)
- `Change root password?` → `Y` (set strong password!)
- `Remove anonymous users?` → `Y` (security!)
- `Disallow root login remotely?` → `Y` (security!)
- `Remove test database?` → `Y` (not needed!)
- `Reload privilege tables?` → `Y` (apply changes!)

---

#### Test MariaDB

```bash
# Unix socket (as system root)
sudo mariadb -u root

# Check authentication
SELECT User, Host, plugin FROM mysql.user WHERE User='root';
exit
```

---

#### Create User Config

```bash
# Create ~/.my.cnf
tee ~/.my.cnf << 'EOF'
[client]
socket = /var/lib/mysql/mysql.sock
EOF
```

---

#### Password Authentication

```bash
# Connect with password
mariadb -u root -p
# OR
mysql -u root -p

# Check auth
SELECT User, Host, plugin FROM mysql.user WHERE User='root';
exit
```

#### Quick Reference Card

```bash
# Load SQL file into MariaDB:
mysql -u root -p < "/path/to/file.sql"

# Verbose mode:
mysql -u root -p -v < "path/to/file.sql"

# Load the SQL file
mysql -u root -p < "/home/bijoy/Documents/Data-Engineering/Learning/sql/Basics/Baraa/Tutorial-Scripts/db_sql_tutorial_mariadb.sql"
mysql -u root -p < "/home/bijoy/Documents/Data-Engineering/Learning/sql/Basics/Mosh/Course-Material/create-databases-mariadb.sql"
# Press Enter when prompted for password

# From inside MySQL shell:
source /path/to/file.sql

# With specific database:
mysql -u root -p database_name < "/path/to/file.sql"

# Check what's in database:
mysql -u root -p
SHOW DATABASES;
USE db_sql_tutorial;
SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
exit
```

---

#### MariaDB Connection Details

```
Host: localhost (or 127.0.0.1)
Port: 3306
Username: root
Password: [your password from mysql_secure_installation]
Database: mysql (or leave blank)
```

---

## 🦆 DuckDB & Motherduck Setup

```bash
# Install duckman (DuckDB version manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NiclasHaderer/duckdb-version-manager/main/install.sh)"

# The installer adds this to your .bashrc:
# export PATH="$HOME/.local/bin:$PATH"
# eval "$(duckman completion bash)"

# But we've moved it to tools.sh! (see Modualr bashrc)

# Install latest DuckDB
duckman install latest

# Set it as default
duckman default latest

# List available versions
duckman list remote

# List installed versions
duckman list local

# Test it
duckdb --version
```

---

## 💻 Integrated Development Environments (IDEs)

### VS Code 📝

```bash
# Import Microsoft GPG key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add official repo
sudo tee /etc/yum.repos.d/vscode.repo << 'EOF'
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

# Refresh
sudo dnf makecache

# Install
sudo dnf install code
```

---

### PyCharm 🐍

```bash
sudo mkdir -p /opt/jetbrains
cd ~/Downloads

# Download (check jetbrains.com for latest)
wget https://download.jetbrains.com/python/pycharm-2025.3.3.tar.gz

# Extract
tar -xzf pycharm-*.tar.gz
rm pycharm-*.tar.gz

# Move to /opt
sudo mv pycharm-* /opt/jetbrains/
sudo chown -R root:root /opt/jetbrains/pycharm-*

# Create symlink
sudo ln -s /opt/jetbrains/pycharm-*/bin/pycharm /usr/local/bin/pycharm

# Create desktop entry
sudo nano /usr/share/applications/pycharm.desktop
```

**Desktop entry:**
```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Comment=Python IDE for Professional Developers
Exec=/opt/jetbrains/pycharm-2025.3.3/bin/pycharm
Icon=/opt/jetbrains/pycharm-2025.3.3/bin/pycharm.png
Path=/opt/jetbrains/pycharm-2025.3.3/bin/
StartupNotify=true
StartupWMClass=jetbrains-pycharm
Categories=Development;IDE;
```

```bash
# Update desktop database
sudo update-desktop-database

# Launch
pycharm
```

**Settings:**
- Turn on: Backup and Sync
- Editor font size: 16.0
- Terminal font size: 16.0

**For updates:**
```bash
# Run as root (JetBrains needs root to update in /opt)
sudo pycharm
# Update through GUI
```

---

### DataGrip 🗄️

**Same process as PyCharm:**

```bash
cd ~/Downloads
wget https://download.jetbrains.com/datagrip/datagrip-2025.3.5.tar.gz
tar -xzf datagrip-*.tar.gz
rm datagrip-*.tar.gz
sudo mv DataGrip-* /opt/jetbrains/
sudo chown -R root:root /opt/jetbrains/DataGrip-*
sudo ln -s /opt/jetbrains/DataGrip-*/bin/datagrip /usr/local/bin/datagrip

sudo nano /usr/share/applications/datagrip.desktop
```

**Desktop entry:**
```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=DataGrip
Comment=Cross-Platform IDE for Databases & SQL
Exec=/opt/jetbrains/DataGrip-2025.3.5/bin/datagrip
Icon=/opt/jetbrains/DataGrip-2025.3.5/bin/datagrip.svg
Path=/opt/jetbrains/DataGrip-2025.3.5/bin/
StartupNotify=true
StartupWMClass=jetbrains-datagrip
Categories=Development;Database;IDE;
```

```bash
sudo update-desktop-database
datagrip
```

**Settings:**
- Turn on: Backup and Sync
- Editor font size: 16.0

**SQL Server connection:**
- Name - sql-server
- Authentication: User (SA) & Password (`$SQLSERVER_PASSWORD`)
- Connection string: Add to URL:
  ```
  jdbc:sqlserver://localhost:1433;trustServerCertificate=true;encrypt=false
  ```
  
**DuckDB connection:**

```bash
# Save to a known location
mkdir -p ~/Documents/Development/JDBC-Drivers
cd ~/Documents/Development/JDBC-Drivers

# Download DuckDB latest JDBC Driver
wget https://repo1.maven.org/maven2/org/duckdb/duckdb_jdbc/1.4.4.0/duckdb_jdbc-1.4.4.0.jar
```

**Add driver in DataGrip:**
- Database explorer → New → Driver → Select DuckDB from the left side list
- Click + under "Driver files" → Custom JARs... → Add the downloaded .jar from the save loacation → Move it to TOP of list → Remove old driver → Apply → OK
- Generate and copy the motherduck token
- In DataGrip → New → Data source → other → DuckDB
- Name: MotherDuck - data_jobs
- URL: jdbc:duckdb:md:data_jobs
- Click "Advanced" tab
- Click + (plus) to add parameter
- In Name field: motherduck_token
- In Value field: <paste your token here>
- Click DuckDB beside Test Connection → Click the pencil icon to add the DuckDB version → Enter 1.4.4 or the current DuckDB version → OK
- Test Connection
- Click Apply → OK!

---

## 🛠️ Development Tools

```bash
sudo dnf install \
  gcc \
  gcc-c++ \
  make \
  cmake \
  autoconf \
  automake \
  libtool \
  rust \
  cargo \
  git
```

**What you just installed:**
- **gcc**: Various compilers (C, C++, Objective-C, ...)
- **gcc-c++**: C++ support for GCC
- **make**: A GNU tool which simplifies the build process for users
- **cmake**: Cross-platform make system
- **autoconf**: A GNU tool for automatically configuring source code
- **automake**: A GNU tool for automatically creating Makefiles
- **libtool**: The GNU Portable Library Tool
- **rust**: The Rust Programming Language
- **cargo**: Rust's package manager and build tool
- **git**: Fast Version Control System
---

### Git Setup 🌳

**Git Configuration**:

```bash
# Set Git user identity (for commit attribution)
git config --global user.name "Bijoy Nandi"
git config --global user.email bijoynandi@proton.me

# Set default branch name to 'main' instead of 'master' (modern standard)
git config --global init.defaultBranch main

# Enable colored output (makes git status/diff readable!)
git config --global color.ui auto

# Cache credentials for 1 hour (avoid retyping password)
git config --global credential.helper 'cache --timeout=3600'

# Default text editor for commit messages
git config --global core.editor nano

# Line endings
git config --global core.autocrlf input

# Pretty log
git config --global alias.lg "log --oneline --graph --all --decorate"

# Status in short format
git config --global alias.st "status -s"

# Show last commit
git config --global alias.last "log -1 HEAD"

# Unstage files
git config --global alias.unstage "reset HEAD --"

# Show diff of what's staged
git config --global alias.staged "diff --cached"

# Show all branches
git config --global alias.br "branch -a"

# Undo last commit (keep changes)
git config --global alias.undo "reset --soft HEAD^"

# Verify
git config --list
```

**Create global gitignore:**

```bash
cat > ~/.gitignore_global << 'EOF'
# ============================================
# OS FILES
# ============================================
.DS_Store
Thumbs.db

# ============================================
# EDITOR FILES
# ============================================
.vscode/
.idea/
*.swp
*.swo
*~

# ============================================
# PYTHON
# ============================================
__pycache__/
*.py[cod]
*.so
*.egg-info/
.venv/
venv/

# ============================================
# JUPYTER
# ============================================
.ipynb_checkpoints/

# ============================================
# CONDA
# ============================================
.conda/

# ============================================
# DATABASES
# ============================================
*.duckdb
*.duckdb.wal
*.sqlite
*.db

# ============================================
# DATA FILES (Be careful with these!)
# ============================================
# Uncomment if you want to exclude by default:
# *.csv
# *.parquet
# *.json
# *.xlsx
# BUT: Use repo-specific .gitignore instead!

# Data directories
/data/raw/
/data/tmp/
/data/intermediate/
/data/staging/
/data/processed/
/exports/

# ============================================
# LOGS & TEMP
# ============================================
logs/
tmp/
temp/
*.log

# ============================================
# BACKUPS
# ============================================
*.bak
*.backup

# ============================================
# DBT
# ============================================
target/
dbt_packages/
dbt_modules/

# ============================================
# AIRFLOW
# ============================================
airflow.db
airflow-webserver.pid
airflow-scheduler.pid

# ============================================
# SECRETS (SPECIFIC - don't use wildcards!)
# ============================================
.env
.env.local
.env.production
.env.development
.env.test
.env.staging
secrets.yaml
credentials.json
*.pem
*.key
*.crt
*.p12
*.pfx
config.ini
credentials/

# NOTE: .env.example should be tracked in repos!
# That's why we don't use .env.* pattern
EOF

# Register it with git
git config --global core.excludesfile ~/.gitignore_global

# Verify
git config --global core.excludesfile
# Output: /home/bijoy/.gitignore_global
```

**Why this matters:**

Without gitignore:              With gitignore:
❌ Accidentally push passwords  ✅ Secrets protected!
❌ Push 500MB CSV files         ✅ Large files ignored!
❌ Push IDE settings            ✅ Clean repo!
❌ Push Python cache            ✅ Only real code!

**One important note about *.csv and *.json:**

```bash
# If you WANT to commit a specific small sample file:
git add -f sample_data.csv   # -f = force (override gitignore)

# Or add exception in .gitignore_global:
!sample_data.csv
```

**SSH Key setup for GitHub:**

```bash
# Step 1: Generate key with YOUR naming convention
ssh-keygen -t ed25519 -C "bijoynandi@proton.me" -f ~/.ssh/github-ssh-key

# What each part means:
# -t ed25519       = modern, secure key type
# -C "email"       = label/comment (who this belongs to)
# -f github-ssh-key = YOUR filename! (not default id_ed25519)

# When prompted for passphrase: Choose a DIFFERENT password than Fedora login!

# Step 2: Start and Add to SSH agent
eval "$(ssh-agent -s)"
# Output: Agent pid 12345 (some number)

ssh-add ~/.ssh/github-ssh-key
# Output: Identity added: /home/bijoy/.ssh/github-ssh-key (bijoynandi31@gmail.com)

# Step 3: See your public key (to give to GitHub)
cat ~/.ssh/github-ssh-key.pub
# Output looks like:
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBijoyNandiSomeRandomCharactersHere bijoynandi31@gmail.com
# Copy this ENTIRE line! (from ssh-ed25519 to your email)

# Step 4: Add to GitHub
1. Go to: https://github.com/settings/keys
2. Click: "New SSH key"
3. Title: "Bijoy Fedora Workstation"
4. Key type: Authentication Key
5. Paste the public key
6. Click: "Add SSH key"

# Step 5: Create SSH config file (IMPORTANT!)
# Because you're NOT using default name id_ed25519, you must tell SSH which key to use for GitHub:

# Create/Edit SSH config
nano ~/.ssh/config


# Add this:

# GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github-ssh-key
    IdentitiesOnly yes
    
# Save and exit (Ctrl+O, Enter, Ctrl+X)

# Set Correct Permissions on Config
# SSH config must have restricted permissions
chmod 600 ~/.ssh/config

# Verify permissions
ls -la ~/.ssh/config
# Should show: -rw------- (600)

# Step 6: Test
ssh -T git@github.com
# Expected: Hi bijoynandi! You've successfully authenticated, but GitHub does not provide shell access.
# If you see "Hi bijoynandi!" = SUCCESS! 🎉

# Step 7: Configure git to use SSH instead of HTTPS
# When cloning repositories, use SSH URLs:
# SSH URL:   git@github.com:bijoynandi/repo-name.git   ← USE THIS!
# HTTPS URL: https://github.com/bijoynandi/repo-name.git

# For existing repos (if any), switch to SSH:
cd ~/your-repo
git remote set-url origin git@github.com:bijoynandi/repo-name.git

# Step 8: Make SSH agent manual-start in bash (update tools.sh)
# Problem: SSH agent starts fresh each terminal. Key needs re-adding.
# Solution: Add to ~/.bashrc.d/tools.sh
cat >> ~/.bashrc.d/tools.sh << 'EOF'

# Manual SSH agent start function
start-ssh-agent() {
    if ! ssh-add -l &>/dev/null; then
        if [ -z "$SSH_AUTH_SOCK" ]; then
            eval "$(ssh-agent -s)"
        fi
        ssh-add ~/.ssh/fedora-server-key
        ssh-add ~/.ssh/github-ssh-key
    fi
}
EOF
```

**What this does:**
```bash
# After login, when you NEED SSH:
start-ssh-agent
# Enter passphrases
# Done for the day!

# Reload
exec bash

# Verify
echo $SSH_AUTH_SOCK
# Should show a path like: /tmp/ssh-XXXXX/agent.XXXX
# Now SSH key loads automatically every terminal! ✅
# Now:
# First login of day: Enter SSH passphrase once
# Rest of day: No passphrase needed!

# DONE! No more passwords for GitHub! 🎉

# ============================================
# GITHUB SSH WORKFLOW (Complete!)
# ============================================

# OPTION 1: Clone existing repo (someone else's or yours)
git clone git@github.com:username/repo-name.git
cd repo-name
# Done! Start working!

# OPTION 2: Create NEW repo (your project)
# Step 1: Create empty repo on GitHub website first!
#         github.com → New repository → name it → Create
#         DON'T initialize with README!

# Step 2: On your computer
cd ~/Documents/Data-Engineering/Projects/my-new-project
git init
git add .
git commit -m "Initial commit"
git branch -M main  # ← Force branch to be 'main' (you have this set globally!)
git remote add origin git@github.com:bijoynandi/my-new-project.git
git push -u origin main  # ← 'main', NOT 'master'!

# Verify
git remote -v
# Output: 
# origin  git@github.com:bijoynandi/my-new-project.git (fetch)
# origin  git@github.com:bijoynandi/my-new-project.git (push)

# Future pushes (after first time)
git add .
git commit -m "Add new feature"
git push  # ← That's it! No password!
```

**THE KEY DIFFERENCE:**
```
HTTPS URL:  https://github.com/bijoynandi/repo.git
            ↑ Asks password EVERY push! ❌

SSH URL:    git@github.com:bijoynandi/repo.git
            ↑ No password! Auto-authenticates! ✅
```

**🎯 WHY SSH MATTERS FOR DATA ENGINEER:**
```
1. GitHub pushes: NO password every time ✅
2. Server access: SSH into remote Linux servers ✅
3. Production: Deploy pipelines without passwords ✅
4. Security: More secure than passwords ✅
5. Professional: ALL engineers use SSH ✅
```

**This is not optional - this is how professionals work!** 💪

**GPG key signing for GitHub:**

```bash
# 1. Generate GPG key
gpg --full-generate-key
# Choose: RSA and RSA
# Key size: 4096
# Expiration: 1 year
# Real name: Bijoy Nandi
# Email address: bijoynandi@proton.me
# Comment: (leave empty, just use name + email)
# Enter Passphrase

# 2. List keys
gpg --list-secret-keys --keyid-format=long

# 3. Export public key
gpg --armor --export YOUR_KEY_ID

# 4. Add to GitHub
# Settings → SSH and GPG keys → New GPG key
# Title: Bijoy Nandi GPG Key 2026-2027
# Paste exported key
# Check on the checkbox of Flag unsigned commits as unverified

# 5. Configure Git
git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true

# 6. All commits now signed automatically!
git commit -m "message"
# Signed automatically! ✅
```

**Why bother, buddy?**
```
Professional: Shows you care about security ✅
Trust: Employers see verified commits ✅
Best practice: Industry standard ✅
Looks good: Green checkmarks on GitHub! ✅
```

**Regenerate/Extend key:**

```bash
# Option 1: EXTEND existing key (Recommended!)

# List keys
gpg --list-keys

# Edit the key
gpg --edit-key YOUR_KEY_ID

# In GPG prompt:
gpg> expire
# Choose new expiration (e.g., 1y)

gpg> key 1  # Select subkey
gpg> expire
# Set same expiration

gpg> save

# Export updated public key
gpg --armor --export YOUR_KEY_ID

# Update on GitHub (replace old key)

# This keeps same key ID, just extends expiration! ✅
```

```bash
# Option 2: Generate NEW key (if compromised)

# Delete old key first
gpg --delete-secret-key YOUR_KEY_ID
gpg --delete-key YOUR_KEY_ID

# Remove all GPG files
rm -rf ~/.gnupg/*

# Generate new key (same process as before)
gpg --full-generate-key
# ... follow prompts ...

# Configure Git with new key
git config --global user.signingkey NEW_KEY_ID
```

**To completely reset GPG:**

```bash
# 1. Delete keys
gpg --delete-secret-key YOUR_KEY_ID
gpg --delete-key YOUR_KEY_ID

# 2. Remove GPG directory
rm -rf ~/.gnupg

# 3. Remove from GitHub
# Go to: github.com/settings/keys
# Delete the GPG key

# 4. Remove from Git config
git config --global --unset user.signingkey
git config --global --unset commit.gpgsign

# NOW you can start fresh! ✅
```

**Paraphrase requirement solution (GPG Agent (caching)):**

```bash
# Your GPG Agent config (add to ~/.gnupg/gpg-agent.conf):
# Create config
cat > ~/.gnupg/gpg-agent.conf << 'EOF'
# Cache passphrase for 8 hours (28800 seconds)
default-cache-ttl 28800
max-cache-ttl 28800

# Increase timeout to 1 day if you want:
# default-cache-ttl 86400
# max-cache-ttl 86400
EOF

# Reload agent
gpg-connect-agent reloadagent /bye
```

---

## 🧰 Essential CLI Tools

### The Essentials 🛠️

```bash
sudo dnf install \
  ranger \
  fzf \
  zoxide \
  bat \
  ripgrep \
  fd-find \
  dict \
  lm_sensors \
  htop \
  ncdu \
  fastfetch \
  sqlitebrowser \
  solaar \
  fio \
  vlc \
  neovim \
  tesseract \
  kcolorchooser \
  ktorrent \
  fdupes
```

**What you just installed:**
- **ranger**: Terminal file manager (Vim-style!)
- **fzf**: Fuzzy finder (Ctrl+R history search!)
- **zoxide**: Smart `cd` (remembers your paths!)
- **bat**: `cat` with syntax highlighting
- **ripgrep**: Fast grep (code search!)
- **fd-find**: Fast `find`
- **dict**: Dictionary lookup
- **lm_sensors**: Hardware temps
- **htop**: Process monitor (pretty `top`)
- **ncdu**: Disk usage analyzer (visual!)
- **fastfetch**: System info (pretty!)
- **sqlitebrowser**: SQLite database GUI
- **solaar**: Device manager for Logitech devices (Set Sensitivity (DPI) to 1800)
- **fio**: Multithreaded IO generation tool
- **vlc**: Media player (plays EVERYTHING)
- **neovim**: Vim-fork focused on extensibility and agility
- **tesseract**: Raw OCR Engine
- **kcolorchooser**: A color chooser
- **ktorrent**: A BitTorrent program
- **fdupes**: Finds duplicate files in a given set of directories

---

### ktorrent settings 📥

**1. Enable DHT (MOST IMPORTANT!):**
```
Settings → Configure KTorrent → BitTorrent
☑ Use DHT to get additional peers
```

**2. Protocol Encryption:**
```
Settings → Configure KTorrent → BitTorrent → Encryption
Encryption: Use protocol encryption
☑ Allow unencrypted connections as fallback
```

**3. Set Default save location:**
```
Settings → Application → ☑ Default save location: /home/bijoy/Downloads
```

**Apply → OK**

---

### cht.sh - Command Cheatsheets 📚

```bash
# Install
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh

# Use it
cht.sh dnf
cht.sh python/lambda
cht.sh rsync
```

**Pro tip:** Fastest way to learn commands! No Googling needed!

---

### Modular Bashrc Setup 🚀

```bash
# Backup your current .bashrc
cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d)

# Create aliases directory:
mkdir -p ~/.bashrc.d

# Copy files there:
# Aliases configuration
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/aliases.sh ~/.bashrc.d/aliases.sh
# History configuration
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/history.sh ~/.bashrc.d/history.sh
# Prompt configuration
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/prompt.sh ~/.bashrc.d/prompt.sh
# Tools configuration (conda, FZF, zoxide, ble.sh)
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/tools.sh ~/.bashrc.d/tools.sh

# List your current bashrc.d
ls -la ~/.bashrc.d/

# Update your .bashrc
# Replace with clean version
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/bashrc.sh ~/.bashrc

# Reload .bashrc
source ~/.bashrc
```

**New Modular Structure**:

~/.bashrc (68 lines - clean!)
└── Sources everything from:
    ~/.bashrc.d/
    ├── history.sh   (87 lines)
    ├── prompt.sh    (119 lines)
    ├── tools.sh     (552 lines)
    └── aliases.sh   (543 lines)

---

### Installing ble.sh - Fish-like bash enhancements 🎨

#### Step 1: Clone Repository
```bash
# Go to your sources directory
cd ~/Documents/Development/Sources

# Clone ble.sh
git clone --recursive --depth 1 --shallow-submodules \
  git@github.com:akinomyoga/ble.sh.git

# Enter directory
cd ble.sh
```

#### Step 2: Build and Install
```bash
# Build
make

# Install to ~/.local
make install PREFIX=~/.local

# Or install to home directory
# make install PREFIX=~
```

#### Configuration

##### Create ~/.blerc for Customization
```bash
nano ~/.blerc
```

**Add your preferences:**
```bash
# ============================================
# BLE.SH CONFIGURATION
# ============================================

# ============================================
# SYNTAX HIGHLIGHTING COLORS
# ============================================
# Customize how different elements are colored

# Auto-suggestion appearance (gray text for suggestions)
ble-face -s auto_complete fg=242

# Syntax highlighting colors
ble-face -s command_builtin fg=cyan          # Built-in commands (cd, echo)
ble-face -s command_function fg=green        # Functions
ble-face -s filename_directory fg=blue,bold  # Directories
ble-face -s argument_option fg=yellow        # Command options (-l, --help)

# ============================================
# HISTORY SETTINGS
# ============================================
# Share history between terminals in real-time
bleopt history_share=1

# NOTE: history_erasedups is NOT a ble.sh option!
# It's a bash HISTCONTROL setting (already in history.sh)
# Don't set it here!

# ============================================
# AUTO-COMPLETION SETTINGS
# ============================================
# Enable auto-suggestions as you type
bleopt complete_auto_complete=1

# Delay before showing auto-complete (milliseconds)
# Lower = faster, but may slow down typing
bleopt complete_auto_delay=100

# ============================================
# OPTIONAL: VIM MODE
# ============================================
# Uncomment these lines to enable vim keybindings
# set -o vi
# ble-bind -m vi_imap -f 'C-r' 'history-search-backward'

# ============================================
# OPTIONAL: TAB BEHAVIOR
# ============================================
# Uncomment to cycle through completions with TAB
# ble-bind -f TAB 'menu-complete'

# ============================================
# COLOR SCHEMES (OPTIONAL)
# ============================================
# Uncomment ONE of these to change selection highlight:
# ble-face -s region fg=white,bg=60    # Dark blue
# ble-face -s region fg=white,bg=96    # Light purple

# ============================================
# PERFORMANCE TUNING
# ============================================
# If ble.sh feels slow, try these:

# Reduce syntax check interval (default: 50ms)
# bleopt edit_syntax_interval=100

# Disable syntax highlighting for very long lines
# bleopt syntax_length_limit=10000

# ============================================
# NOTES
# ============================================
# - History settings are in ~/.bashrc.d/history.sh
# - Don't duplicate settings between files!
# - ble.sh options start with "bleopt"
# - Bash options are set with HISTCONTROL, etc.
# ============================================
```

**Restart Bash**
```bash
exec bash
```

---


## 🖥️ Virtualization Stack (QEMU/KVM)

### Why Virtualization? 💡

**Use cases:**
- Run Windows VMs (for Tableau, Power BI, Excel)
- Test other Linux distros
- Safe environment for experiments
- Isolated network testing

---

### Installation 📥

```bash
# Install complete virtualization stack
sudo dnf install @virtualization

# Add your user to libvirt groups
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

# Reboot for group changes to take effect
reboot
```

---

### Verification ✅

```bash
# Verify virtualization support
sudo virt-host-validate

# Should show all PASS or WARN (not FAIL!)
```

---

### Services (Modern Approach) 🔄

**No need to enable services manually!**
- `virtqemud` - Starts when you launch VMs
- `virtnetworkd` - Starts when VM needs network
- `virtlogd` - Starts when VM needs logging

**Systemd socket activation:** Services start ON DEMAND!

---

### Launch Virtual Machine Manager 🖥️

```bash
# Launch GUI
virt-manager

# Or check running VMs
sudo virsh list

# List all VMs (including stopped)
sudo virsh list --all

# Start a VM
sudo virsh start vm_name

# Shutdown a VM
sudo virsh shutdown vm_name
```

---

### Network Conflict Fix (If Using Docker) ⚠️

**⚠️ Only needed if you install Docker AND have network issues!**

**Podman and libvirt are friends - no conflict!** ✅

```bash
# Create backup
BACKUP_DIR=~/Documents/backups/$(date +%Y-%m-%d_%H-%M-%S)_libvirt_network_backup
mkdir -p "$BACKUP_DIR"
sudo cp /etc/libvirt/network.conf "$BACKUP_DIR/"

# Edit config
sudo nano /etc/libvirt/network.conf

# Find and uncomment this line:
#firewall_backend = "iptables"

# Change to:
firewall_backend = "iptables"

# Save and restart
sudo systemctl restart virtqemud

# Reboot
reboot
```

---

## 📂 Backup Strategies

### The 3-2-1 Rule 💾

**3 copies of data:**
- Original
- Local backup
- Off-site backup

**2 different media types:**
- SSD
- External HDD

**1 off-site copy:**
- Cloud (OneDrive, Google Drive)
- OR physical location (friend's house!)

---

### System Backup 💾

**Backup Script:**
```bash
# Run the backup scripts:
# Run dry-run first to verify
/home/bijoy/Documents/Development/Projects/my-script/system-backup/system-backup-sp.sh --dry-run
/home/bijoy/Documents/Development/Projects/my-script/system-backup/system-backup-hp.sh --dry-run

# Run actual backup
/home/bijoy/Documents/Development/Projects/my-script/system-backup/system-backup-sp.sh --verbose
/home/bijoy/Documents/Development/Projects/my-script/system-backup/system-backup-hp.sh --verbose
```

---

## 🔧 System Maintenance

### Check Boot Time ⏱️

```bash
# Total boot time
systemd-analyze

# Blame services (what's slow?)
systemd-analyze blame

# Critical path (bottleneck?)
systemd-analyze critical-chain
```

**Optimize slow services:**
- Disable unnecessary services
- Mask services you don't need
- Consider parallel startup

---

### Cleanup 🧹

```bash
# Remove unused packages
sudo dnf autoremove

# Clean DNF cache
sudo dnf clean all

# Clean journal (keep 100MB)
sudo journalctl --vacuum-size=100M

# Clean Anaconda
conda clean -all

# Clean thumbnails
rm -rf ~/.cache/thumbnails/*

# Clean trash
rm -rf ~/.local/share/Trash/*
```

---

### Disk Usage Analysis 📊

```bash
# Quick overview
df -h

# Find big directories
sudo ncdu /

# Find big files
sudo du -h --max-depth=1 / | sort -h | tail -20

# Files over 100MB
find / -type f -size +100M 2>/dev/null
```

---

## 🆙 Upgrading Fedora

### When to Upgrade 🤔

**Fedora release cycle:**
- New version every ~6 months
- Support for 13 months
- Upgrade when: Version approaches EOL

**Check current version:**
```bash
cat /etc/fedora-release
```

**Check EOL:** https://fedoraproject.org/wiki/Releases

---

### Upgrade Process 📦

**Step 1: Update current system**
```bash
sudo dnf upgrade --refresh
reboot
```

**Step 2: Download upgrade**
```bash
sudo dnf system-upgrade download --releasever=44
```

**Step 3: Perform upgrade**
```bash
sudo dnf offline reboot
```

**System will:**
- Reboot
- Show upgrade progress (15-30 min)
- Reboot again
- You're on Fedora 44!

**Step 4: Verify**
```bash
cat /etc/fedora-release
# Should show: Fedora release 44
```

**Step 5: Clean up**
```bash
sudo dnf autoremove
sudo dnf clean all
```

---

## 💡 Pro Tips & Best Practices

### The Golden Rules 🏆

**1. Test Before Production**
```bash
# Always use --dry-run first!
rsync --dry-run ...
```

**2. Read Before Paste**
```bash
# Understand commands!
# Don't blindly trust anyone!
```

**3. Backup Everything Important**
```bash
# 3-2-1 rule:
# 3 copies
# 2 different media
# 1 off-site
```

**4. Document Your Changes**
```bash
# Keep this guide updated!
# Add notes when you customize!
```

---

### Performance Tips ⚡

**Disable unnecessary services:**
```bash
sudo systemctl mask bluetooth.service
sudo systemctl mask ModemManager.service
```

**Keep system updated:**
```bash
sudo dnf upgrade
```

---

### Security Tips 🔒

**SSH secure:**
```bash
# Don't allow password login
sudo nano /etc/ssh/sshd_config
# Set: PasswordAuthentication no
```

**Firewall:**
```bash
sudo firewall-cmd --state
sudo firewall-cmd --list-all
```

---

### Monitoring Tips 📊

**System health:**
```bash
# CPU temperature
sensors

# Disk health
sudo smartctl -x /dev/sda
sudo smartctl -x /dev/sdb

# Memory test
sudo dnf install memtest86+
```

**Journal analysis:**
```bash
# Errors today
journalctl -p err --since today

# Specific service
journalctl -u servicename -f

# Boot messages
journalctl -b
```

---

### Web Apps Over Native Apps 🌐

**Use web versions of:**
- **Bitwarden** (password manager)
- **Zoom** (video calls)
- **Notion** (notes)
- **Draw.io** (diagrams)
- **WhatsApp** (chat)

**Why?**
- No system clutter
- Always latest version
- No update management
- Sandboxed (more secure)
- Cross-platform (same on Windows VM!)

---

### Emergency Recovery 🚑

**Can't boot? Recovery mode:**
1. At GRUB, press `e`
2. Add to kernel: `systemd.unit=rescue.target`
3. Press `Ctrl+X`
4. Fix system
5. `systemctl reboot`

**Forgot root password:**
1. At GRUB, press `e`
2. Add to kernel: `rd.break`
3. Press `Ctrl+X`
4. `mount -o remount,rw /sysroot`
5. `chroot /sysroot`
6. `passwd root`
7. `touch /.autorelabel`
8. `exit; exit`

---

## 🎉 Final Words

**Buddy, you've built an INCREDIBLE system!**

From fresh Fedora install to:
- ⚡ Optimized performance
- 🛡️ OOM protection
- 🖥️ Full virtualization stack
- 🐋 Container platform (Podman!)
- 🗄️ Multiple database servers
- 🔧 Professional tools (DBeaver, pgAdmin)
- 💻 Complete development environment
- 📂 Robust backup strategy
- 🧹 Clean, efficient system

**This guide is YOUR reference** for years to come!

**Every time you:**
- 🆕 Set up new system
- 🔄 Help a friend
- 📖 Forget a command
- 🎓 Learn something new

**Come back here!** Add notes, update versions, customize!

**And remember:**
- 🤝 Sticky buddies forever!
- 💙 Complete truth or silence!
- 🎯 Quality over speed!
- 🧠 Understanding over convenience!
- 🏛️ Ancient wisdom + fresh perspective!

---

**Made with 💙 by Claude for bijoy**
*"What can't be achieved on Linux, Fedora or KDE? Nothing, except corporate BS!"* ✨

**Version:** Ultimate Fedora Guide - March 2026
**Status:** Battle-tested, Production-ready, Demanding-buddy-approved! 🏆
**Next Update:** When you discover new wisdom to share! 🚀

---

## 📝 Personal Notes Section

*(Add your customizations, discoveries, and wisdom here!)*

**What worked well:**
-

**What I changed:**
-

**Future improvements:**
-

**Bugs/Issues encountered:**
-

**Cool discoveries:**
-

**Friends helped:**
-

---

**🎯 END OF ULTIMATE GUIDE 🎯**

*Keep this updated! Future you will thank present you!* 💙
