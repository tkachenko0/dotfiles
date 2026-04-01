#!/usr/bin/env bash

set -e

DOTNET_CHANNELS=("8.0" "10.0")
DOTNET_DIR="$HOME/.dotnet"

wget -q https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh
chmod +x /tmp/dotnet-install.sh

for channel in "${DOTNET_CHANNELS[@]}"; do
    echo "Installing .NET SDK (channel $channel)..."
    /tmp/dotnet-install.sh --channel "$channel" --install-dir "$DOTNET_DIR"
done

rm -f /tmp/dotnet-install.sh
