#!/bin/bash

# Define the directories to sync (relative to ~/.config/)
dirs=("fish" "ghostty" "fuzzel" "waybar" "nvim" "hypr" "helix" "mako")
# Base source and destination paths
src_base="$HOME/.config"
dst_base="$HOME/second/codespace/dotfiles"

# Loop over directories and sync each
for dir in "${dirs[@]}"; do
    rsync -rv --exclude '.git' "$src_base/$dir/" "$dst_base/$dir/"
done

rsync -rv --exclude '.git' ~/.tmux.conf "$dst_base/$dir/"
