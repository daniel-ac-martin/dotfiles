#! /bin/bash

set -e

SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

cd ~
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/config.fish
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/functions/fish_prompt.fish
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/functions/:q.fish
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/functions/q.fish
sudo dnf install -y fish
