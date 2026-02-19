#!/usr/bin/env bash

set -e

sudo apt install -y zsh
chsh -s "$(which zsh)"

# Install plugins
ZSH_PLUGINS=~/.zsh/plugins
rm -rf ${ZSH_PLUGINS}
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS/zsh-autosuggestions
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Remove oh-my-zsh created .zshrc and link our custom one
( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc
ln -s "$DOTFILES_DIR/modules/zsh/.zshrc" ~/.zshrc
