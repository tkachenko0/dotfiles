#!/usr/bin/env bash

set -e

DOTNET_VERSION="${DOTNET_VERSION:-8.0.400}"
DOTNET_DIR="$HOME/.dotnet"

if [ -d "$DOTNET_DIR" ]; then
    echo ".NET already installed at $DOTNET_DIR"
    exit 0
fi

echo "Installing .NET SDK $DOTNET_VERSION..."

wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh
chmod +x /tmp/dotnet-install.sh
/tmp/dotnet-install.sh --version "$DOTNET_VERSION" --install-dir "$DOTNET_DIR"
rm /tmp/dotnet-install.sh
