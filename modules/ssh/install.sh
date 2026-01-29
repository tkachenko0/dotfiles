#!/bin/bash

set -e

SSH_DIR="$HOME/.ssh"
SSH_CONFIG="$SSH_DIR/config"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [ -f "$SSH_CONFIG" ]; then
    echo "SSH config already exists at $SSH_CONFIG"
    echo "Backing up to $SSH_CONFIG.backup"
    cp "$SSH_CONFIG" "$SSH_CONFIG.backup"
fi

cat > "$SSH_CONFIG" << 'EOF'
# Default settings
Host *
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_ed25519
    ServerAliveInterval 60
    ServerAliveCountMax 3

# Example host configuration
# Host github
#     HostName github.com
#     User git
#     IdentityFile ~/.ssh/id_ed25519_github

# Host myserver
#     HostName example.com
#     User username
#     Port 22
#     IdentityFile ~/.ssh/id_ed25519
EOF

chmod 600 "$SSH_CONFIG"

echo "SSH config created at $SSH_CONFIG"

if [ ! -f "$SSH_DIR/id_ed25519" ]; then
    echo ""
    echo "No SSH key found. Generate one with:"
    echo "  ssh-keygen -t ed25519 -C \"your_email@example.com\""
fi
