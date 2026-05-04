#!/usr/bin/env bash

set -e

if ! grep -qi microsoft /proc/version 2>/dev/null; then
    echo "Skipping glazewm: not running under WSL"
    exit 0
fi

if [ -z "${WINDOWS_USERNAME:-}" ]; then
    echo "Missing WINDOWS_USERNAME in .env"
    exit 1
fi

GLAZEWM_DIR="/mnt/c/Users/$WINDOWS_USERNAME/.glzr/glazewm"

if [ ! -d "$GLAZEWM_DIR" ]; then
    echo "GlazeWM not installed on Windows: $GLAZEWM_DIR not found"
    exit 1
fi

cp "$DOTFILES_DIR/modules/glazewm/config.yaml" "$GLAZEWM_DIR/config.yaml"
echo "Copied config.yaml to $GLAZEWM_DIR/"
