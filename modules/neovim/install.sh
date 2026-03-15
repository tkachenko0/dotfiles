#!/usr/bin/env bash

set -e

brew install ripgrep neovim luarocks tree-sitter-cli

rm -rf "$DOTFILES_DIR/../nvim"
git clone git@github.com:tkachenko0/nvim.git "$DOTFILES_DIR/../nvim"

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s "$DOTFILES_DIR/../nvim" ~/.config/nvim

mkdir -p ~/.local/share/nvim/site/spell
curl -fLo ~/.local/share/nvim/site/spell/it.utf-8.spl "https://ftp.nluug.nl/pub/vim/runtime/spell/it.utf-8.spl"

mkdir -p ~/dev/databases
touch ~/dev/databases/connections.json
