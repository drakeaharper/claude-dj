---
name: off
description: Disable Claude DJ (stop playing sound)
user_invocable: true
---

Disable Claude DJ by running this command:

```bash
rm -f "$HOME/.claude-dj-enabled" && pkill -f "claude-dj" 2>/dev/null; echo "Claude DJ: OFF"
```

After running the command, confirm to the user that Claude DJ is now disabled.
