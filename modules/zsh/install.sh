#!/bin/bash

set -e

sudo apt install -y zsh

# Remove existing oh-my-zsh and .zshrc
[ -d ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh
( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# chsh -s "$(which zsh)"

# Remove oh-my-zsh created .zshrc and link our custom one
( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc
ln -s "$DOTFILES_DIR/modules/zsh/.zshrc" ~/.zshrc
