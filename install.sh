#!/bin/bash

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="$DOTFILES_DIR/modules"

# Source configs if available
[ -f "$DOTFILES_DIR/configs" ] && source "$DOTFILES_DIR/configs"

MODULES=(
    "core"
    "git" 
    "zsh"
    "homebrew"
    "homebrew-packages"
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
    local module_dir="$MODULES_DIR/$module"
    local module_file="$module_dir/install.sh"
    
    if [ ! -f "$module_file" ]; then
        echo -e "${RED}Module $module not found${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Installing $module...${NC}"
    export DOTFILES_DIR
    export GIT_USERNAME
    export GIT_EMAIL
    bash "$module_file"
}

if [ $# -eq 0 ]; then
    echo -e "${BLUE}Usage: $0 [module|all]${NC}"
    echo -e "${BLUE}Modules: ${MODULES[*]}${NC}"
    exit 1
fi

if [ "$1" = "all" ]; then
    for module in "${MODULES[@]}"; do
        run_module "$module"
    done
elif [[ " ${MODULES[*]} " =~ " $1 " ]]; then
    run_module "$1"
else
    echo -e "${RED}Unknown module: $1${NC}"
    exit 1
fi

echo -e "${GREEN}Installation completed!${NC}"
