#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/tkachenko0/dotfiles.git"
INSTALL_DIR="$HOME/dev/personal/dotfiles"

echo "Installing dotfiles..."

if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git first."
    exit 1
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Directory $INSTALL_DIR already exists. Updating..."
    cd "$INSTALL_DIR" && git pull
else
    echo "Cloning repository..."
    mkdir -p "$(dirname "$INSTALL_DIR")"
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

read -p "Enter your Git email: " GIT_EMAIL
export GIT_EMAIL

./setup all

echo "Installation complete!"
