#!/bin/bash

set -e

curl -fsSL https://cli.kiro.dev/install | bash

kiro-cli settings chat.diffTool "delta \
  --navigate \
  --side-by-side \
  --line-numbers \
  --hyperlinks \
  --syntax-theme 'Visual Studio Dark+' \
  --hunk-header-style omit \
  --dark"

