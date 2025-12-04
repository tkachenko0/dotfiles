#!/bin/bash

set -e

brew install tmux
[ -e ~/.tmux.conf ] || [ -L ~/.tmux.conf ] && rm ~/.tmux.conf
ln -s $(dirname "$0")/.tmux.conf ~/.tmux.conf
