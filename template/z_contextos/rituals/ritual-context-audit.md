# Ritual — Context Audit

**Triggers:** "audit my context files" / "what's out of date"

**Goal:** surface stale context files before they cause incorrect outputs.

**Reads:** `_context-registry.md` for staleness thresholds; frontmatter dates on every domain `_context.md`/`_index.md` and `Projects/*/_index.md`; Meeting Notes for unprocessed transcripts over a week old; `_architecture.md`'s vault map against the actual folder structure.

| File type | Flag after |
|---|---|
| Active domain `_context.md` | 2 weeks without update |
| Domain `_index.md` | 2 weeks without update |
| Project `_index.md` (active/at-risk) | 1 week without update |
| Meeting notes (unprocessed) | 1 week |
| `_context-registry.md` itself | 1 week |
| `_architecture.md` | flag if out of sync with actual structure |

**This ritual is explicitly NOT the primary context-maintenance mechanism.** It's for ad-hoc deep checks — path errors, architecture drift, unprocessed-transcript backlogs — not routine freshness. Freshness is the End-of-Week ritual's job. **If files are turning up stale often here, the fix is checking whether `ritual-eow.md` actually ran last week — not running this audit more often.**

An earlier version of this ritual framed context as something that "should update continuously during sessions," with this audit as a light catch-up. That framing was rewritten after two domains went roughly three months with zero log entries across ~50 sessions while the daily journal ran at near-100% in the same window — direct evidence that continuous in-session updating isn't a reliable mechanism on its own, because it produces no artifact whose absence is visible. See `docs/05-lessons-learned.md` in the parent repo.
