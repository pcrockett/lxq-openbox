#!/usr/bin/env bash
set -Eeuo pipefail

# TODO: Check to see if openbox has been configured for this sandbox or not. Only execute the following if so.
lxc-attach --name "sbox-${LXQ_SANDBOX_NAME}" \
    --clear-env \
    --keep-var TERM \
    -- \
    nohup bash -c "sudo --user ${LXQ_CONTAINER_USER} openbox-session &" \
    2&> /dev/null &
