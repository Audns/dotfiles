#!/bin/bash
#
fuzzel --dmenu --prompt="> " \
    --config ~/.config/fuzzel/fuzzel.ini \
    < ~/.config/hypr/script/menu \
    | awk -F' \\| ' '{print $2}' \
    | ${SHELL:-/bin/bash}
