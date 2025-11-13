#!/usr/bin/env bash

# Default window settings
SIZE="${FLOAT_SIZE:-800 500}"
POSITION="${FLOAT_POSITION:-center}"

# Parse options
while [[ "$1" =~ ^- && "$1" != "-e" ]]; do
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
            echo "Usage: float-confirm [OPTIONS] -e COMMAND [ARGS...]"
            echo ""
            echo "Shows a confirmation prompt in a floating window before running a command."
            echo ""
            echo "Options:"
            echo "  -s, --size SIZE        Window size (default: 800 200)"
            echo "  -p, --position POS     Window position (default: center)"
            echo "  -e                     Execute following command (required)"
            echo "  -h, --help             Show this help"
            echo ""
            echo "Environment variables:"
            echo "  FLOAT_SIZE            Default window size"
            echo "  FLOAT_POSITION        Default window position"
            echo ""
            echo "Examples:"
            echo "  float-confirm -e sudo systemctl start sshd"
            echo "  float-confirm -s '600 150' -e reboot"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Check for -e flag
if [[ "$1" != "-e" ]]; then
    echo "Error: Missing -e flag before command"
    echo "Use --help for usage information"
    exit 1
fi

shift  # Remove -e

# Check if command is provided
if [ $# -eq 0 ]; then
    echo "Error: No command specified after -e"
    echo "Use --help for usage information"
    exit 1
fi

# Build the command string
COMMAND="$*"

# Create a temporary script that will run in the floating window
TEMP_SCRIPT=$(mktemp)
cat > "$TEMP_SCRIPT" << SCRIPT_END
#!/usr/bin/env bash
read -r -p "Run '$COMMAND' ? [y/N] " response
if [[ "\$response" =~ ^[Yy]$ ]]; then
  read -r -p "Are you sure? [y/N] " confirm
  if [[ "\$confirm" =~ ^[Yy]$ ]]; then
    eval "$COMMAND"
  else
    echo "Cancelled."
  fi
else
  echo "Cancelled."
fi
SCRIPT_END

chmod +x "$TEMP_SCRIPT"

# Execute the confirmation script in a floating terminal window
hyprctl dispatch exec "[float; size $SIZE; $POSITION] ghostty -e bash -c '$TEMP_SCRIPT; rm $TEMP_SCRIPT'"
