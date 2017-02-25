#! /bin/bash

set -e

SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")
LOGIN_FISH="/usr/local/bin/login-fish"

cd ~
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/config.fish
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/functions/fish_prompt.fish
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/functions/:q.fish
"${SCRIPT_DIR}/install-dotfile.sh" .config/fish/functions/q.fish
sudo dnf install -y fish
sudo cp "${SCRIPT_DIR}/system-wide/${LOGIN_FISH}" "${LOGIN_FISH}"
sudo sed -ri "s|^(${USER}:.*:).*$|\1${LOGIN_FISH}|" /etc/passwd
