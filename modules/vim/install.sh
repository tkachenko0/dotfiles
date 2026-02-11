#!/bin/bash

set -e

sudo apt install -y vim

VIMRC_SOURCE="$DOTFILES_DIR/modules/vim/.vimrc"
VIMRC_TARGET="$HOME/.vimrc"

if [ -L "$VIMRC_TARGET" ]; then
    rm "$VIMRC_TARGET"
elif [ -f "$VIMRC_TARGET" ]; then
    mv "$VIMRC_TARGET" "$VIMRC_TARGET.backup"
fi

ln -s "$VIMRC_SOURCE" "$VIMRC_TARGET"

echo "Vim configured"
