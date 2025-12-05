#!/bin/bash

set -e

apt -y install tmux
ln -s $(dirname "$0")/.tmux.conf ~/.tmux.conf