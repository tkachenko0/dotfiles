#!/bin/bash

set -e

sudo apt install -y ripgrep luarocks

brew install neovim

rm -rf "$DOTFILES_DIR/../nvim"
git clone https://github.com/tkachenko0/nvim.git "$DOTFILES_DIR/../nvim"

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s "$DOTFILES_DIR/../nvim" ~/.config/nvim
