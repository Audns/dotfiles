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
TMUXP_DIR="$HOME/dotfiles/tmuxp_payload"
# --- Logic ---
# Temporary file to store the combined list
TEMP_LIST=$(mktemp)
# Get existing tmux sessions and format them
if command -v tmux &>/dev/null && tmux ls &>/dev/null; then
	tmux ls -F "#{session_name}" | while read -r session; do
		echo "[ACTIVE] $session" >>"$TEMP_LIST"
	done
fi
# Get tmuxp yaml files recursively if directory exists
if [ -d "$TMUXP_DIR" ]; then
	# Use find to recursively search for yaml/yml files
	find "$TMUXP_DIR" -type f \( -name "*.yaml" -o -name "*.yml" \) 2>/dev/null | while read -r file; do
		# Get the relative path from TMUXP_DIR
		relative_path="${file#$TMUXP_DIR/}"
		echo "$relative_path" >>"$TEMP_LIST"
	done
fi
# Check if we have any options
if [ ! -s "$TEMP_LIST" ]; then
	notify-send "Error" "No tmux sessions or tmuxp configs found"
	rm "$TEMP_LIST"
	exit 1
fi
# Show the combined list in fuzzel
SELECTED=$(cat "$TEMP_LIST" | fuzzel -d -p "Tmux>" --config ~/.config/fuzzel/fuzzel.ini)
# Clean up temp file
rm "$TEMP_LIST"
# Check if user selected something
if [ -n "$SELECTED" ]; then
	# Determine if it's an active session or a config file
	if [[ "$SELECTED" == \[ACTIVE\]* ]]; then
		# Extract session name (remove "[ACTIVE] " prefix)
		SESSION_NAME="${SELECTED#\[ACTIVE\] }"
		# Attach to existing session
		$TERMINAL $EXEC_FLAG tmux attach-session -t "$SESSION_NAME"
	else
		# It's a config file (could include subdirectory path)
		FULL_PATH="$TMUXP_DIR/$SELECTED"
		# Validate file exists
		if [ -f "$FULL_PATH" ]; then
			# Load tmuxp config
			$TERMINAL $EXEC_FLAG tmuxp load -y "$FULL_PATH"
		else
			notify-send "Error" "Config file does not exist: $SELECTED"
			exit 1
		fi
	fi
fi
