#!/usr/bin/env bash

set -e

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &> /dev/null; then
        sudo apt install -y zsh
    fi
    chsh -s "$(which zsh)"
fi

ZSH_PLUGINS=~/.zsh/plugins
rm -rf ${ZSH_PLUGINS}
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS/zsh-autosuggestions

( [ -e ~/.zshrc ] || [ -L ~/.zshrc ] ) && rm ~/.zshrc
ln -s "$DOTFILES_DIR/modules/zsh/.zshrc" ~/.zshrc
