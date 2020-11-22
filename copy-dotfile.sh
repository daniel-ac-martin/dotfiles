#! /bin/bash

set -e

FILE="${1}"
DIR=$(dirname "${FILE}")

mkdir -p "${DIR}"

REPO_FILE=$(realpath --relative-to="${HOME}" "${FILE}")
SCRIPT_DIR=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")
TARGET="${SCRIPT_DIR}/${REPO_FILE}"

BASE_DIR=$(dirname "${FILE}")
TARGET=$(realpath --relative-to="${BASE_DIR}" "${TARGET}")

cp -v "${TARGET}" "${FILE}"
