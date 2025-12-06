#!/bin/bash

set -e

brew install starship

[ -e ~/.config/starship.toml ] || [ -L ~/.config/starship.toml ] && rm ~/.config/starship.toml

ln -s "$DOTFILES_DIR/modules/starship/starship.toml" ~/.config/starship.toml