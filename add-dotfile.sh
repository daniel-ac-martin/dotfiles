#! /bin/bash

set -e

FILE="${1}"
SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")
REPO_FILE=$(realpath --relative-to="${HOME}" "${FILE}")
TARGET="${SCRIPT_DIR}/${REPO_FILE}"

TARGET_DIR=$(dirname "${TARGET}")

mkdir -p "${TARGET_DIR}"
mv "${FILE}" "${TARGET}"
"${SCRIPT_DIR}/install-dotfile.sh" "${FILE}"
