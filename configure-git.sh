#! /bin/bash

set -euo pipefail

SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

# Install the dotfiles
cd ~
"${SCRIPT_DIR}/copy-dotfile.sh" .gitconfig
