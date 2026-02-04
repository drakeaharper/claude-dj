# Claude DJ

A Claude Code plugin that plays audio while Claude is working and stops when Claude is waiting for your input.

## Installation

### From GitHub

```bash
claude plugins add https://github.com/yourusername/claude-dj
```

### From Local Directory

```bash
claude plugins add /path/to/claude-dj
```

## How It Works

This plugin uses Claude Code's hooks system to:

1. **Start audio** when Claude begins working (`PreToolUse` hook)
2. **Stop audio** when Claude finishes and waits for input (`Stop` hook)

## Customizing the Sound

Edit `scripts/start-sound.sh` to change the audio file.

### macOS

Change the `afplay` line to point to any audio file:

```bash
afplay /path/to/your/sound.aiff
```

System sounds are located in `/System/Library/Sounds/`.

### Linux

Change the `paplay` or `aplay` line:

```bash
paplay /path/to/your/sound.oga
```

### Windows

Change the PowerShell command:

```bash
powershell.exe -c "(New-Object Media.SoundPlayer 'C:\path\to\sound.wav').PlaySync()"
```

## Uninstalling

```bash
claude plugins remove claude-dj
```

## Troubleshooting

### Sound doesn't stop

Run manually to clean up:

```bash
/path/to/claude-dj/scripts/stop-sound.sh
```

### No sound on Linux

Ensure you have PulseAudio (`paplay`) or ALSA (`aplay`) installed:

```bash
# Debian/Ubuntu
sudo apt install pulseaudio-utils

# Or for ALSA
sudo apt install alsa-utils
```

## License

MIT
