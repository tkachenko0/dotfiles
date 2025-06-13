#!/bin/bash

apt update
apt upgrade -y

# Base packages
apt install -y fzf
apt install -y curl
apt install -y gcc
apt install -y git # ensure the latest git is installed to make neovim Diffview plugin work
apt install -y make build-essential procps curl libssl-dev zlib1g-dev

# Git
git config --global user.name "viacheslav.tkachenko"
git config --global user.email "t.viacheslav00@gmail.com"
git config --global init.defaultBranch main
git config --global core.editor "nvim"

# Homebrew
NONINTERACTIVE=1 \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Delta (diff viewer)
brew install git-delta
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Visual Studio Dark+"
git config --global delta.hunk-header-style omit
git config --global delta.dark true

## Scripts
ln -s ~/dev/personal/dotfiles/usr/local/bin/tmux-sessionizer /usr/local/bin/tmux-sessionizer
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-pullmaster /usr/local/bin/git-pullmaster
ln -s ~/dev/personal/dotfiles/usr/local/bin/kickass /usr/local/bin/kickass
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-branch-switcher /usr/local/bin/git-branch-switcher
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-stash-lister /usr/local/bin/git-stash-lister
ln -s ~/dev/personal/dotfiles/usr/local/bin/git-multiproj-branch-switcher /usr/local/bin/git-multiproj-branch-switcher

chmod +x /usr/local/bin/tmux-sessionizer
chmod +x /usr/local/bin/git-pullmaster
chmod +x /usr/local/bin/kickass
chmod +x /usr/local/bin/git-branch-switcher
chmod +x /usr/local/bin/git-stash-lister
chmod +x /usr/local/bin/git-multiproj-branch-switcher

# Zsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s "$(which zsh)"
rm ~/.zshrc
ln -s ~/dev/personal/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

# Tmux
apt -y install tmux
ln -s ~/dev/personal/dotfiles/.tmux.conf ~/.tmux.conf

# Node.js and npm and nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install --lts
source ~/.zshrc

# Python and pyenv
curl -fsSL https://pyenv.run | bash
pyenv install 3.12.3
pyenv global 3.12.3
source ~/.zshrc

# Neovim
apt install -y ripgrep
apt install -y luarocks
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux-x86_64.tar.gz
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
ln -s ~/dev/personal/dotfiles/.config/nvim/ ~/.config/nvim/
