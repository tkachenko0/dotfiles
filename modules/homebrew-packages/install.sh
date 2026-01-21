#!/bin/bash

export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

brew install \
    yq \
    hurl
