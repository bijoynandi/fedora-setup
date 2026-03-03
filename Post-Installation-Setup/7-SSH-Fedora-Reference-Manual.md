# Complete SSH Setup Guide for Fedora

## Part 1: Client Side Setup

### Step 1: Install SSH Client
```bash
# Check if SSH client is already installed
which ssh

# Install if not present (usually pre-installed on Fedora)
sudo dnf install openssh-clients
```

### Step 2: Verify SSH Client Installation
```bash
ssh -V
# Should show: OpenSSH_X.X
```

---

## Part 2: Server Side Setup

### Step 3: Install SSH Server
```bash
# Check if SSH server is already installed
which sshd

# Install OpenSSH server
sudo dnf install openssh-server
sudo xbps-install -S  # Sync repos first (Void)
sudo xbps-install openssh
```

### Step 4: Enable and Start SSH Service
```bash
# Enable SSH to start automatically on boot & also start SSH service now
sudo systemctl enable --now sshd
# Enable SSH service (RUNIT, not systemctl!)
# This is the KEY difference from Fedora!
sudo ln -s /etc/sv/sshd /var/service/ # If not already enabled on Void

# Verify service is running
sudo systemctl status sshd
sudo sv status sshd # Void

# Should show: Active: active (running)
```

### Step 5: Check Default SSH Configuration
```bash
# View current SSH service status
sudo ss -tlnp | grep ssh
# Should show port 22 listening
```

---

## Part 3: Basic Connection Test (Before Keys)

### Step 6: Test Basic SSH Connection
```bash
# Know the details of the hosting server (also need the login password)
whomai
ip addr show
hostname -I
# From client machine, connect to server
ssh username@hostname
ssh username@ip.address
ssh bijoy@192.168.122.X (Type yes if connecting to server for the first time to add the fingerprint to the ~/.ssh/known_hosts file)
# Connect with specific port
ssh -p 2222 username@hostname
# Connect with verbose output (debugging)
ssh -v username@hostname
# Replace 192.168.122.X with your server IP
ssh username@192.168.122.X

# You'll be asked for the user's password
# If this works, SSH is functioning correctly
```

### Step 7: Disconnect from Server
```bash
# Once connected, type:
exit
# Or press Ctrl+D
```

---

## Part 4: SSH Key Setup (Passwordless Login)

### Step 8: Generate SSH Key with Custom Name and Comment (On Fedora Client)
```bash
# Generate ed25519 key (most secure and modern)
ssh-keygen -t ed25519 -C "bijoy@ws-to-server" -f ~/.ssh/fedora-server-key
ssh-keygen -t ed25519 -C "bijoy@ws-to-void" -f ~/.ssh/void-server-key
ssh-keygen -t ed25519 -C "bijoy@ws-to-slackware" -f ~/.ssh/slackware-server-key

# Explanation:
# -t ed25519        : Key type (most secure)
# -C "comment"      : Comment to identify the key
# -f ~/.ssh/name    : Custom filename

# When prompted:
# Enter passphrase: (Type secure passphrase)
# Confirm passphrase: (Type same passphrase again)
```

### Step 9: Verify Key Generation
```bash
# List your SSH keys
ls -la ~/.ssh/

# You should see:
# fedora-server-key      (private key - NEVER share)
# fedora-server-key.pub  (public key - safe to share)
```

### Step 10: Copy Public Key to Remote Server
```bash
# Method 1: Using ssh-copy-id (recommended)
ssh-copy-id -i ~/.ssh/fedora-server-key.pub bijoy@192.168.122.X
ssh-copy-id -i ~/.ssh/void-server-key.pub bijoy@192.168.122.X
ssh-copy-id -i ~/.ssh/slackware-server-key.pub bijoy@192.168.122.X

# Enter the user's password when prompted
# This will copy your public key to the server's authorized_keys file

# Method 2: Manual copy (if ssh-copy-id doesn't work)
cat ~/.ssh/fedora-server-key.pub | ssh username@192.168.122.X "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

### Step 11: Test Passwordless Login
```bash
# Connect using your private key
ssh -i ~/.ssh/fedora-server-key bijoy@192.168.122.X
ssh -i ~/.ssh/void-server-key bijoy@192.168.122.X
ssh -i ~/.ssh/void-server-key bijoy@192.168.122.X

# You'll be asked for the KEY PASSPHRASE (not user password)
# If successful, you're now connected without user password

# Exit to continue configuration
exit
```

---

## Part 5: SSH Server Security Hardening

### Step 12: Create Custom SSH Configuration
```bash
# On the SERVER, create custom config file (Fedora and Void)
# Backup original config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sudo nano /etc/ssh/sshd_config.d/custom.conf
# Slackware
# Check SSH status on Slackware
ps aux | grep sshd
netstat -tlnp | grep :22
# Edit config file on Slackware
sudo nano /etc/ssh/sshd_config
# Look for these lines and change them on Slackware:

# Add these lines:
Port 2222
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes

# Save and exit (Ctrl+O, Enter, Ctrl+X)
```

**Configuration Explanation:**
- `Port 2222`: Change from default port 22 (security through obscurity)
- `PermitRootLogin no`: Disable root login via SSH
- `PasswordAuthentication no`: Force key-based authentication only
- `PubkeyAuthentication yes`: Enable SSH key authentication

### Step 13: Configure SELinux for Custom Port
```bash
# Allow SSH to use port 2222 (Fedora/SE Linux specific)
sudo semanage port -a -t ssh_port_t -p tcp 2222

# Verify the port was added
sudo semanage port -l | grep ssh
# Should show: ssh_port_t    tcp    2222, 22
```

### Step 14: Configure Firewall
```bash
# Properly secure (remove broad range, add specific port):
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-port=1025-65535/udp
# Add custom SSH port to firewall
sudo firewall-cmd --permanent --add-port=2222/tcp
# Reload firewall rules
sudo firewall-cmd --reload
# Verify port is open
sudo firewall-cmd --list-ports
# Should show: 2222/tcp
```

### Step 15: Restart SSH Service
```bash
# Restart SSH to apply new configuration
sudo systemctl restart sshd
sudo sv restart sshd
sudo /etc/rc.d/rc.sshd restart # Slackware

# Check service status
sudo systemctl status sshd
sudo sv status sshd
# Should show: Active: active (running)

# Verify SSH is listening on new port
sudo ss -tlnp | grep ssh
# Should show port 2222 listening
```

### Step 16: Test Connection with New Port
```bash
# From CLIENT, test connection with new port
ssh -i ~/.ssh/fedora-server-key -p 2222 bijoy@192.168.122.X
ssh -i ~/.ssh/void-server-key -p 2222 bijoy@192.168.122.X
ssh -i ~/.ssh/slackware-server-key -p 2222 bijoy@192.168.122.X

# If successful, you're connected via port 2222
# Exit to continue
exit
```

---

## Part 6: SSH Config File for Convenience

### Step 17: Create SSH Client Config
```bash
# On CLIENT machine, create/edit SSH config
nano ~/.ssh/config

# Add this configuration:
Host server
    HostName 192.168.122.X
    User bijoy
    Port 2222
    IdentityFile ~/.ssh/fedora-server-key
    
Host void
    HostName 192.168.122.X
    User bijoy
    Port 2222
    IdentityFile ~/.ssh/void-server-key
    
Host slackware
    HostName 192.168.122.X
    User bijoy
    Port 2222
    IdentityFile ~/.ssh/slackware-server-key

# Save and exit (Ctrl+O, Enter, Ctrl+X)
```

### Step 18: Set Correct Permissions on Config
```bash
# SSH config must have restricted permissions
chmod 600 ~/.ssh/config

# Verify permissions
ls -la ~/.ssh/config
# Should show: -rw------- (600)
```

### Step 19: Test SSH Config Alias
```bash
# Now you can connect using the alias
ssh server
ssh void
ssh slackware

# No need to specify:
# - IP address
# - Port number
# - Username
# - Key file path

# Everything is handled by the config file
```

---

## Part 7: Multiple Server Configuration

### Step 20: Add Multiple Servers to Config
```bash
# Edit SSH config
nano ~/.ssh/config

# Add multiple server configurations:
Host fedora-server
    HostName 192.168.1.100
    User bijoy
    Port 2222
    IdentityFile ~/.ssh/fedora-server-key

Host production-server
    HostName 203.0.113.50
    User admin
    Port 22
    IdentityFile ~/.ssh/production-key

Host vm-test
    HostName 192.168.122.170
    User bijoy
    Port 2222
    IdentityFile ~/.ssh/vm-test-key

# Save and exit
```

### Step 21: Test All Connections
```bash
# Connect to each server using aliases
ssh fedora-server
exit

ssh production-server
exit

ssh vm-test
exit
```

---

## Part 8: File Synchronization:

### Step 22: Sync with scp over SSH
```bash
# Upload files
scp -r ./documents/ user@backup-server:~/backups/

# Download backups
scp -r user@backup-server:~/backups/ ./restored-files/
```

### Step 23: Sync with rsync over SSH
```bash
# Upload files
rsync -avz -e ssh ./local-folder/ user@server:~/remote-folder/
rsync -avzH --dry-run --delete  -e ssh /home/bijoy/Documents/ bijoy@server:~/Documents/

# Download remote files
rsync -avzH --dry-run --delete  -e ssh bijoy@server:~/Documents/ /home/bijoy/Documents/
```


## Part 9: Troubleshooting and Verification

### Step 24: Verify SSH Server Configuration
```bash
# On SERVER, test configuration syntax
sudo sshd -t

# No output = configuration is valid
# Errors will be displayed if syntax is wrong
```

### Step 25: Check SSH Authentication Logs
```bash
# On SERVER, view SSH authentication logs
sudo journalctl -u sshd -f

# Keep this running in a separate terminal
# Try connecting from client to see live logs
```

### Step 26: Debug SSH Connection Issues
```bash
# From CLIENT, use verbose mode for debugging
ssh -vvv fedora-server

# This shows detailed connection process:
# - Key negotiation
# - Authentication attempts
# - Connection establishment

# Use this when troubleshooting connection problems
```

---

## Security Best Practices Summary

✅ **Completed Security Measures:**
1. SSH keys instead of passwords
2. Custom SSH port (2222 instead of 22)
3. Root login disabled
4. Password authentication disabled
5. SELinux configured for custom port
6. Firewall configured for custom port
7. Key passphrase protection

✅ **Additional Security Tips:**
- Keep private keys (`fedora-server-key`) secure and never share them
- Use strong passphrases for SSH keys
- Regularly update SSH server: `sudo dnf update openssh-server`
- Monitor SSH logs: `sudo journalctl -u sshd`
- Consider fail2ban for brute-force protection
- Backup your SSH keys to secure location

---

## Quick Reference Commands

### Common SSH Operations
```bash
# Connect to server using alias
ssh fedora-server

# Copy file to server
scp file.txt fedora-server:/path/to/destination/

# Copy file from server
scp fedora-server:/path/to/file.txt ./local-destination/

# Copy directory to server
scp -r directory/ fedora-server:/path/to/destination/

# Execute single command on server
ssh fedora-server "ls -la /var/log"

# SSH with port forwarding
ssh -L 8080:localhost:80 fedora-server
```

### SSH Key Management
```bash
# Generate new key
ssh-keygen -t ed25519 -C "comment" -f ~/.ssh/keyname

# Copy key to server
ssh-copy-id -i ~/.ssh/keyname.pub user@server

# List keys in ssh-agent
ssh-add -l

# Add key to ssh-agent
ssh-add ~/.ssh/keyname

# Remove key from ssh-agent
ssh-add -d ~/.ssh/keyname
```

### SSH Service Management
```bash
# Check SSH service status
sudo systemctl status sshd

# Restart SSH service
sudo systemctl restart sshd

# View SSH configuration
sudo sshd -T

# Test configuration syntax
sudo sshd -t
```

---

## Your Complete SSH Setup is Now Done!

You now have:
- ✅ Secure SSH server with custom port
- ✅ Key-based authentication only
- ✅ Convenient SSH config for easy connections
- ✅ SELinux and firewall properly configured
- ✅ No root login allowed
- ✅ No password authentication allowed

**Your typical workflow:**
1. `ssh fedora-server` - Connect instantly using alias
2. Enter key passphrase once per session
3. Work on remote server
4. `exit` - Disconnect

That's it - simple, secure, and convenient!
