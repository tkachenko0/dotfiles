#!/bin/bash

set -e

# Remove existing pyenv installation if it exists
[ -d ~/.pyenv ] && rm -rf ~/.pyenv

curl -fsSL https://pyenv.run | bash