#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="$DOTFILES_DIR/modules"

MODULES=(
    "core"
    "git" 
    "zsh"
    "homebrew"
    "delta"
    "starship"
    "tmux"
    "nvm"
    "pyenv"
    "neovim"
    "scripts"
)

run_module() {
    local module="$1"
    local module_file="$MODULES_DIR/$module.sh"
    
    if [ ! -f "$module_file" ]; then
        echo "Module $module not found"
        exit 1
    fi
    
    echo "Installing $module..."
    export DOTFILES_DIR
    bash "$module_file"
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 [module|all]"
    echo "Modules: ${MODULES[*]}"
    exit 1
fi

if [ "$1" = "all" ]; then
    for module in "${MODULES[@]}"; do
        run_module "$module"
    done
elif [[ " ${MODULES[*]} " =~ " $1 " ]]; then
    run_module "$1"
else
    echo "Unknown module: $1"
    exit 1
fi

echo "Installation completed!"