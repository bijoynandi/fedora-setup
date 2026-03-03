# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# ============================================
# MODULAR CONFIGURATION
# ============================================
# All custom configurations are in ~/.bashrc.d/
# This keeps .bashrc clean and organized!
#
# SETUP INSTRUCTIONS:
# -------------------
# 1. Create bashrc.d directory (if not exists):
#    mkdir -p ~/.bashrc.d
#
# 2. Backup your current .bashrc
# cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d)
#
# 3. Update your .bashrc
# Replace with clean version
# cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/bashrc.sh ~/.bashrc

# 4. Reload .bashrc
# source ~/.bashrc
#
# 5. Files loaded (in order):
#   1. history.sh  - History configuration
#   2. prompt.sh   - Ultimate bash prompt
#   3. tools.sh    - conda, FZF, zoxide, DuckDB, BLE.SH
#   4. aliases.sh  - All bash aliases
#
# 6. To disable a file, rename it (add .disabled OR .bak):
#   mv ~/.bashrc.d/aliases.sh ~/.bashrc.d/aliases.sh.disabled
# OR,
#   mv ~/.bashrc.d/aliases.sh ~/.bashrc.d/aliases.sh.bak
#
# 7. To re-enable:
#   mv ~/.bashrc.d/aliases.sh.disabled ~/.bashrc.d/aliases.sh
# OR,
#   mv ~/.bashrc.d/aliases.sh.bak ~/.bashrc.d/aliases.sh
# ============================================

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        # Skip files ending in .disabled, .bak, or ~
        if [[ "$rc" == *.disabled ]] || [[ "$rc" == *.bak ]] || [[ "$rc" == *~ ]]; then
            continue
        fi
        # Only source if it's a regular file
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
