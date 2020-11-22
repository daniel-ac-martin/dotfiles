#! /bin/bash

set -euo pipefail

SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

# Install the dotfiles
cd ~
"${SCRIPT_DIR}/install-dotfile.sh" .bash_logout
"${SCRIPT_DIR}/install-dotfile.sh" .bash_profile
"${SCRIPT_DIR}/install-dotfile.sh" .bashrc
