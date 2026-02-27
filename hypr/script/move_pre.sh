#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
if [ "$current" -gt 1 ]; then
    hyprctl dispatch movetoworkspace $((current - 1))
fi
