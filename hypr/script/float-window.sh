#!/bin/bash

# Default window settings
SIZE="${FLOAT_SIZE:-1500 1000}"
POSITION="${FLOAT_POSITION:-center}"

# Parse options
while [[ "$1" =~ ^- ]]; do
    case "$1" in
        -s|--size)
            SIZE="$2"
            shift 2
            ;;
        -p|--position)
            POSITION="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: float-window [OPTIONS] COMMAND [ARGS...]"
            echo ""
            echo "Options:"
            echo "  -s, --size SIZE        Window size (default: 1500 1000)"
            echo "  -p, --position POS     Window position (default: center)"
            echo "  -h, --help             Show this help"
            echo ""
            echo "Environment variables:"
            echo "  FLOAT_SIZE            Default window size"
            echo "  FLOAT_POSITION        Default window position"
            echo ""
            echo "Examples:"
            echo "  float-window ghostty -e pulsemixer"
            echo "  float-window -s '800 600' kitty"
            echo "  float-window -p '100 100' alacritty -e htop"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Check if command is provided
if [ $# -eq 0 ]; then
    echo "Error: No command specified"
    echo "Use --help for usage information"
    exit 1
fi

# Build the command string
COMMAND="$*"

# Execute with hyprctl
hyprctl dispatch exec "[float; size $SIZE; $POSITION] $COMMAND"
