#!/bin/bash

set -e

sudo apt install -y zsh
chsh -s "$(which zsh)"

# Install plugins
ZSH_CUSTOM_PLUGINS=$HOME/.zsh-plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS}/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions

# Remove oh-my-zsh created .zshrc and link our custom one
( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc
ln -s "$DOTFILES_DIR/modules/zsh/.zshrc" ~/.zshrc
