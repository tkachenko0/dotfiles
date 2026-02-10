#!/bin/bash

set -e

curl -fsSL https://cli.kiro.dev/install | bash

KIR_DIR=~/.kiro

mkdir -p $KIR_DIR

link_kiro_folder() {
    folder_name="$1"
    rm -rf "${KIR_DIR}/${folder_name}"
    ln -s "${DOTFILES_DIR}/modules/kiro/${folder_name}" "${KIR_DIR}/${folder_name}"
}

link_kiro_folder "prompts"
link_kiro_folder "steering"
link_kiro_folder "settings"
