#!/bin/bash
# Stop the playing sound

PID_FILE="/tmp/claude-dj.pid"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")

  # Kill the process and all its children
  if [ -n "$PID" ]; then
    # Kill the main process
    kill "$PID" 2>/dev/null

    # Also kill any child processes (the actual audio players)
    pkill -P "$PID" 2>/dev/null
  fi

  rm -f "$PID_FILE"
fi

# Belt and suspenders: kill any lingering audio processes started by us
case "$(uname -s)" in
  Darwin)
    # Kill afplay processes playing our specific sound
    pkill -f "afplay.*Submarine.aiff" 2>/dev/null
    ;;
  Linux)
    pkill -f "paplay.*bell.oga" 2>/dev/null
    pkill -f "aplay.*Front_Center.wav" 2>/dev/null
    ;;
esac

exit 0
