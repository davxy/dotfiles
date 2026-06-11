---
description: Find AI: tags in sources and process their requests
---

Below are all the "AI:" tags found in the project sources. Each tag marks a request embedded in the code at that location:

!`grep -rIn "AI:" . --exclude-dir={.git,node_modules,target,dist,build,vendor,.opencode} 2>/dev/null || echo "(no AI: tags found)"`

If no tags were found, say so and stop.

Otherwise, consider all the tags together (requests may be related and should be handled coherently, not in isolation). For each tag:

1. Read the file around the tagged line to understand the context.
2. Carry out the request that follows the "AI:" marker.
3. Remove the tag comment once the request is fulfilled.
