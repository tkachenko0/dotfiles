#!/bin/bash

set -e

sudo apt install -y git

# Use config values or prompt
if [ -z "$GIT_USERNAME" ] || [ -z "$GIT_EMAIL" ]; then
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email
else
    git_username="$GIT_USERNAME"
    git_email="$GIT_EMAIL"
fi

git config --global user.name "$git_username"
git config --global user.email "$git_email"
git config --global init.defaultBranch main
git config --global core.editor "nvim"
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Visual Studio Dark+"
git config --global delta.hunk-header-style omit
git config --global delta.dark true