#!/bin/bash
# Get current workspace ID
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Get all window addresses on current workspace and close them
hyprctl clients -j | jq -r ".[] | select(.workspace.id == $current_workspace) | .address" | while read -r addr; do
	hyprctl dispatch closewindow address:$addr
done
