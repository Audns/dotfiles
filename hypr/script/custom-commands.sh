#!/bin/bash
#
# List of menu files to combine
MENU_FILES=(
    "$HOME/.config/hypr/script/custom-commands/menu"
    "$HOME/.config/hypr/script/custom-commands/local-menu"
    # Add more files here if needed
)

# Combine all files (preserving order), skip empty lines and comments
combined_menu() {
    for file in "${MENU_FILES[@]}"; do
        [[ -f "$file" ]] && grep -vE '^\s*(#|$)' "$file"
    done
}

combined_menu | \
    fuzzel --dmenu --prompt="> " \
        --config ~/.config/fuzzel/fuzzel.ini | \
    awk -F' \\| ' '{print $2}' | \
    ${SHELL:-/bin/bash}
