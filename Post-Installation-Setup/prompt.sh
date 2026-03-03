# ========================================
# 🚀 ULTIMATE BASH PROMPT
# Beautiful Two-Line Prompt with Git Support
# ========================================
#
# SETUP INSTRUCTIONS:
# -------------------
# 1. Create bashrc.d directory (if not exists):
#    mkdir -p ~/.bashrc.d
#
# 2. Copy this file:
#    cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/prompt.sh ~/.bashrc.d/prompt.sh
#
# 3. Reload bash:
#    source ~/.bashrc
#
# Your ~/.bashrc already sources ~/.bashrc.d/* automatically!
# ========================================

# Git branch parser
# Returns the current git branch name
parse_git_branch() {
    git branch 2>/dev/null | grep '^*' | sed 's/* //'
}

# Prompt builder (captures exit code correctly!)
build_prompt() {
    # CRITICAL: Capture exit code FIRST!
    local EXIT="$?"

    # Start building PS1
    PS1=""

    # Top line (green brackets)
    PS1+="\[\e[38;5;35m\]╭─"

    # Time (cyan)
    PS1+="[\[\e[38;5;38m\]\t\[\e[38;5;35m\]]─"

    # Exit code with dynamic color!
    if [ $EXIT -eq 0 ]; then
        PS1+="[\[\e[38;5;38m\]${EXIT}\[\e[38;5;35m\]]─"  # Cyan for success
    else
        PS1+="[\[\e[38;5;196m\]${EXIT}\[\e[38;5;35m\]]─"  # Red for error
    fi

    # Username@hostname (cyan)
    PS1+="[\[\e[38;5;38m\]\u@\h\[\e[38;5;35m\]]─"

    # Directory (cyan)
    PS1+="[\[\e[38;5;38m\]\w\[\e[38;5;35m\]]"

    # Git branch (orange, conditional!)
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local BRANCH=$(parse_git_branch)
        if [ -n "$BRANCH" ]; then
            PS1+="─[\[\e[38;5;214m\]${BRANCH}\[\e[38;5;35m\]]"
        fi
    fi

    # Newline
    PS1+="\n"

    # Bottom line with dynamic emoji
    PS1+="\[\e[38;5;35m\]╰─"
    if [ $EXIT -eq 0 ]; then
        PS1+="🚀 "  # Success!
    else
        PS1+="💥 "  # Error!
    fi

    # Reset colors
    PS1+="\[\e[0m\]"
}

# Enable our prompt function!
# Note: history.sh also uses PROMPT_COMMAND
# If history.sh is loaded first, this will work together with it
if [[ "$PROMPT_COMMAND" != *"build_prompt"* ]]; then
    PROMPT_COMMAND="build_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi

# ========================================
# CUSTOMIZATION OPTIONS
# ========================================
# Change colors by modifying these values:
#   38;5;35  = Green (brackets)
#   38;5;38  = Cyan (time, user, directory)
#   38;5;196 = Red (error exit code)
#   38;5;214 = Orange (git branch)
#
# Success emoji: 🚀
# Error emoji: 💥
#
# To change emojis, edit the PS1+= lines above
#
# Color reference:
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# ========================================

# ========================================
# USAGE TIPS
# ========================================
# Your prompt shows:
# - Current time (HH:MM:SS)
# - Exit code (0 = success, non-zero = error)
# - Username@hostname
# - Current directory (full path)
# - Git branch (if in a git repo)
# - Status emoji (🚀 success, 💥 error)
#
# The exit code changes color:
# - Cyan = last command succeeded
# - Red = last command failed
#
# The emoji changes too:
# - 🚀 = ready for next command!
# - 💥 = something went wrong!
# ========================================
