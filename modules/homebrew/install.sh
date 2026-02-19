#!/usr/bin/env bash

set -e

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

brew install \
    terraform \
    go \
    rust
