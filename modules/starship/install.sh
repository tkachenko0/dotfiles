#!/bin/bash

set -e

brew install starship
ln -s $(dirname "$0")/starship.toml ~/.config/starship.toml