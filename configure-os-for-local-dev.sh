#! /bin/bash

set -euo pipefail

script_dir=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

cd ~
"${script_dir}/copy-system-file.sh" /etc/sysctl.d/99-watches.conf
