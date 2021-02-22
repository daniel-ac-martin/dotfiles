#! /bin/bash

set -euo pipefail

script_dir=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

system_file_dir="./system-wide"

file="${1}"

dir=$(dirname "${file}")
target=$(realpath "${script_dir}/${system_file_dir}/${file}")

sudo mkdir -p "${dir}"
sudo cp -v "${target}" "${file}"
