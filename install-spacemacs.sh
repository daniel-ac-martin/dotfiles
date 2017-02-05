#! /bin/bash

set -e

SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

cd ~
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
"${SCRIPT_DIR}/install-dotfile.sh" .spacemacs
"${SCRIPT_DIR}/install-dotfile.sh" .emacs.d/private/dacm-keybindings/keybindings.el
"${SCRIPT_DIR}/install-dotfile.sh" .emacs.d/private/dacm-keybindings/packages.el
sudo dnf install -y -q emacs
