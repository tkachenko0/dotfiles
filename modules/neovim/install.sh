#!/bin/bash

set -e

sudo apt install -y ripgrep

brew install neovim luarocks

cargo install --locked tree-sitter-cli

rm -rf "$DOTFILES_DIR/../nvim"
git clone git@github.com:tkachenko0/nvim.git "$DOTFILES_DIR/../nvim"

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s "$DOTFILES_DIR/../nvim" ~/.config/nvim
