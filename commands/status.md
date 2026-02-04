---
description: Check if Claude DJ is enabled or disabled
---

Check Claude DJ status by running this command:

```bash
if [ -f "$HOME/.claude-dj-enabled" ]; then echo "Claude DJ: ON"; else echo "Claude DJ: OFF"; fi
```

Report the status to the user.
