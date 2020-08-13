#!/usr/bin/env bash
set -Eeuo pipefail

# TODO: Check to see if openbox has been configured for this template or not. Only execute the following if so.
lxc-attach --name "templ-${LXQ_TEMPLATE_NAME}" \
    --clear-env \
    --keep-var TERM \
    -- \
    nohup bash -c "sudo --user ${LXQ_CONTAINER_USER} openbox-session &" \
    2&> /dev/null &
