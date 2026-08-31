# Rules — Token Efficiency

Core constraint: every file the assistant reads costs tokens. Load only what's needed.

1. **Read the minimum needed.** At session start, read `_architecture.md` to orient, then only domain files relevant to that session. Don't pre-load all domains unless it's a daily briefing or weekly review.
2. **Filter external sources by date before reading.** Chat logs and ticket exports can be large — always specify a date range: daily briefing = last 1 work day, weekly review = last 7 days, ad hoc = specify explicitly.
3. **Use head/tail/range reads for large files** rather than reading an entire file for recent entries or one section.
4. **Don't re-read files already in context** unless an edit was made and the updated version is needed.
5. **The change log is not required at session start** — only read when historical context is specifically needed.
6. **Ritual files must be loaded in full to run a ritual** — never run from memory or from the project-instructions summary alone. The summary exists for routing, not execution.
7. **Lazy-load domain indexes** — in daily briefings, only load domain `_index.md` files for domains with open tasks or recent signal from ambient sources.

## Why this is a structural rule, not a style preference

The biggest source of token bloat found in production wasn't inefficient reading — the lazy-load routing above already worked. It was `_context.md` files accumulating dated sections instead of getting pruned into `_log.md`, turning a file meant to be a single bounded read into an unbounded one. **Fix the accumulation problem structurally (see `_rules-context.md`) before trying to fix it by reading less** — no read-time optimization compensates for a context file that's silently become a log.
