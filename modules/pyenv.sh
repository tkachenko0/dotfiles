#!/bin/bash

set -e

curl -fsSL https://pyenv.run | bash

pyenv install 3.12.3
pyenv global 3.12.3