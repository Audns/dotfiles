#!/usr/bin/env bash
# compact-workspaces.sh
# Compacts Hyprland workspaces by filling gaps, moving windows by actual workspace ID.
# e.g. workspaces 1, 3, 4, 5  →  1, 2, 3, 4

set -euo pipefail

# Get all occupied workspace IDs, sorted numerically, excluding special workspaces (negative IDs)
mapfile -t workspaces < <(
    hyprctl workspaces -j \
    | jq '[.[] | select(.id > 0) | .id] | sort[]'
)

# Nothing to do if 0 or 1 workspace
if (( ${#workspaces[@]} <= 1 )); then
    exit 0
fi

# Remember which workspace is currently active so we can follow it
active_ws=$(hyprctl activeworkspace -j | jq '.id')

expected=1
for ws in "${workspaces[@]}"; do
    if (( ws != expected )); then
        # Get all window addresses on this workspace
        mapfile -t windows < <(
            hyprctl clients -j \
            | jq -r --argjson ws "$ws" '.[] | select(.workspace.id == $ws) | .address'
        )

        # Move each window to the target workspace ID
        for addr in "${windows[@]}"; do
            hyprctl dispatch movetoworkspacesilent "$expected,address:$addr"
        done

        # Track where the active workspace ended up
        if (( ws == active_ws )); then
            active_ws=$expected
        fi
    fi
    (( expected++ ))
done

# Switch to wherever the originally active workspace moved to
hyprctl dispatch workspace "$active_ws"
