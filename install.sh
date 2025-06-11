#!/bin/bash

apt update
apt upgrade -y

mkdir -p ~/dev/personal
mkdir ~/.config

# Base packages
apt install -y fzf
apt install -y curl
apt install -y gcc
apt install -y git # ensure the latest git is installed to make neovim Diffview plugin work

# Clone dotfiles repository
DOTFILES_DIR=~/dev/personal/dotfiles
git clone https://github.com/tkachenko0/dotfiles.git "$DOTFILES_DIR"

## Scripts
ln -s ~/dev/personal/dotfiles/usr/local/bin/tmux-sessionizer /usr/local/bin/tmux-sessionizer
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-pullmaster /usr/local/bin/git-pullmaster
ln -s ~/dev/personal/dotfiles/usr/local/bin/kickass /usr/local/bin/kickass
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-branch-switcher /usr/local/bin/git-branch-switcher
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-stash-lister /usr/local/bin/git-stash-lister
chmod +x /usr/local/bin/tmux-sessionizer
chmod +x /usr/local/bin/git-pullmaster
chmod +x /usr/local/bin/kickass
chmod +x /usr/local/bin/git-branch-switcher
chmod +x /usr/local/bin/git-stash-lister

# Zsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s "$(which zsh)"
rm ~/.zshrc
ln -s ~/dev/personal/dotfiles/.zshrc ~/.zshrc

# Tmux
apt install -y tmux
ln -s ~/dev/personal/dotfiles/.tmux.conf ~/.tmux.conf

# Node.js and npm and nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install --lts

# Neovim
apt install -y ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

git clone https://github.com/tkachenko0/nvim.git ~/.config/nvim
