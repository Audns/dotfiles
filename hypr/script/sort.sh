#!/bin/bash

# Get occupied workspace IDs sorted
mapfile -t OCCUPIED < <(hyprctl workspaces -j | jq '[.[].id | select(. > 0)] | sort[]')

[[ ${#OCCUPIED[@]} -le 1 ]] && { hyprctl dispatch 'hl.dsp.exec_raw("notify-send Hyprland \"Already compact\" -t 2000")'; exit; }

# Get active workspace id
ACTIVE=$(hyprctl activeworkspace -j | jq '.id')
NEW_ACTIVE=$ACTIVE
TARGET=1

for OLD_ID in "${OCCUPIED[@]}"; do
    if (( OLD_ID != TARGET )); then
        # Move all windows on OLD_ID to TARGET
        hyprctl clients -j \
            | jq -r ".[] | select(.workspace.id == $OLD_ID) | .address" \
            | while read -r ADDR; do
                hyprctl dispatch "hl.dsp.window.move({workspace = $TARGET, window = \"address:$ADDR\"})"
            done

        (( OLD_ID == ACTIVE )) && NEW_ACTIVE=$TARGET
    fi
    (( TARGET++ ))
done

hyprctl dispatch "hl.dsp.focus({workspace = $NEW_ACTIVE})"
