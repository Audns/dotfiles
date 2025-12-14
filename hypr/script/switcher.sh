#!/bin/bash

window_list=$(hyprctl clients -j | jq -r '.[] | "\(.workspace.id)|\(.title)|\(.class)"' | sort -n)

if [ -z "$window_list" ]; then
	notify-send "No windows found"
	exit 1
fi

formatted_list=$(echo "$window_list" | awk -F'|' '{printf "%s: %s - %s\n", $1, $3, $2}')

selected=$(echo "$formatted_list" | fuzzel --dmenu --prompt="Window>")

if [ -z "$selected" ]; then
	exit 0
fi

workspace_id=$(echo "$selected" | sed 's/WS:\([0-9]*\).*/\1/')

hyprctl dispatch workspace "$workspace_id"
