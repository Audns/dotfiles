#!/bin/bash
# Get the highest workspace number currently in use
get_next_workspace() {
    # Get all workspace IDs and find the highest one
    local max_ws=$(hyprctl workspaces -j | jq -r '.[].id' | sort -n | tail -1)

    # If no workspaces found, start at 1, otherwise add 1 to max
    if [ -z "$max_ws" ]; then
        echo 1
    else
        echo $((max_ws + 1))
    fi
}
# Get the next available workspace
NEXT_WS=$(get_next_workspace)
# Check if a command was provided
if [ $# -eq 0 ]
    then
    echo "Usage: $0 <command> [args...]"
    echo "Example: $0 firefox"
    echo "Example: $0 'ghostty --gtk-single-instance=false'"
    exit 1
    fi
    hyprctl dispatch exec "[workspace $NEXT_WS silent] $@"
