#!/bin/bash

set -e

# Skip homebrew installation in Docker (running as root)
if [ "$EUID" -eq 0 ]; then
    echo "Skipping Homebrew installation (running as root)"
    exit 0
fi

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"