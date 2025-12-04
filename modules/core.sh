#!/bin/bash

set -e

apt update && apt upgrade -y
apt install -y make build-essential procps curl libssl-dev zlib1g-dev fzf gcc