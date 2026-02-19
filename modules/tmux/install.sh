#!/usr/bin/env bash

set -e

export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

brew install tmux

[ -e ~/.tmux.conf ] || [ -L ~/.tmux.conf ] && rm ~/.tmux.conf
ln -s "$DOTFILES_DIR/modules/tmux/.tmux.conf" ~/.tmux.conf
