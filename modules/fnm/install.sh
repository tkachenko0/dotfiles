#!/bin/bash

set -e

brew install fnm

eval "$(fnm env --use-on-cd)"

fnm install --lts
