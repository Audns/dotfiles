#!/bin/bash

# Use a unique delimiter that won't appear in window titles
DELIM=$'\x1F' # ASCII Unit Separator character

window_list=$(hyprctl clients -j | jq -r --arg delim "$DELIM" '.[] | "\(.workspace.id)\($delim)\(.title)\($delim)\(.class)"' | sort -n)

if [ -z "$window_list" ]; then
	notify-send "No windows found"
	exit 1
fi

formatted_list=$(echo "$window_list" | awk -F"$DELIM" '{printf "%s: %s - %s\n", $1, $3, $2}')

selected=$(echo "$formatted_list" | fuzzel --dmenu --prompt="Window>")

if [ -z "$selected" ]; then
	exit 0
fi

workspace_id=$(echo "$selected" | sed 's/^\([0-9]*\).*/\1/')

hyprctl dispatch workspace "$workspace_id"
