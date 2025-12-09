#!/bin/bash

set -e

[ -d ~/.pyenv ] && rm -rf ~/.pyenv

curl -fsSL https://pyenv.run | bash
