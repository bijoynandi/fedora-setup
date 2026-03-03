# 🎨 INSTALLING BLE.SH - FISH-LIKE BASH ENHANCEMENTS
## Transform Your Bash into a Modern Shell!

**What is ble.sh?**
- Bash Line Editor enhancement
- Adds fish-like features to bash
- Syntax highlighting in real-time
- Auto-suggestions from history
- Better tab completion
- Stays 100% compatible with bash

---

## 📦 INSTALLATION

### Step 1: Clone Repository
```bash
# Go to your sources directory
cd ~/Documents/Development/Sources

# Clone ble.sh
git clone --recursive --depth 1 --shallow-submodules \
  git@github.com:akinomyoga/ble.sh.git

# Enter directory
cd ble.sh
```

### Step 2: Build and Install
```bash
# Build
make

# Install to ~/.local
make install PREFIX=~/.local

# Or install to home directory
# make install PREFIX=~
```

### Step 3: Enable in Bashrc
```bash
# Add to ~/.bashrc.d/tools.sh (at the END)
nano ~/.bashrc.d/tools.sh

# Add these lines at the end:
# ============================================
# BLE.SH (Bash Line Editor)
# ============================================
# Fish-like syntax highlighting and auto-suggestions
[[ $- == *i* ]] && [[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh
```

### Step 4: Reload Bash
```bash
source ~/.bashrc
```

**DONE!** ✅

---

## 🎨 WHAT YOU GET

### 1. Syntax Highlighting
```bash
# As you type, colors appear:
ls -la          # Command in green, flags in cyan
cd /etc/passwd  # Valid paths in blue, invalid in red
git status      # Keywords highlighted
```

### 2. Auto-Suggestions
```bash
# Type partial command, suggestion appears in gray
git st          # Shows: git status (from history)
              # Press → (right arrow) to accept!

cd Doc          # Shows: cd Documents
              # Press → to accept!
```

### 3. Better Tab Completion
```bash
# Enhanced completion menu
git <TAB>       # Beautiful menu of git commands
systemctl <TAB> # Organized service list
```

### 4. Multiline Editing
```bash
# Edit long commands across multiple lines
# Syntax highlighting works across lines!
```

---

## ⚙️ CONFIGURATION

### Create ~/.blerc for Customization
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

---

## 🎯 USAGE TIPS

### Auto-Suggestions
```bash
# Type command → gray suggestion appears
git status      # Suggested from history
↓
git st|atus     # Cursor here, suggestion in gray
     ↑ Press → (right arrow) to accept
     ↑ Keep typing to ignore
     ↑ Press End key to accept
```

### History Search
```bash
# Better than Ctrl+R!
Ctrl+R          # Opens FZF history (if installed)
# OR
Ctrl+R Ctrl+R   # ble.sh history search

# While typing:
# Up/Down arrows search history matching current input
```

### Syntax Highlighting
```bash
# Commands you type are colored real-time:
✅ Green  = Valid command
❌ Red    = Invalid command
🔵 Blue   = File/directory path
🟡 Yellow = Options/flags
🟢 Cyan   = Built-in commands
```

### Tab Completion
```bash
# Enhanced completion:
git <TAB>       # Beautiful menu
ls ~/Do<TAB>    # Completes to ~/Documents

# Navigate completion:
TAB             # Next option
Shift+TAB       # Previous option
Enter           # Select
Esc             # Cancel
```

---

## 🛠️ MAINTAINING BLE.SH

### Update ble.sh

```bash
cd ~/Documents/Development/Sources/ble.sh

# Pull latest changes
git pull

# Update submodules
git submodule update --init --recursive

# Rebuild
make clean
make

# Reinstall
make install PREFIX=~/.local

# Reload bash
source ~/.bashrc
```

### Remove ble.sh

```bash
# Uninstall
rm -rf ~/.local/share/blesh
rm -rf ~/.local/share/doc/blesh

# Remove from tools.sh (comment out or delete):
nano ~/.bashrc.d/tools.sh
# Comment out the ble.sh line:
# [[ $- == *i* ]] && [[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

# Reload
source ~/.bashrc

# Optional: Remove source code
rm -rf ~/Documents/Development/Sources/ble.sh
```

### Check version

```bash
# In bash with ble.sh loaded:
echo $BLE_VERSION
# Or:
ble-version
```

### Check what's installed

```bash
# Files installed:
ls -la ~/.local/share/blesh/

# Documentation:
ls -la ~/.local/share/doc/blesh/
```

### General compiled software maintenance

```bash
# For most software

# Update
cd ~/Documents/Development/Sources/software-name
git pull
make clean
make
sudo make install  # Or: make install PREFIX=~/.local

# Remove
# If it has uninstall:
sudo make uninstall  # Or: make uninstall

# Manual removal:
# Find where it installed:
which software-name
# Then remove files in that location

# Remove source:
rm -rf ~/Documents/Development/Sources/software-name

# Check installation
which software-name
software-name --version
```

---

## 🔧 TROUBLESHOOTING

### Slow Startup?
```bash
# ble.sh can be slow on first load
# Solution: Use lazy loading

# In ~/.bashrc.d/tools.sh, replace:
# [[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

# With:
if [[ -f ~/.local/share/blesh/ble.sh ]]; then
    # Lazy load - faster startup
    source ~/.local/share/blesh/ble.sh --attach=none
    ((_ble_bash)) && ble-attach
fi
```

### Disable Temporarily
```bash
# Start bash without ble.sh
bash --norc

# Or disable in bashrc:
mv ~/.bashrc.d/tools.sh ~/.bashrc.d/tools.sh.disabled
```

### Conflicts with Other Tools
```bash
# If ble.sh conflicts with fzf or other tools:
# Load ble.sh LAST in tools.sh
# Move the ble.sh source to the end of the file
```

---

## 🆚 COMPARISON

### ble.sh vs Fish Shell

| Feature | ble.sh (Bash) | Fish Shell |
|---------|---------------|------------|
| Syntax highlighting | ✅ Yes | ✅ Yes |
| Auto-suggestions | ✅ Yes | ✅ Yes |
| Bash compatibility | ✅ 100% | ❌ No |
| Script compatibility | ✅ All bash scripts work | ❌ Different syntax |
| Learning curve | ✅ None (it's bash!) | ⚠️ New syntax to learn |
| Performance | ✅ Fast | ✅ Fast |
| Customization | ✅ Extensive | ✅ Extensive |

### ble.sh vs zsh + oh-my-zsh

| Feature | ble.sh (Bash) | Zsh + oh-my-zsh |
|---------|---------------|-----------------|
| Syntax highlighting | ✅ Yes | ✅ Yes (plugin) |
| Auto-suggestions | ✅ Yes | ✅ Yes (plugin) |
| Bash compatibility | ✅ 100% | ⚠️ Mostly |
| Plugin ecosystem | ⚠️ Limited | ✅ Huge |
| Setup complexity | ✅ Simple | ⚠️ Complex |
| Resource usage | ✅ Light | ⚠️ Heavier |

---

## 🎊 CONCLUSION

**ble.sh gives you:**
- ✅ Fish-like features in bash
- ✅ No need to learn new shell
- ✅ All your bash knowledge still applies
- ✅ All your bash scripts still work
- ✅ Beautiful, modern terminal experience

**Perfect for:**
- Bash users who want fish features
- People who value bash compatibility
- Those who don't want to relearn everything

---

## 📚 ADDITIONAL RESOURCES

**Official Documentation:**
- GitHub: https://github.com/akinomyoga/ble.sh
- Wiki: https://github.com/akinomyoga/ble.sh/wiki

**Configuration Examples:**
- Sample configs: https://github.com/akinomyoga/ble.sh/wiki/Manual-%C2%A71-Introduction

**Video Tutorial:**
- Search YouTube: "ble.sh bash"

---

## 🎯 ALTERNATIVE: SIMPLER OPTION

**If ble.sh is too much, try hstr instead:**

```bash
# Install
sudo dnf install hstr

# Configure
hstr --show-configuration >> ~/.bashrc.d/tools.sh

# Reload
source ~/.bashrc

# Use
Ctrl+R  # Beautiful history search!
```

**hstr is:**
- ✅ Lighter than ble.sh
- ✅ Just enhances history search
- ✅ Very fast
- ✅ Easy to configure

---

**Choose what fits your needs!**
- Want everything? → **ble.sh**
- Just better history? → **hstr**
- Happy as-is? → **Keep current setup!**

**You've already done MASSIVE improvements!** 🏆
**Any of these is just icing on the cake!** 🎂

---

**End of Guide**
