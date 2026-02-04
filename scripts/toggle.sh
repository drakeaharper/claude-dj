#!/bin/bash
# Toggle claude-dj on/off

ENABLED_FILE="$HOME/.claude-dj-enabled"

if [ "$1" = "on" ]; then
  touch "$ENABLED_FILE"
  echo "Claude DJ: ON"
elif [ "$1" = "off" ]; then
  rm -f "$ENABLED_FILE"
  # Also stop any currently playing sound
  "$(dirname "$0")/stop-sound.sh"
  echo "Claude DJ: OFF"
elif [ "$1" = "status" ]; then
  if [ -f "$ENABLED_FILE" ]; then
    echo "Claude DJ: ON"
  else
    echo "Claude DJ: OFF"
  fi
else
  # Toggle
  if [ -f "$ENABLED_FILE" ]; then
    rm -f "$ENABLED_FILE"
    "$(dirname "$0")/stop-sound.sh"
    echo "Claude DJ: OFF"
  else
    touch "$ENABLED_FILE"
    echo "Claude DJ: ON"
  fi
fi
