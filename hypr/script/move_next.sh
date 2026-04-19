#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
hyprctl dispatch "hl.dsp.window.move({workspace = $((current + 1))})"
