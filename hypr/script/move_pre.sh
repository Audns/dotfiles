#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
if [ "$current" -gt 1 ]; then
    hyprctl dispatch "hl.dsp.window.move({workspace = $((current - 1))})"
fi
