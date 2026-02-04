#!/bin/bash
# Resume system audio when Claude stops working

STATE_FILE="/tmp/claude-dj-paused"

# Only resume if we previously paused
if [ ! -f "$STATE_FILE" ]; then
  exit 0
fi

# Resume media playback
case "$(uname -s)" in
  Darwin)
    # macOS - simulate media play key (F8)
    osascript -e 'tell application "System Events" to key code 100' 2>/dev/null
    ;;
  Linux)
    # Linux - use playerctl if available
    if command -v playerctl &>/dev/null; then
      playerctl play 2>/dev/null
    fi
    ;;
esac

# Remove the state marker
rm -f "$STATE_FILE"
