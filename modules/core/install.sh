#!/bin/bash

set -e

sudo apt update && sudo apt upgrade -y
sudo apt install -y make build-essential procps curl libssl-dev zlib1g-dev fzf gcc