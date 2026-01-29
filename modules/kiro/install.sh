#!/bin/bash

set -e

curl -fsSL https://cli.kiro.dev/install | bash

kiro-cli settings chat.diffTool "delta \
  --side-by-side \
  --syntax-theme 'Visual Studio Dark+' \
  --dark"

