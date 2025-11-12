#!/usr/bin/env bash
set -euo pipefail

confirm() {
    local prompt="$1"
    local reply
    while true; do
        read -r -p "$prompt [y/N] " reply
        case "$reply" in
            [Yy]*) return 0 ;;   # yes
            [Nn]*|"") return 1 ;; # no or empty
            *) echo "Please answer y or n." ;;
        esac
    done
}

# ---- Your dangerous action -------------------------------------------------
if confirm "Delete all clipboard history? This cannot be undone!"; then
    if confirm "SECOND CONFIRMATION: Are you ABSOLUTELY sure?"; then
        rm -rf $HOME/.cache/cliphist/db
    else
        echo "Aborted on second confirmation."
        exit 1
    fi
else
    echo "Aborted on first confirmation."
    exit 1
fi
