---
description: Suggest a one-line commit message for staged changes
model: anthropic/claude-haiku-4-5
---

Look at the currently staged changes:

!`git diff --cached --stat`

!`git diff --cached`

Recent commit messages for style reference:

!`git log --oneline -10`

Suggest a single-line, concise commit message for the staged changes, matching the style of the recent commits. Output only the commit message itself, nothing else. Do not commit.
