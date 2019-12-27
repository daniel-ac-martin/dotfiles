#! /bin/bash

set -euo pipefail

script_dir=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

cd ~
"${script_dir}/install-dotfile.sh" .tmux.conf
sudo dnf install -y tmux
