sudo du -h --max-depth=1 /
sudo compsize /home
lsblk
watch -n 1 'cat /proc/meminfo | grep Dirty'
dnf --version
flatpak --version
flatpak list
dnf list
dnf list --installed
dnf list --installed | wc -l
ls /etc/yum.repos.d/
cat /etc/dnf/dnf.conf
dnf --dump-main-config
echo $PATH
ls -a .local/
dnf --dump-variables
dnf repolist
sudo ncdu /
smartctl --help
sudo smartctl -x /dev/sda
sudo smartctl -x /dev/sdb
zramctl
sudo compsize /usr/
sudo compsize /var/
dict bootstrap
ls -la /boot/
anaconda-navigator
jupyter-lab
jupyter-notebook
spyder
du -h --max-depth=1 /
dnf search cowsay
tree -L 1 /
tree -L 1 /home/
tree -L 1 /home/bijoy/
id
sudo --help
echo $HISTSIZE
echo $COLORS
echo $LS_COLORS
echo $DISPLAY
alias
man cd
man builtins
umask
uname -a
uname --help
lsusb
lspci
which btrfs
btrfs --help
mount
sudo btrfs filesystem df /
sudo btrfs filesystem df /home
uptime
users
firefox --version
kwrite
dolphin
konsole
postgres --version
google-chrome-stable
sqlitebrowser
dragon
elisa
libreoffice
libreoffice writer
python3 practice.py
getfacl --help
getfacl /home/bijoy/
w
dict modular
ffmpeg --help
man ffmpeg
stat /
hostnamectl
cat /etc/hosts
cat /etc/hostname
sudo cat /var/log/boot.log
ls /var/log
sudo cat /var/log/dnf5.log
sudo cat /var/log/dnf5.log | less
sudo cat /var/log/dnf5.log.4 | less
cd /var/log/
last --help
last
ls audit/
sudo ls audit/
sudo cat audit/audit.log | less
sudo tail -f audit/audit.log
ls journal/
journalctl | tail -f
tail -f journalctl
journalctl --help
journalctl -f
sudo smartctl -a /dev/sda
sudo smartctl -a /dev/sdb
sudo btrfs filesystem show
sudo btrfs filesystem usage /
sudo btrfs filesystem usage /home
sudo journalctl -u systemd-fsck-root
tar --help
which journalctl
head /usr/bin/journalctl
watch -n 1 sensors
cal
/usr/bin/python3 --version
python3 --version
python3 --help
rpm --version
rpm -qa
rpm --help
rpm -qa | less
journalctl --since "45 minutes ago"
mokutil --sb-state
fwupdmgr get-updates
sudo fwupdmgr update
cat /etc/yum.repos.d/fedora.repo | grep metalink
dnf repolist -v
dnf repolist -verbose
dnf repolist --help
dnf repolist --all
dnf repoinfo fedora
mount | grep tmpfs
df -ih
ls /tmp/
fastfetch -c all.jsonc
fastfetch -c all
jobs
kwrite &
ncdu --version
fold --help
tree -L 2 /
tree -L 2 /home/bijoy/
dnf5 --version
dnf5 --help
/bin/python3 --version
which python3
cht.sh tar
curl wttr.in/kolkata
yes
cat /proc/sys/vm/swappiness
watch -n 10 'ps aux --sort=-%mem | head -20'
watch -n 1 -d systemctl status earlyoom.service
watch --help
cht.sh watch
watch -n 1 free -h
watch -n 1 'free -h && echo "" && ps aux --sort=-%mem | head -10'
systemctl list-unit-files
journalctl | head
journalctl --disk-usage
journalctl | wc -l
btrfs filesystem df /
btrfs filesystem df /home
sudo compsize /home/
sudo compsize /
sudo btrfs subvolume list /
tree -L 1 /home
cht.sh tree
tree -L 1
sudo systemctl status crond.service
journalctl -t CROND -n 50
journalctl -u crond -f
journalctl -u firefox-restore -u firefox-save -u chrome-restore -u chrome-save --since today
sudo du -h --max-depth=1 / | sort -h | tail -20
find / -type f -size +100M 2>/dev/null
cat /etc/fedora-release
journalctl -p err --since today
journalctl -b | head
cat /proc/meminfo
cat /proc/cpuinfo
cat /proc/loadavg
sudo dnf upgrade
free -h
df -h
exec bash
dnf info nano
mkdir -p ~/Documents/Development/JDBC-Drivers
cd ~/Documents/Development/JDBC-Drivers
wget https://repo1.maven.org/maven2/org/duckdb/duckdb_jdbc/1.4.4.0/duckdb_jdbc-1.4.4.0.jar
duckdb md:data_jobs
fastfetch
sudo btrfs scrub start /
sudo btrfs scrub status /
sudo btrfs scrub start /home
sudo btrfs scrub status /home
date -d @0
dnf history list
dnf history list last-20
dnf history list --reverse
dnf history list 1..10
dnf history info 1
time bash -i -c exit
type cd
type ls
type sudo
sudo -i
duckdb
duck-personal
duck-cloud
duck-data-jobs
duck-my-db
duck-sample
duck-info
duck-csv /home/bijoy/Downloads/export.csv
duck-parquet /home/bijoy/Downloads/export.parquet
duck-query /home/bijoy/Downloads/export.csv
duck-query "SELECT * FROM '/home/bijoy/Downloads/export.csv' LIMIT 10"
which duckman
ble-update
nvim
ble --help
ls -a ~/.config
sudo btrfs filesystem usage
sudo btrfs filesystem usage /home/
btrfs --version
env
btrfs filesystem show
groups
diskinfo
which diskinfo
dirsize
which dirsize
conda doctor
grep -n "conda initialize" ~/.bashrc
cat ~/.bashrc
which python
pkill -f 50-10-timer.sh
pkill -f 20-20-20-eye-ti
conda env list
conda info
source /home/bijoy/anaconda3/bin/activate analytics
/home/bijoy/anaconda3/envs/analytics/bin/python /home/bijoy/Documents/Analytics/Python/Python-Learning/Python-Core/1-Basics/2-Data-Types/2-String-Transformations/string-manipulations.py
conda
rsync -avH --dry-run --delete /home/bijoy/Documents/ /run/media/bijoy/system-backup-sp/home/bijoy/Documents/
rsync -avH --delete /home/bijoy/Documents/ /run/media/bijoy/system-backup-sp/home/bijoy/Documents/
rsync -avH --dry-run --delete /home/bijoy/Documents/ /run/media/bijoy/system-backup-hp/home/bijoy/Documents/
rsync -avH --delete /home/bijoy/Documents/ /run/media/bijoy/system-backup-hp/home/bijoy/Documents/
ls -a
mkdir ~/bin
ls -la ~/bin
browser-ram-status.sh
cat ~/bin/comprehensive-integrity-check.sh
comprehensive-integrity-check.sh --verbose --checksums --compare
udisksctl unmount -b /dev/sdc1
udisksctl power-off -b /dev/sdc
cd Documents/
cd Data-Engineering/
ls -laR ~/Documents/
sudo btrfs scrub start /home/
sudo btrfs scrub status /home/
cht.sh rg
rg --help
/bin/python /home/bijoy/Documents/Data-Engineering/Learning/python/Python-Learning/Python-Core/1-Basics/2-Data-Types/2-String-Transformations/string-manipulations.py
cd Documents/Data-Engineering/
ls -R
cp /home/bijoy/Documents/Fedora/Fedora-Post-Installation-Setup/aliases.sh ~/.bashrc.d/aliases.sh
reload
de
learn-sql
z Data-Engineering/
cp /home/bijoy/Documents/Fedora/Fedora-Post-Installation-Setup/tools.sh ~/.bashrc.d/tools.sh
cd ~/Documents/Data-Engineering/Learning
cd ~/Documents/Data-Engineering/Guides
cat README.md
git config --global -e
src
cd ble.sh/
git config --help
git config -h
podman run -e "ACCEPT_EULA=Y" \
   -e "SA_PASSWORD=$SQLSERVER_PASSWORD" \
   -e "MSSQL_USER=root" \
   -p 1433:1433 \
   --name sql-server \
   -v /home/bijoy/Documents/Data-Engineering:/opt/analytics:Z \
   -d mcr.microsoft.com/mssql/server:2022-latest
podman ps
reboot
podman start sql-server
journalctl
dl
ls -la ~/.ssh/
cd ~/.ssh/
nano ~/.ssh/config
ls -l
jupyter lab
npm --help
cht.sh npm
cat ~/.bashrc.d/tools.sh
ps aux --sort=-%mem | head -20
cp /home/bijoy/Documents/Fedora/Fedora-Post-Installation-Setup/bashrc.sh ~/.bashrc
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/bashrc.sh ~/.bashrc
fedsetup
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/aliases.sh ~/.bashrc.d/aliases.sh
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/history.sh ~/.bashrc.d/history.sh
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/prompt.sh ~/.bashrc.d/prompt.sh
cp /home/bijoy/Documents/Fedora/Post-Installation-Setup/tools.sh ~/.bashrc.d/tools.sh
ls -la
git --version
sudo virsh start server
ssh server
sudo virsh reboot server
top
aliases
topme
htop
ranger
fastf
sudo virsh shutdown server
poweroff
/bin/bash /home/bijoy/Documents/Development/Projects/my-script/lock-and-turn-off/lock-and-turnoff.sh
comprehensive-integrity-check.sh --verbose --checksums
duckdb -ui
learn
cd git-practice/
cat hello.md
which code
journalctl -f --since="now"
dolphin .
podman rm sql-server
podman ps -a
dnf info pdftotext
chmod +x /tmp/duckman-new
sudo mv /tmp/duckman-new ~/.local/bin/duckman
duckman --version
cat > ~/.gitignore_global << 'EOF'
# ============================================
# OS FILES
.DS_Store
Thumbs.db
# EDITOR FILES
.vscode/
.idea/
*.swp
*.swo
*~
# PYTHON
__pycache__/
*.py[cod]
*.so
*.egg-info/
.venv/
venv/
# JUPYTER
.ipynb_checkpoints/
# CONDA
.conda/
# DATABASES (Don't commit these!)
*.duckdb
*.duckdb.wal
*.sqlite
*.db
# DATA FILES (NEVER commit large files!)
*.csv
*.parquet
*.json
*.xlsx
*.xls
!sample_data.csv
!sample_data.json
# Data directories
/data/raw/
/data/tmp/
/data/intermediate/
/data/staging/
/data/processed/
/exports/
# LOGS & TEMP
logs/
tmp/
*.log
# DBT
target/
dbt_packages/
dbt_modules/
# AIRFLOW
airflow.db
airflow-webserver.pid
airflow-scheduler.pid
# SECRETS (ABSOLUTELY NEVER COMMIT!)
.env
.env.*
secrets.yaml
credentials.json
*.pem
*.key
*.crt
*.p12
*.pfx
config.ini
credentials/
EOF
git config --global core.excludesfile ~/.gitignore_global
git config --global core.excludesfile
cat ~/.gitignore_global
ls /tmp
code --list-extensions > extensions.txt
alias | grep gs
ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH \
  -sOutputFile=compressed.pdf Data_Engineering_Roadmap_2026.pdf
sudo pycharm
rsync -avH --dry-run --delete /home/bijoy/Music/ /run/media/bijoy/system-backup-sp/home/bijoy/Music/
rsync -avH --delete /home/bijoy/Music/ /run/media/bijoy/system-backup-sp/home/bijoy/Music/
rsync -avH --dry-run --delete /home/bijoy/Music/ /run/media/bijoy/system-backup-hp/home/bijoy/Music/
rsync -avH --delete /home/bijoy/Music/ /run/media/bijoy/system-backup-hp/home/bijoy/Music/
cd --help
cht.sh cd
meminfo
sudo firewall-cmd --state
cht.sh pdftotext
cd pdf
cd code-editors/
pdftotext PyCharm-keymap.pdf -
pdftotext PyCharm-keymap.pdf
cat PyCharm-keymap.txt
pdftotext -layout PyCharm-keymap.pdf
de-learn
ret
du -h /home --max-depth=2 2>/dev/null | sort -hr | head -30
find ~ -type f -printf '%s %pn' 2>/dev/null | sort -nr | head -30
cht.sh du
ls -laR
rsync -avzH --dry-run --delete  -e ssh /home/bijoy/Documents/ bijoy@server:~/Documents/
rsync -avzH --delete  -e ssh /home/bijoy/Documents/ bijoy@server:~/Documents/
sudo reboot
fastfetch --version
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
gpg --armor --export 2F706702330D91839F8944D833CFFB3FA452FFA0
git config --global user.signingkey 2F706702330D91839F8944D833CFFB3FA452FFA0
git config --global commit.gpgsign true
git config --list
ls -la ~/.gnupg/
gpg --list-keys
rsync -avH --dry-run --delete /home/bijoy/Pictures/ /run/media/bijoy/system-backup-sp/home/bijoy/Pictures/
rsync -avH --delete /home/bijoy/Pictures/ /run/media/bijoy/system-backup-sp/home/bijoy/Pictures/
rsync -avH --dry-run --delete /home/bijoy/Pictures/ /run/media/bijoy/system-backup-hp/home/bijoy/Pictures/
rsync -avH --delete /home/bijoy/Pictures/ /run/media/bijoy/system-backup-hp/home/bijoy/Pictures/
gpg --edit-key 2F706702330D91839F8944D833CFFB3FA452FFA0
cat > ~/.gnupg/gpg-agent.conf << 'EOF'
# Cache passphrase for 8 hours (28800 seconds)
default-cache-ttl 28800
max-cache-ttl 28800
# Increase timeout to 1 day if you want:
# default-cache-ttl 86400
# max-cache-ttl 86400
EOF
gpg-connect-agent reloadagent /bye
ls ~/.ssh/
echo $SSH_AUTH_SOCK
ssh-add -l
ssh-keygen -t ed25519 -C "bijoynandi@proton.me" -f ~/.ssh/github-ssh-key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github-ssh-key
cat ~/.ssh/github-ssh-key.pub
ls -la ~/.ssh/config
ssh -T git@github.com
gpg --delete-secret-key 2F706702330D91839F8944D833CFFB3FA452FFA0
gpg --delete-key 2F706702330D91839F8944D833CFFB3FA452FFA0
rm -rf ~/.gnupg/*
gpg --armor --export 23940AE1A6C0833EA1DE0D9009AB2186B89B0D00
git config --global user.signingkey 23940AE1A6C0833EA1DE0D9009AB2186B89B0D00
cat > ~/.gnupg/gpg-agent.conf
cat ~/.gnupg/gpg-agent.conf
git clone git@github.com:bijoynandi/bijoynandi.git
cd bijoynandi/
code .
git status
git st
git add .
git commit -m "Add Data Engineer in place of Aspiring Data Engineer."
git push -u origin main
git log --show-signature
git commit -m "Test GPG signing" --allow-empty
echo "Test line" >> README.md
git commit -m "Testing GPG signing"
echo "Another test" >> README.md
git commit -m "Second commit"
git push
start-ssh-agent
passwd
sudo virsh list --all
gpg --delete-secret-key 23940AE1A6C0833EA1DE0D9009AB2186B89B0D00
gpg --delete-key 23940AE1A6C0833EA1DE0D9009AB2186B89B0D00
rm -rf ~/.gnupg
git config --global --unset user.signingkey
git config --global --unset commit.gpgsign
systemctl poweroff
git remote --help
awk -i inplace '!x[$0]++' /home/bijoy/Documents/Fedora/Bash-History/0-Fedora-Bash-History.sh
sudo mariadb -u root -e "DROP USER IF EXISTS 'claude'@'localhost';"
sudo mariadb -u root -e "CREATE USER 'claude'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
sudo mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'claude'@'localhost' WITH GRANT OPTION;"
mariadb -u claude -p
