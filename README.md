# Claude DJ

A Claude Code plugin that pauses your music/videos while Claude is working and resumes playback when Claude is done.

Works with YouTube, Spotify, Apple Music, and other media players.

## Installation

### From Marketplace

1. In Claude Code, run `/plugin`
2. Go to **Marketplaces** tab → Add `drakeaharper/claude-dj`
3. Go to **Discover** tab → Install `claude-dj`

### With --plugin-dir (Development)

```bash
claude --plugin-dir /path/to/claude-dj
```

## How It Works

This plugin uses Claude Code's hooks system to:

1. **Pause media** when Claude begins working (`PreToolUse` hook)
2. **Resume media** when Claude finishes and waits for input (`Stop` hook)

On macOS, it simulates the media play/pause key (F8). On Linux, it uses `playerctl`.

## Enable / Disable

The plugin is **off by default**. Use slash commands inside Claude Code to control it:

```
/claude-dj:on      # Enable (will pause media while Claude works)
/claude-dj:off     # Disable
/claude-dj:status  # Check current status
```

### Alternative: Shell Commands

```bash
~/.claude/plugins/claude-dj/scripts/toggle.sh on
~/.claude/plugins/claude-dj/scripts/toggle.sh off
~/.claude/plugins/claude-dj/scripts/toggle.sh status
```

## Requirements

### macOS

Requires accessibility permissions for Terminal/iTerm to control media keys:
- System Preferences → Security & Privacy → Privacy → Accessibility
- Add your terminal app

### Linux

Install `playerctl`:

```bash
# Debian/Ubuntu
sudo apt install playerctl

# Fedora
sudo dnf install playerctl

# Arch
sudo pacman -S playerctl
```

## Troubleshooting

### Media doesn't pause

On macOS, ensure your terminal has accessibility permissions.

### Media doesn't resume

Run manually to clean up state:

```bash
rm -f /tmp/claude-dj-paused
```

## License

MIT
