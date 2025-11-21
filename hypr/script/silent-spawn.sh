#!/bin/bash

# --- Configuration ---
MENU_FILES=(
    "$HOME/.config/hypr/script/custom-commands/menu"
    "$HOME/.config/hypr/script/custom-commands/local-menu"
)

# --- Helper Functions ---
combined_menu() {
    for file in "${MENU_FILES[@]}"; do
        [[ -f "$file" ]] && grep -vE '^\s*(#|$)' "$file"
    done
}

# --- Main Logic ---

# 1. Get the command
SELECTED_CMD=$(combined_menu | \
    fuzzel --dmenu --prompt="Silent> " \
    --config ~/.config/fuzzel/fuzzel.ini | \
    awk -F' \\| ' '{print $2}')

if [ -z "$SELECTED_CMD" ]; then
    exit 0
fi

# 2. Calculate the next available workspace ID
NEXT_WS=$(($(hyprctl workspaces | grep "ID" | awk '{print $3}' | sort -n | tail -1) + 1))

# 3. Smart Execution Logic
# Check if the command is ALREADY a manual "hyprctl dispatch exec" command with rules (like your float example)
if [[ "$SELECTED_CMD" == *"hyprctl dispatch exec"* ]] && [[ "$SELECTED_CMD" == *"["* ]]; then
    # LOGIC: The user has defined custom rules (float, size, etc.). 
    # We must INJECT our workspace rule into their existing rule brackets.
    
    # This sed command looks for "hyprctl dispatch exec" followed by a "[", 
    # and inserts "workspace N silent; " right inside that bracket.
    FINAL_CMD=$(echo "$SELECTED_CMD" | sed "s/\(hyprctl dispatch exec.*\[\)/\1workspace $NEXT_WS silent; /")
    
    # We use eval because the command string acts as a full shell command (bash -c ...)
    eval "$FINAL_CMD"

else
    # LOGIC: Standard command (e.g., "firefox", "code").
    # We simply wrap it in our own silent workspace rule.
    hyprctl dispatch exec "[workspace $NEXT_WS silent] $SELECTED_CMD"
fi
