#!/usr/bin/env bash
set -Eeuo pipefail

# We are intentionally looking at the sandbox's TEMPLATE here, not the sandbox
# itself. We initialize templates, not sandboxes, with Openbox.
config_dir="${LXQ_REPO_DIR}/templates/${LXQ_TEMPLATE_NAME}/config.d"
test -d "${config_dir}" || lxq_panic "${LXQ_SANDBOX_NAME}'s template \"${LXQ_TEMPLATE_NAME}\" does not exist."

config_file="${config_dir}/${LXQ_OPENBOX_CONFIG_FILE}"
test -f "${config_file}" || exit 0 # This sandbox hasn't been configured for Openbox. Do nothing.

# Ok, we've determined that the template was set up with Openbox. So we know
# that the sandbox should have all the necessary requirements as well. Now we
# can run Openbox in the sandbox.
lxc-attach --name "sbox-${LXQ_SANDBOX_NAME}" \
    --clear-env \
    --keep-var TERM \
    -- \
    nohup bash -c "sudo --user ${LXQ_CONTAINER_USER} openbox-session &" \
    2&> /dev/null &
