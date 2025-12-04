#!/bin/bash

set -e

sudo apt install -y ripgrep luarocks

if ! command -v nvim >/dev/null || ! nvim --version | grep -q "v0.9\|v0.10"; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    if [ "$EUID" -ne 0 ]; then
        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    else
        rm -rf /opt/nvim
        tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    fi
    rm -f nvim-linux-x86_64.tar.gz
fi

rm -rf ~/dev/personal/nvim
git clone https://github.com/tkachenko0/nvim.git ~/dev/personal/nvim

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s ~/dev/personal/nvim ~/.config/nvim