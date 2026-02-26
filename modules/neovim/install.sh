#!/usr/bin/env bash

set -e

brew install ripgrep

export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"
brew install neovim luarocks

brew install tree-sitter-cli
# or
# cargo install --locked tree-sitter-cli

rm -rf "$DOTFILES_DIR/../nvim"
git clone git@github.com:tkachenko0/nvim.git "$DOTFILES_DIR/../nvim"

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && rm -rf ~/.config/nvim
mkdir -p ~/.config
ln -s "$DOTFILES_DIR/../nvim" ~/.config/nvim

mkdir -p ~/dev/databases
touch ~/dev/databases/connections.json
