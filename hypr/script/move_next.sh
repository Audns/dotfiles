#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
hyprctl dispatch movetoworkspace $((current + 1))
