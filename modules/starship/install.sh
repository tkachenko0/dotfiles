#!/bin/bash

set -e

brew install starship

[ -e ~/.config/starship.toml ] || [ -L ~/.config/starship.toml ] && rm ~/.config/starship.toml

ln -s $(dirname "$0")/starship.toml ~/.config/starship.toml