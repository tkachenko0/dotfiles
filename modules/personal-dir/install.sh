#!/usr/bin/env bash

set -e

mkdir -p ~/dev/personal/todos
touch ~/dev/personal/todos/todo.md

TMUX_SESSIONIZER_FILE=~/dev/personal/.tmux-sessionizer

[ -e $TMUX_SESSIONIZER_FILE ] || [ -L $TMUX_SESSIONIZER_FILE ] && rm $TMUX_SESSIONIZER_FILE

ln -s "$DOTFILES_DIR/modules/personal-dir/.tmux-sessionizer" $TMUX_SESSIONIZER_FILE
