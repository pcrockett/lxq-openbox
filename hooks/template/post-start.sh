#!/usr/bin/env bash
set -Eeuo pipefail

config_dir="${LXQ_REPO_DIR}/templates/${LXQ_TEMPLATE_NAME}/config.d"
test -d "${config_dir}" || lxq_panic "Template \"${LXQ_TEMPLATE_NAME}\" does not exist."

config_file="${config_dir}/${LXQ_OPENBOX_CONFIG_FILE}"
test -f "${config_file}" || exit 0 # This template hasn't been configured for Openbox. Do nothing.

lxc-attach --name "templ-${LXQ_TEMPLATE_NAME}" \
    --clear-env \
    --keep-var TERM \
    -- \
    nohup bash -c "sudo --user ${LXQ_CONTAINER_USER} openbox-session &" \
    2&> /dev/null &
