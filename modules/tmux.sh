#!/bin/bash

set -e

apt -y install tmux
ln -s ~/dev/personal/dotfiles/.tmux.conf ~/.tmux.conf