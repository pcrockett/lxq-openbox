#!/usr/bin/env bash
set -Eeuo pipefail

LXQ_OPENBOX_SCRIPT_DIR=$(dirname "$(readlink -f "${0}")")
export LXQ_OPENBOX_SCRIPT_DIR

LXQ_OPENBOX_REPO_DIR=$(dirname "${LXQ_OPENBOX_SCRIPT_DIR}")
export LXQ_OPENBOX_REPO_DIR
