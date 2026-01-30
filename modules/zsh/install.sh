#!/bin/bash

set -e

sudo apt install -y zsh

ZSH_CUSTOM_PLUGINS=$HOME/zsh-plugins

# Remove existing and .zshrc
( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s "$(which zsh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS}/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions

# Remove oh-my-zsh created .zshrc and link our custom one
( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc
ln -s "$DOTFILES_DIR/modules/zsh/.zshrc" ~/.zshrc
