#! /bin/bash

set -e

SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

cd ~
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
"${SCRIPT_DIR}/install-dotfile.sh" .spacemacs
sudo dnf install -y -q emacs
