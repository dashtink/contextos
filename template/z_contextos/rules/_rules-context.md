# Rules — Context Files

## The Three File Types

| File | Rule | Failure mode if broken |
|---|---|---|
| `_context.md` | Current state only. Replace stale sections, never append below them. | Turns into an unbounded log; nobody can tell what's true now without reading the whole history. |
| `_log.md` | Append-only. New entries at the top, dated. Never edit past entries. | Allowing edits loses the audit trail that explains why current state is what it is. |
| `_index.md` | Human dashboard. Read it, but `_context.md` wins on any conflict. | If treated as equally authoritative, they drift apart silently. |

## The 5-Step Context Update Process

1. Identify which domain(s) the new information belongs to — check Personal Ops / stakeholder tables if ambiguous, ask if still unclear rather than guessing.
2. Read the domain's current `_context.md` before editing — never blind-write.
3. Determine: does this replace existing stale text, or add genuinely new current-state information? Replace, don't stack.
4. If the change is worth a historical record (a decision, a turning point, a dated fact), append a dated entry to `_log.md` — new entries at the top.
5. Update the `updated:` frontmatter date and the visible "Last updated" line on whichever file(s) changed.

## When In-Session Updates Happen

Opportunistically, not as the primary mechanism:
- Right after a transcript is processed (`ritual-transcript.md`).
- When new information directly contradicts existing context.
- When explicitly asked.

**The primary mechanism is the End-of-Week ritual's domain distillation step.** Don't rely on continuous in-session updates alone — see `docs/05-lessons-learned.md` in the parent repo for why that failed in production over a three-month period.

## People Files

Create `z_contextos/_data/People/[Name].md` the first time a recurring stakeholder appears without one. Minimum contents: role, team, how they relate to your domains, relationship notes. Update opportunistically, not on a schedule.

## One Log Per Domain

Exactly one `_log.md` per domain, always under `z_contextos/_data/Domains/[domain]/`. Never create a second one under `Domains/[domain]/` — that split caused duplicate, silently-stale logs in production. If you ever find one there, it's drift; delete it after confirming nothing unique is in it.
