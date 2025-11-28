#!/bin/bash

# --- Configuration ---

# 1. Set your preferred Terminal Emulator
# Common examples: foot, alacritty, kitty, gnome-terminal, wezterm
TERMINAL=$TERMINAL 

# 2. Set the argument flag your terminal uses to execute commands.
# Most terminals (foot, alacritty) use '-e'.
# If you use 'gnome-terminal', change this to '--'.
EXEC_FLAG="-e"

# 3. Path to your tmuxp configurations
# Standard paths are usually ~/.config/tmuxp or ~/.tmuxp
TMUXP_DIR="$HOME/tmuxp_payload"

# --- Logic ---

# Check if directory exists
if [ ! -d "$TMUXP_DIR" ]; then
    notify-send "Error" "Tmuxp directory not found at $TMUXP_DIR"
    exit 1
fi

# 1. List .yml and .yaml files in the directory
# 2. Pipe into fuzzel in 'dmenu' mode (-d) to use standard input
# 3. Use system config, but set a custom prompt
SELECTED=$(ls "$TMUXP_DIR"/*.y*ml 2>/dev/null | xargs -n 1 basename | fuzzel -d -p "Session: ")

# Check if the user selected a file or cancelled (empty string)
if [ -n "$SELECTED" ]; then
    # Construct the full path
    FULL_PATH="$TMUXP_DIR/$SELECTED"
    
    # Launch the terminal executing tmuxp
    # usage: terminal -e tmuxp load filename.yml
    $TERMINAL $EXEC_FLAG tmuxp load -y "$FULL_PATH"
fi
