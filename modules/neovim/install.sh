#!/bin/bash

set -e

sudo apt install -y ripgrep luarocks

if ! command -v nvim >/dev/null || ! nvim --version | grep -q "v0.9\|v0.10"; then
    cd /tmp
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm -f nvim-linux-x86_64.tar.gz
    cd - > /dev/null
fi

rm -rf "$DOTFILES_DIR/../nvim"
git clone https://github.com/tkachenko0/nvim.git "$DOTFILES_DIR/../nvim"

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s "$DOTFILES_DIR/../nvim" ~/.config/nvim