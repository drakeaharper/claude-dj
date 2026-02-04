#!/bin/bash
# Pause system audio when Claude starts working

ENABLED_FILE="$HOME/.claude-dj-enabled"
STATE_FILE="/tmp/claude-dj-paused"

# Check if enabled
if [ ! -f "$ENABLED_FILE" ]; then
  exit 0
fi

# Check if we already paused (avoid double-pause)
if [ -f "$STATE_FILE" ]; then
  exit 0
fi

# Pause media playback
case "$(uname -s)" in
  Darwin)
    # macOS - simulate media pause key (F8)
    # This pauses YouTube, Spotify, Apple Music, etc.
    osascript -e 'tell application "System Events" to key code 100' 2>/dev/null
    ;;
  Linux)
    # Linux - use playerctl if available
    if command -v playerctl &>/dev/null; then
      playerctl pause 2>/dev/null
    fi
    ;;
esac

# Mark that we paused
touch "$STATE_FILE"
