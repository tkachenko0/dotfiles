#!/usr/bin/env bash

curl -fsSL https://fnm.vercel.app/install | bash

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
fi

fnm install 20
