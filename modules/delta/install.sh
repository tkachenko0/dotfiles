#!/bin/bash

set -e

export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

brew install git-delta

git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Visual Studio Dark+"
git config --global delta.hunk-header-style omit
git config --global delta.dark true
