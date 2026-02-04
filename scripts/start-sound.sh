#!/bin/bash
# Start playing sound if not already playing
# Uses a PID file to track the background process

ENABLED_FILE="$HOME/.claude-dj-enabled"
PID_FILE="/tmp/claude-dj.pid"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if enabled
if [ ! -f "$ENABLED_FILE" ]; then
  exit 0
fi

# Check if already playing
if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if kill -0 "$PID" 2>/dev/null; then
    # Already playing, exit
    exit 0
  fi
  # Stale PID file, remove it
  rm -f "$PID_FILE"
fi

# Start the sound loop in background
(
  while true; do
    case "$(uname -s)" in
      Darwin)
        # macOS - use afplay with a system sound
        # You can customize this path to any audio file
        afplay /System/Library/Sounds/Submarine.aiff 2>/dev/null
        ;;
      Linux)
        # Linux - use paplay (PulseAudio) or aplay (ALSA)
        if command -v paplay &>/dev/null; then
          paplay /usr/share/sounds/freedesktop/stereo/bell.oga 2>/dev/null
        elif command -v aplay &>/dev/null; then
          aplay /usr/share/sounds/alsa/Front_Center.wav 2>/dev/null
        fi
        ;;
      MINGW*|CYGWIN*|MSYS*)
        # Windows (Git Bash / WSL)
        powershell.exe -c "(New-Object Media.SoundPlayer 'C:\Windows\Media\chimes.wav').PlaySync()" 2>/dev/null
        ;;
    esac
    # Small delay between loops
    sleep 0.1
  done
) &

# Save the PID
echo $! > "$PID_FILE"
