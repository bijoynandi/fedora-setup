# ============================================
# ULTIMATE BASH ALIASES
# Productivity-Boosting Command Shortcuts
# ============================================
#
# SETUP INSTRUCTIONS:
# -------------------
# 1. Create aliases directory:
#    mkdir -p ~/.bashrc.d
#
# 2. Copy this file there:
#    cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/aliases.sh ~/.bashrc.d/aliases.sh
#
# 3. Reload bash:
#    source ~/.bashrc
#
# 4. Test it:
#    gs          # Git status
#    lsg         # ls + git status!
#    dev         # Go to Development directory
#    myip        # Show public IP
#
# Note: Your ~/.bashrc already sources ~/.bashrc.d/* automatically!
# ============================================

# ============================================
# NAVIGATION & DIRECTORY SHORTCUTS
# ============================================

# Quick directory navigation
alias ..='cd ..'                 # Go up one directory
alias ...='cd ../..'            # Go up two directories
alias ....='cd ../../..'        # Go up three directories
alias back='cd -'               # Go back to previous directory
alias prev='cd -'               # Alternative: previous directory
alias ret='cd -'                # Alternative: return to previous

# ============================================
# CUSTOM DIRECTORY SHORTCUTS
# ============================================

# Main directories
alias docs='cd ~/Documents'
alias de='cd ~/Documents/Data-Engineering'
alias books='cd ~/Documents/Books'
alias dev='cd ~/Documents/Development'
alias fed='cd ~/Documents/Fedora'
alias lin='cd ~/Documents/Linux'

# Development subdirectories
alias src='cd ~/Documents/Development/Sources'
alias proj='cd ~/Documents/Development/Projects'
alias learn='cd ~/Documents/Development/Learning'
alias builds='cd ~/Documents/Development/Builds'
alias scripts='cd ~/Documents/Development/Projects/my-script'
alias mytool='cd ~/Documents/Development/Projects/my-tool'

# Data Engineering subdirectories
alias de-learn='cd ~/Documents/Data-Engineering/Learning'
alias de-proj='cd ~/Documents/Data-Engineering/Projects'
alias de-scripts='cd ~/Documents/Data-Engineering/Scripts'
alias de-data='cd ~/Documents/Data-Engineering/Data'
alias de-configs='cd ~/Documents/Data-Engineering/Configs'
alias de-notebooks='cd ~/Documents/Data-Engineering/Notebooks'

# Learning subdirectories
alias learn-py='cd ~/Documents/Data-Engineering/Learning/python'
alias learn-sql='cd ~/Documents/Data-Engineering/Learning/sql'
alias learn-spark='cd ~/Documents/Data-Engineering/Learning/spark'
alias learn-kafka='cd ~/Documents/Data-Engineering/Learning/kafka'
alias learn-cloud='cd ~/Documents/Data-Engineering/Learning/cloud'
alias learn-airflow='cd ~/Documents/Data-Engineering/Learning/airflow'
alias learn-dbt='cd ~/Documents/Data-Engineering/Learning/dbt'

# Python learning subdirectories
alias pylearn='cd ~/Documents/Data-Engineering/Learning/python/Python-Learning'
alias pyprac='cd ~/Documents/Data-Engineering/Learning/python/Python-Practice'
alias pyproj='cd ~/Documents/Data-Engineering/Learning/python/Python-Projects'
alias pydata='cd ~/Documents/Data-Engineering/Learning/python/Python-for-Data-Analytics'

# SQL learning subdirectories
alias sqlbasic='cd ~/Documents/Data-Engineering/Learning/sql/Basics'
alias sqladv='cd ~/Documents/Data-Engineering/Learning/sql/Advanced'
alias sqleng='cd ~/Documents/Data-Engineering/Learning/sql/SQL-for-Data-Engineering'

# Fedora documentation
alias fedbash='cd ~/Documents/Fedora/Bash-History'
alias fedbashrc='cd ~/Documents/Fedora/Bashrc-Configurations'
alias fedsetup='cd ~/Documents/Fedora/Post-Installation-Setup'
alias fedssh='cd ~/Documents/Fedora/SSH-Fedora'

# Linux documentation
alias lindistro='cd ~/Documents/Linux/Distro-Guides'
alias linlearn='cd ~/Documents/Linux/Learning'
alias lincmd='cd ~/Documents/Linux/Linux-Commands'
alias linvm='cd ~/Documents/Linux/Virtual-Machine'

# Downloads and Desktop (common)
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'

# ============================================
# LS ENHANCEMENTS (File Listing)
# ============================================

# Basic ls (always colorized)
alias ls='ls --color=auto'

# Standard formats
alias l='ls -lhF --color=auto'          # Long format with human-readable sizes
alias la='ls -lAhF --color=auto'        # Long format + hidden files
alias ll='ls -lhF --color=auto'         # Standard detailed list

# Sorting options (choose your view!)
alias lt='ls -lhFt --color=auto'        # Sort by time (newest first) ⏰
alias ltr='ls -lhFtr --color=auto'      # Sort by time (oldest first) 🕰️
alias lS='ls -lhFS --color=auto'        # Sort by size (largest first) 📊
alias lSr='ls -lhFSr --color=auto'      # Sort by size (smallest first) 📉
alias lx='ls -lhFX --color=auto'        # Sort by extension (.txt, .sh, etc) 📁

# Specialized listings
alias lsd='ls -ld */ 2>/dev/null'        # List only directories 📂
alias lf='ls -lhF | grep "^-"'           # List only files 📄
alias lh='ls -ld .*'                     # List only hidden files 🔒
alias llr='ls -lhFR --color=auto'        # Recursive listing 🌲

# Advanced listings (power user!)
alias lsa='ls -lAhFS --color=auto'       # All files sorted by size 💪
alias lst='ls -lAhFt --color=auto'       # All files sorted by time ⚡
alias lsn='ls -lAhF --color=auto | nl'   # Numbered list (for reference) 🔢

# Tree view (if tree is installed)
alias tree='tree -C'                     # Colorized tree 🎨
alias tree1='tree -L 1 -C'               # 1 level deep
alias tree2='tree -L 2 -C'               # 2 levels deep
alias tree3='tree -L 3 -C'               # 3 levels deep
alias treed='tree -d -C'                 # Directories only

# ============================================
# CAT/BAT INTEGRATION
# ============================================

# Use bat if available, fallback to cat
if command -v bat &> /dev/null; then
    alias cat='bat --style=plain --paging=never'
    alias catn='bat --style=numbers --paging=never'
    alias catp='bat --style=plain'  # With paging for long files
    alias bathelp='bat --list-themes'
else
    alias catn='cat -n'  # Numbered lines
fi

# Keep original cat available
alias catplain='/usr/bin/cat'

# Note: fd and rg are NOT aliased to find/grep
# Learn the fundamentals first, then use fd/rg as separate commands!

# ============================================
# GREP ENHANCEMENTS
# ============================================

# Colorized grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Useful grep shortcuts
alias grepi='grep -i'            # Case-insensitive
alias grepr='grep -r'            # Recursive
alias grepv='grep -v'            # Inverse (exclude)
alias grepn='grep -n'            # Line numbers
alias grepc='grep -c'            # Count matches

# ============================================
# SYSTEM & HARDWARE INFO
# ============================================

# Quick system info
alias myip='curl -s ifconfig.me && echo'
alias localip='ip -4 addr show | grep -oP "(?<=inet\s)\d+(\.\d+){3}" | grep -v 127.0.0.1'
alias ports='netstat -tulanp'
alias df='df -h'
alias meminfo='free -h'
alias cpuinfo='lscpu'
alias diskinfo='df -h'
alias topme='top -u $USER'

# ============================================
# PROCESS MANAGEMENT
# ============================================

# Process shortcuts
alias psa='ps aux'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'

# ============================================
# DNF (Fedora Package Manager)
# ============================================

# DNF shortcuts
alias dnfi='sudo dnf install'
alias dnfr='sudo dnf remove'
alias dnfu='sudo dnf upgrade'
alias dnfs='dnf search'
alias dnfI='dnf info'
alias dnfl='dnf list installed'
alias dnfc='sudo dnf clean all'

# ============================================
# GIT SHORTCUTS
# ============================================

# Basic git commands
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit -am'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git remote -v'
alias gst='git stash'
alias gstp='git stash pop'

# Advanced git
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gwho='git shortlog -sn'
alias gundo='git reset --soft HEAD~1'
alias gamend='git commit --amend --no-edit'
alias gclean='git clean -fd'

# ============================================
# PODMAN (Container Management)
# ============================================

# Podman basics
alias p='podman'
alias pc='podman-compose'
alias pps='podman ps'
alias ppa='podman ps -a'
alias pi='podman images'
alias pstart='podman start'
alias prestart='podman restart'
alias pstop='podman stop'
alias prm='podman rm'
alias prmi='podman rmi'
alias docker='podman'

# ============================================
# SAFETY NETS (Confirm before disaster!)
# ============================================

# Safer file operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# Keep unsafe versions available (use when needed)
alias rmf='/usr/bin/rm -f'
alias cpf='/usr/bin/cp -f'
alias mvf='/usr/bin/mv -f'

# ============================================
# FILE & DIRECTORY OPERATIONS
# ============================================

# Create parent directories as needed
alias mkdir='mkdir -pv' # Create parent dirs + verbose

# Copy with progress (if rsync available)
alias cpv='rsync -ah --info=progress2'

# Human-readable du
alias du='du -h'
alias dus='du -sh' # Summary
alias dush='du -sh .*' # Hidden files summary

# ============================================
# ARCHIVES & COMPRESSION
# ============================================

# Quick extraction
alias untar='tar -xvf'
alias targz='tar -xzvf'
alias tarbz='tar -xjvf'
alias unzip='unzip -q'

# Quick compression
alias tarc='tar -czvf'
alias zipc='zip -r'

# ============================================
# TEXT PROCESSING
# ============================================

# Count lines, words, characters
alias wcl='wc -l'
alias wcw='wc -w'
alias wcc='wc -c'

# Head and tail shortcuts
alias h='head'
alias t='tail'
alias tf='tail -f'

# ============================================
# PYTHON & CONDA
# ============================================

# Python shortcuts
alias py='python3'
alias python='python3'
alias pip='pip3'
alias pipi='pip install'
alias pipu='pip install --upgrade'
alias pipl='pip list'

# Conda shortcuts
alias ca='conda activate'
alias cda='conda deactivate'
alias cel='conda env list'
alias cil='conda install'
alias csl='conda search'

# Virtual environment
alias venv='python3 -m venv'

# ============================================
# DEVELOPMENT TOOLS
# ============================================

# Compilation shortcuts
alias mk='make'
alias mkc='make clean'
alias mki='make install'
alias mku='make uninstall'

# Editor shortcuts
alias vi='nvim'
alias vim='nvim'
alias nano='nano -l'

# ============================================
# NETWORK & WEB
# ============================================

# Quick HTTP server
alias serve='python3 -m http.server 8000'

# Download shortcuts
alias wget='wget -c'

# ============================================
# SYSTEM MAINTENANCE
# ============================================

# Update everything!
alias update-all='sudo dnf update -y && sudo dnf upgrade -y && flatpak update -y'

# Clean system
alias clean-dnf='sudo dnf clean all'
alias clean-tmp='sudo rm -rf /tmp/*'
alias clean-journal='sudo journalctl --vacuum-time=7d'

# ============================================
# FUN & MISC
# ============================================

# Colorize commands
alias diff='diff --color=auto'

# Weather
alias weather='curl wttr.in'

# Clear screen
alias c='clear'
alias cls='clear'

# Reload bash config
alias reload='source ~/.bashrc && echo "✅ Bash config reloaded!"'

# Edit aliases
alias aliases='nano ~/.bashrc.d/aliases.sh'

# Show all aliases
alias aliashelp='cat ~/.bashrc.d/aliases.sh | grep "^alias" | sed "s/alias //g" | column -t -s= | less'

# ============================================
# GIT-AWARE LISTING FUNCTIONS
# ============================================
# CRITICAL: Functions MUST have blank line above them!

# List directory + Git status in one command!
lsg() {
    echo "📁 Directory Listing:"
    ls -lhF --color=auto "$@"
    echo ""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "📊 Git Status:"
        git status -s
    else
        echo "ℹ️  Not a git repository"
    fi
}

# Compact version
lsgc() {
    ls -CF --color=auto "$@"
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo ""
        echo "Git: $(git branch --show-current) • $(git status -s | wc -l) changes"
    fi
}

# ============================================
# UTILITY FUNCTIONS
# ============================================
# CRITICAL: Blank lines above each function!

# Extract any archive
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.rar)     unrar x "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.tbz2)    tar xjf "$1" ;;
            *.tgz)     tar xzf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1" ;;
            *)         echo "'$1' cannot be extracted!" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Make directory and cd into it
# NOTE: Uses /usr/bin/mkdir directly to avoid conflicts!
mkcd() {
    /usr/bin/mkdir -p "$1" && cd "$1"
}

# Backup a file with timestamp
backup() {
    cp "$1" "$1.bak.$(date +%Y%m%d_%H%M%S)"
}

# Simple backup (just .bak extension)
bak() {
    cp "$1" "$1.bak"
}

# Search for processes
psgrep() {
    ps aux | grep -v grep | grep "$1"
}

# Go up N directories
up() {
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++)); do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

# Show directory sizes sorted
dirsize() {
    du -sh "${1:-.}"/* 2>/dev/null | sort -hr
}

# Find files by name
ff() {
    find . -type f -name "*$1*"
}

# Find directories by name
fdir() {
    find . -type d -name "*$1*"
}

# Quick git commit + push
gitcp() {
    git add .
    git commit -m "$1"
    git push
}

# Show top 10 largest files in current directory
largest() {
    du -ah "${1:-.}" | sort -rh | head -n 10
}

# Show listening ports
listening() {
    ss -tuln | grep LISTEN
}

# ============================================
# NOTES & TIPS
# ============================================
#
# To see all aliases:        aliashelp
# To edit this file:         aliases
# To reload after editing:   reload
# To search aliases:         alias | grep <keyword>
#
# IMPORTANT NOTES:
# ----------------
# Functions MUST have blank line above them!
#
# ============================================
# END OF ALIASES
# ============================================

# Pro tip: Don't alias EVERYTHING!
# Only alias what you use frequently!
# Too many aliases = confusion!
# Keep it clean, keep it useful! 💚
