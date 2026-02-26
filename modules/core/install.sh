#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt upgrade -y
        sudo apt install -y \
            make \
            build-essential \
            procps \
            curl \
            libssl-dev \
            zlib1g-dev \
            fzf \
            gcc \
            jq \
            unzip
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install fzf jq 
fi
