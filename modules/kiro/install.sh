#!/bin/bash

set -e

curl -fsSL https://cli.kiro.dev/install | bash

KIR_DIR=~/.kiro

mkdir -p $KIR_DIR

rm -rf "$KIR_DIR/settings"
ln -s "$DOTFILES_DIR/modules/kiro/settings" "$KIR_DIR/settings"

rm -rf "$KIR_DIR/steering"
ln -s "$DOTFILES_DIR/modules/kiro/steering" "$KIR_DIR/steering"
