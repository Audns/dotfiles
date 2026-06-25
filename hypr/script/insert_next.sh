#!/bin/bash
# Get active workspace id
ACTIVE=$(hyprctl activeworkspace -j | jq '.id')
INSERT_AT=$(( ACTIVE + 1 ))

# Get occupied workspace IDs greater than ACTIVE, sorted descending
mapfile -t TO_SHIFT < <(hyprctl workspaces -j | jq "[.[].id | select(. > $ACTIVE)] | sort | reverse[]")

if [[ ${#TO_SHIFT[@]} -eq 0 ]]; then
    hyprctl dispatch "hl.dsp.focus({workspace = $INSERT_AT})"
    exit
fi

# Shift each workspace up by 1, highest first to avoid collisions
for OLD_ID in "${TO_SHIFT[@]}"; do
    NEW_ID=$(( OLD_ID + 1 ))
    hyprctl clients -j \
        | jq -r ".[] | select(.workspace.id == $OLD_ID) | .address" \
        | while read -r ADDR; do
            hyprctl dispatch "hl.dsp.window.move({workspace = $NEW_ID, window = \"address:$ADDR\"})"
        done
done

# Focus the now-empty inserted workspace
hyprctl dispatch "hl.dsp.focus({workspace = $INSERT_AT})"
