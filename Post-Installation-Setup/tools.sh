# ============================================
# MODERN TOOLS CONFIGURATION
# Conda, FZF, Zoxide, DuckDB, ble.sh Integration
# ============================================
#
# SETUP INSTRUCTIONS:
# -------------------
# 1. Create bashrc.d directory (if not exists):
#    mkdir -p ~/.bashrc.d
#
# 2. Copy this file:
#    cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/tools.sh ~/.bashrc.d/tools.sh
#
# 3. Reload bash:
#    source ~/.bashrc
#
# Your ~/.bashrc already sources ~/.bashrc.d/* automatically!
# ============================================

# ============================================
# CONDA (Anaconda/Miniconda) - LAZY LOADING
# ============================================
# Python environment manager
# Lazy loading: Conda only initializes when you use it!
# This saves ~0.5-1 second on shell startup!
#
# FRESH CONDA INSTALLATION:
# -------------------------
# When installing new Anaconda/Miniconda:
# 1. Say YES to "conda init"
# 2. It will write to ~/.bashrc
# 3. After conda installation adds to .bashrc:
# cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/bashrc.sh ~/.bashrc
# source ~/.bashrc
# This overwrites .bashrc with our clean version
# tools.sh handles conda with lazy loading! ✅
# Conda only initializes when you actually use it!
# This keeps bash startup fast!

# Conda function that initializes on first use

conda() {
    # Remove this placeholder function
    unset -f conda

    # CRITICAL FIX: Remove ALL anaconda paths first to prevent duplicates
    # This is needed because PATH might be inherited from parent shell
    local new_path=""
    IFS=':' read -ra PATH_ARRAY <<< "$PATH"
    for dir in "${PATH_ARRAY[@]}"; do
        # Skip any directory containing "anaconda3"
        if [[ ! "$dir" =~ anaconda3 ]]; then
            if [ -z "$new_path" ]; then
                new_path="$dir"
            else
                new_path="$new_path:$dir"
            fi
        fi
    done
    export PATH="$new_path"

    # Initialize conda properly
    local conda_path="/home/bijoy/anaconda3/bin/conda"

    if [ -f "$conda_path" ]; then
        # Run conda's initialization (this adds anaconda3/bin and anaconda3/condabin)
        eval "$("$conda_path" 'shell.bash' 'hook' 2> /dev/null)"
    fi

    # Now run the actual conda command
    if command -v conda &> /dev/null; then
        conda "$@"
    else
        echo "Error: Conda initialization failed!"
        return 1
    fi
}

# ============================================
# FZF (Fuzzy Finder)
# ============================================
# Fast fuzzy file/command finder
# Keybindings:
#   Ctrl+R: Search command history
#   Ctrl+T: Search files in current directory
#   Alt+C:  Change directory (fuzzy search)

if [[ -f /usr/share/fzf/shell/key-bindings.bash ]]; then
    source /usr/share/fzf/shell/key-bindings.bash
fi

# Limit search scope (performance + relevance)
# Exclude common directories that slow down search
export FZF_CTRL_T_COMMAND='fd --type f --max-depth 20 --exclude "node_modules" --exclude ".git"'
export FZF_ALT_C_COMMAND='fd --type d --max-depth 20'

# FZF options (colors and behavior)
# Uncomment to customize:
# export FZF_DEFAULT_OPTS="
#   --height 40%
#   --layout=reverse
#   --border
#   --color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
# "

# ============================================
# ZOXIDE (Smart CD)
# ============================================
# Smarter cd command - learns your habits!
# Jump to frequently/recently used directories
#
# Usage:
#   z <partial-path>    Jump to directory
#   zi                  Interactive selection
#
# Examples:
#   z dev              → cd ~/Documents/Development
#   z proj             → cd ~/Documents/Development/Projects
#   z fed              → cd ~/Documents/Fedora

eval "$(zoxide init bash)"

# Disable zoxide doctor check (avoids startup message)
export _ZO_DOCTOR=0

# ============================================
# DUCKDB (Analytics Database)
# ============================================
# Modern analytics database for data engineering
# Version manager: duckman
# Course: Luke Barousse's SQL for Data Engineering
#
# INSTALLATION:
# -------------
# 1. Install duckman:
#    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NiclasHaderer/duckdb-version-manager/main/install.sh)"
#    Say NO to auto-setup (we handle it here!)
#
# 2. Install latest DuckDB:
#    duckman install latest
#    duckman default latest
#
# 3. Download JDBC driver for DataGrip:
#    mkdir -p ~/Documents/Development/JDBC-Drivers
#    cd ~/Documents/Development/JDBC-Drivers
#    wget https://repo1.maven.org/maven2/org/duckdb/duckdb_jdbc/1.4.4.0/duckdb_jdbc-1.4.4.0.jar
#
# 4. Add your MotherDuck token below (replace placeholder)
#
# 5. Reload bash:
#    source ~/.bashrc
#
# USAGE:
# ------
# Basic:
#   duckdb                    # In-memory database
#   duckdb mydata.db          # Persistent database file
#   duckdb -c "SELECT 1"      # Execute query from command line
#   .help                     # In DuckDB shell, show help
#   .exit                     # Exit DuckDB shell
#
# MotherDuck (cloud):
#   duck-personal             # Connect to personal MotherDuck
#   duck-data-jobs            # Connect to specific database
#   duck-cloud [account]      # Switch between accounts
#
# File operations:
#   duck-csv file.csv         # Quick CSV analysis
#   duck-parquet file.parquet # Quick Parquet analysis
#   duck-query "SELECT ..."   # Execute query on file
#
# Version management:
#   duck-update               # Update to latest version
#   duck-versions             # Show installed versions
#   duck-available            # Show available versions
#   duck-info                 # Show complete installation info

# Enable bash completion for duckman
if command -v duckman &> /dev/null; then
    eval "$(duckman completion bash)"
fi

# ============================================
# MOTHERDUCK TOKENS (Cloud DuckDB)
# ============================================
# Get tokens from: https://motherduck.com/
# 1. Go to https://motherduck.com/
# 2. Sign in to your account
# 3. Click Settings (gear icon)
# 4. Go to: Access Tokens
# 5. Click "Create Token"
# 6. Copy the token
# 7. Replace the placeholder below with your token
#
# IMPORTANT: Keep these tokens SECRET!
# Never commit to Git or share publicly!

# Personal MotherDuck Account
# Replace YOUR_MOTHERDUCK_TOKEN_HERE with your actual token from https://motherduck.com/
export motherduck_token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJpam95bmFuZGkzMUBnbWFpbC5jb20iLCJtZFJlZ2lvbiI6ImF3cy1ldS1jZW50cmFsLTEiLCJzZXNzaW9uIjoiYmlqb3luYW5kaTMxLmdtYWlsLmNvbSIsInBhdCI6Im1JY1U0YXVPOVBpNHoxdklSM09JVU00c0RMVHV3d3VkZUl2dzQ3ckEzZVkiLCJ1c2VySWQiOiI2NjhlYzJmMS1kMWQ0LTQ3ODEtOTc4NS1mYWY2NWJjOWUxOTciLCJpc3MiOiJtZF9wYXQiLCJyZWFkT25seSI6ZmFsc2UsInRva2VuVHlwZSI6InJlYWRfd3JpdGUiLCJpYXQiOjE3NzA5MzMzMDR9.4oXlzVRVZ-Ugnk1SUczGUbkbu9eQwhlOCIP8V5vppPY"

# Work MotherDuck Account (optional)
# Uncomment and replace with your work token if needed:
# export motherduck_token_work="YOUR_WORK_TOKEN_HERE"

# Team MotherDuck Account (optional)
# Uncomment and replace with your team token if needed:
# export motherduck_token_team="YOUR_TEAM_TOKEN_HERE"

# ============================================
# DUCKDB ALIASES
# ============================================

# Basic shortcuts
alias duck='duckdb'
alias duck-update='duckman install latest && duckman default latest'
alias duck-versions='duckman list local'
alias duck-available='duckman list remote'

# MotherDuck connections
alias duck-personal='duckdb "md:?motherduck_token=$motherduck_token"'
# Uncomment these if you configured work/team tokens:
# alias duck-work='duckdb "md:?motherduck_token=$motherduck_token_work"'
# alias duck-team='duckdb "md:?motherduck_token=$motherduck_token_team"'

# Quick database connections
alias duck-data-jobs='duckdb "md:data_jobs?motherduck_token=$motherduck_token"'
alias duck-my-db='duckdb "md:my_db?motherduck_token=$motherduck_token"'
alias duck-sample='duckdb "md:sample_data?motherduck_token=$motherduck_token"'

# ============================================
# DUCKDB FUNCTIONS
# ============================================
# CRITICAL: Blank line above this section required for bash syntax!

duck-query() {
    # Execute SQL from command line
    # Usage: duck-query "SELECT * FROM 'file.csv'"
    if [ -z "$1" ]; then
        echo "Usage: duck-query \"SQL_QUERY\""
        echo "Example: duck-query \"SELECT * FROM 'data.csv' LIMIT 10\""
        return 1
    fi
    duckdb -c "$1"
}

duck-csv() {
    # Quick CSV analysis
    # Usage: duck-csv data.csv [optional_query]
    if [ -z "$1" ]; then
        echo "Usage: duck-csv FILE.csv [\"OPTIONAL_QUERY\"]"
        echo "Example: duck-csv data.csv"
        echo "Example: duck-csv data.csv \"SELECT COUNT(*) FROM data\""
        return 1
    fi
    local file=$1
    local query=${2:-"SELECT * FROM read_csv_auto('$file') LIMIT 10"}
    duckdb -c "$query"
}

duck-parquet() {
    # Quick Parquet analysis
    # Usage: duck-parquet data.parquet [optional_query]
    if [ -z "$1" ]; then
        echo "Usage: duck-parquet FILE.parquet [\"OPTIONAL_QUERY\"]"
        echo "Example: duck-parquet data.parquet"
        echo "Example: duck-parquet data.parquet \"SELECT COUNT(*) FROM data\""
        return 1
    fi
    local file=$1
    local query=${2:-"SELECT * FROM read_parquet('$file') LIMIT 10"}
    duckdb -c "$query"
}

duck-cloud() {
    # Switch between MotherDuck accounts
    # Usage: duck-cloud [personal|work|team]
    local account=${1:-personal}
    case $account in
        personal)
            echo "Connecting to personal MotherDuck account..."
            duckdb "md:?motherduck_token=$motherduck_token"
            ;;
        work)
            if [ -n "$motherduck_token_work" ]; then
                echo "Connecting to work MotherDuck account..."
                duckdb "md:?motherduck_token=$motherduck_token_work"
            else
                echo "❌ Work token not configured!"
                echo "To configure:"
                echo "  1. Edit ~/.bashrc.d/tools.sh"
                echo "  2. Uncomment line: export motherduck_token_work=\"...\""
                echo "  3. Replace placeholder with your work token"
                echo "  4. Run: source ~/.bashrc"
            fi
            ;;
        team)
            if [ -n "$motherduck_token_team" ]; then
                echo "Connecting to team MotherDuck account..."
                duckdb "md:?motherduck_token=$motherduck_token_team"
            else
                echo "❌ Team token not configured!"
                echo "To configure:"
                echo "  1. Edit ~/.bashrc.d/tools.sh"
                echo "  2. Uncomment line: export motherduck_token_team=\"...\""
                echo "  3. Replace placeholder with your team token"
                echo "  4. Run: source ~/.bashrc"
            fi
            ;;
        *)
            echo "Usage: duck-cloud [personal|work|team]"
            echo "Default: personal"
            ;;
    esac
}

duck-info() {
    # Show DuckDB installation and configuration info
    echo "╔════════════════════════════════════════╗"
    echo "║   DUCKDB INSTALLATION INFO             ║"
    echo "╚════════════════════════════════════════╝"
    echo ""
    echo "📦 Installation:"
    echo "  duckman:    $(which duckman 2>/dev/null || echo 'Not found')"
    echo "  duckdb:     $(which duckdb 2>/dev/null || echo 'Not found')"
    echo "  Version:    $(duckdb --version 2>/dev/null || echo 'Not installed')"
    echo ""
    echo "💾 Installed Versions:"
    duckman list local 2>/dev/null | sed 's/^/  /' || echo "  None"
    echo ""
    echo "🌐 MotherDuck Tokens:"

    # Check personal token (using length check instead of string comparison)
    if [ -n "$motherduck_token" ] && [ ${#motherduck_token} -gt 50 ]; then
        echo "  Personal: ✅ Configured"
    else
        echo "  Personal: ⚠️  Not configured"
    fi

    # Check work token
    if [ -n "$motherduck_token_work" ] && [ ${#motherduck_token_work} -gt 50 ]; then
        echo "  Work:     ✅ Configured"
    else
        echo "  Work:     - Not configured (optional)"
    fi

    # Check team token
    if [ -n "$motherduck_token_team" ] && [ ${#motherduck_token_team} -gt 50 ]; then
        echo "  Team:     ✅ Configured"
    else
        echo "  Team:     - Not configured (optional)"
    fi

    echo ""
    echo "🚀 Quick Commands:"
    echo "  duck-personal        → Connect to personal MotherDuck"
    echo "  duck-data-jobs       → Connect to data_jobs database"
    echo "  duck-csv file.csv    → Analyze CSV file"
    echo "  duck-parquet file    → Analyze Parquet file"
    echo "  duck-cloud [account] → Switch MotherDuck accounts"
    echo "  duck-info            → Show this info"
    echo ""
}

# ============================================
# END OF DUCKDB CONFIGURATION
# ============================================

# ============================================
# BLE.SH (Bash Line Editor)
# ============================================
# Fish-like syntax highlighting and auto-suggestions
#
# NOT IN FEDORA REPOS! Must compile from source!
#
# INSTALLATION:
# -------------
# 1. cd ~/Documents/Development/Sources
# 2. git clone --recursive --depth 1 \
#      https://github.com/akinomyoga/ble.sh.git
# 3. cd ble.sh
# 4. make
# 5. make install PREFIX=~/.local
# 6. source ~/.bashrc
#
# UPDATE (when you want latest features):
# ----------------------------------------
# 1. cd ~/Documents/Development/Sources/ble.sh
# 2. git pull
# 3. git submodule update --init --recursive
# 4. make clean && make
# 5. make install PREFIX=~/.local
# 6. source ~/.bashrc
#
# REMOVE (if you want to uninstall):
# -----------------------------------
# 1. rm -rf ~/.local/share/blesh
# 2. rm -rf ~/.local/share/doc/blesh
# 3. Comment out ble.sh loading below
# 4. source ~/.bashrc
#
# FEATURES:
# ---------
# - Syntax highlighting in real-time (like fish!)
# - Auto-suggestions from history (press → to accept)
# - Better tab completion
# - Multiline editing
# - Error highlighting (red for invalid commands)
#
# CONFIGURATION:
# --------------
# Create ~/.blerc to customize:
# - Colors, themes
# - Auto-suggestion behavior
# - Keybindings
# - Disable exit messages: bleopt exec_errexit_mark=
#
# FRESH FEDORA INSTALL:
# ---------------------
# Just install ble.sh (steps above) and this loads it!
# No additional configuration needed!
#
# LOADING OPTIONS:
# ----------------
# Choose ONE of the options below:

# OPTION 1: Simple Loading (RECOMMENDED)
# - Load time: ~0.056 seconds
# - All features ready immediately
# - No complexity, no edge cases
# - Simple and reliable!
[[ $- == *i* ]] && [[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

# OPTION 2: Optimized Lazy Loading (ADVANCED)
# - Load time: ~0.040 seconds (saves 16ms!)
# - Features load in background
# - Slightly more complex
# - Uncomment below and comment out Option 1:
# if [[ -f ~/.local/share/blesh/ble.sh ]]; then
#     source ~/.local/share/blesh/ble.sh --attach=none
#     ((_ble_bash)) && ble-attach
# fi

# ============================================
# SSH AGENT
# ============================================
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

# After login, when you NEED SSH:
# start-ssh-agent
# Enter passphrases
# Done for the day!

# ============================================
# ADDITIONAL TOOL CONFIGURATIONS
# ============================================

# Bat (better cat) - if installed
# Uncomment if you installed bat separately:
# export BAT_THEME="TwoDark"
# export BAT_STYLE="numbers,changes,header"

# Ripgrep (better grep) - if installed
# Uncomment to set default options:
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# ============================================
# PERFORMANCE NOTES
# ============================================
#
# BEFORE ALL OPTIMIZATIONS:
# - Conda init: ~0.5-1.0 seconds
# - ble.sh load: ~0.3-0.5 seconds
# - Other tools: ~0.2 seconds
# - Total: ~1.5-2.0 seconds
#
# AFTER OPTIMIZATIONS:
# - Conda: ~0 seconds (lazy loaded)
# - ble.sh: ~0.05 seconds (simple) or ~0.04 seconds (lazy)
# - Other tools: ~0.01 seconds
# - Total: ~0.056 seconds ⚡ (27x FASTER!)
#
# Human perception threshold: ~100ms
# Your load time: ~56ms
# YOU CAN'T EVEN PERCEIVE THE DELAY! 🚀
#
# ============================================
# USAGE TIPS
# ============================================
#
# FZF:
# ----
# Ctrl+R          → Search command history (fuzzy)
# Ctrl+T          → Insert file path (fuzzy)
# Alt+C           → Change directory (fuzzy)
#
# After search opens:
#   - Type to filter
#   - Up/Down arrows to navigate
#   - Enter to select
#   - Esc to cancel
#
# Zoxide:
# -------
# z eng           → Jump to Data-Engineering directory
# z dev           → Jump to Development directory
# zi              → Interactive directory selection
# zoxide query -l → List all tracked directories
#
# The more you use directories, the smarter zoxide gets!
#
# Conda:
# ------
# conda activate env   → Activate environment (initializes first time)
# conda deactivate     → Deactivate environment
# conda env list       → List environments
# conda list           → List packages in current env
#
# First conda command initializes conda (1 second delay)
# After that, all conda commands are instant!
#
# ble.sh:
# -------
# As you type:
#   - Commands highlighted in real-time
#   - Green/cyan = valid command
#   - Red = invalid command
#   - Blue = directories/files
#   - Gray suggestions from history (press → to accept)
#
# Tab completion:
#   - Enhanced, beautiful menus
#   - Navigate with arrows
#   - Select with Enter
#
# Exit codes:
#   - [ble: exit N] shown immediately after error
#   - Your prompt also shows exit code in brackets
#   - Double confirmation! Very useful!
#
# Configure in ~/.blerc for custom colors/behavior
# See: ~/.local/share/doc/blesh/README.md for full docs
# ============================================
