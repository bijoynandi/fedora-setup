# ============================================
# BASH HISTORY CONFIGURATION
# Smart History Management
# ============================================
#
# SETUP INSTRUCTIONS:
# -------------------
# 1. Create bashrc.d directory (if not exists):
#    mkdir -p ~/.bashrc.d
#
# 2. Copy this file:
#    cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/history.sh ~/.bashrc.d/history.sh
#
# 3. Reload bash:
#    source ~/.bashrc
#
# 4. Verify:
#    echo $HISTSIZE
#    echo $HISTFILESIZE
# Should show: 10000 and 20000
#
# Your ~/.bashrc already sources ~/.bashrc.d/* automatically!
# ============================================

# History size (10,000 in memory, 20,000 on disk)
HISTSIZE=10000
HISTFILESIZE=20000

# Save history immediately (don't wait for exit)
# Note: PROMPT_COMMAND is also used by prompt.sh
# We append to it so both work together!
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# Avoid duplicates and lines starting with space
HISTCONTROL=ignoreboth:erasedups

# Ignore simple commands (saves space!)
# These commands won't clutter your history
HISTIGNORE="ls:ll:la:l:l.:cd:z:..:...:pwd:clear:c:cls:history:exit"

# Add timestamp to history (YYYY-MM-DD HH:MM:SS)
# Useful for tracking when commands were run
HISTTIMEFORMAT="%F %T "

# Append to history file (don't overwrite!)
# Multiple terminals won't conflict
shopt -s histappend

# ============================================
# USAGE TIPS
# ============================================
# Interactive search (with fzf if installed)
# Ctrl+R
# Type: postgres
# Shows recent postgres commands
# Ctrl+R again = older results
# Enter = run command
#
# View history with timestamps:
#   history
#
# Search with grep:
#   history | grep rsync
#   history | grep systemctl
#   history | grep docker
#
# Find by date (with timestamps!):
#   history | grep "2026-04-15"
#
# Find last N commands:
#   history | tail -50
#   history 20
#
# Re-run command by number:
#   !12345  # Re-run command #12345
#   !!      # Re-run last command
#   !-2     # Re-run 2 commands ago
#
# Clear all history from current session:
#   history -c
#
# Clear specific entries:
# history -d 12345  # Delete command #12345
#
# Clear history file:
#   cat /dev/null > ~/.bash_history
# ============================================
