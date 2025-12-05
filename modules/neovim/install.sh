#!/bin/bash

set -e

apt install -y ripgrep luarocks
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

git clone git@github.com:tkachenko0/nvim.git ~/dev/personal/nvim
ln -s ~/dev/personal/nvim ~/.config/nvim