#!/bin/bash

set -e

mkdir -p ~/dev/personal/todos
touch ~/dev/personal/todos/todo.md

ln -s "$DOTFILES_DIR/modules/personal-dir/.tmux-sessionizer" ~/dev/personal/.tmux-sessionizer
