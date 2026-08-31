# Ritual — End of Week

**Triggers:** "end of week" / "close it out" / a recurring Friday calendar block

**Goal:** operational weekly close — and **the primary mechanism for keeping domain context current.** See `docs/02-architecture.md#context-maintenance` in the parent repo for why this ritual, specifically, carries that load.

**Steps, in order:**

1. **Staleness check.** Read `updated:` frontmatter on all domain `_context.md` files and all `Projects/*/_index.md` files. Compare against thresholds in `_context-registry.md`. Surface anything past threshold — don't fix it yet, Step 3 fixes it.
2. **Gather the week's raw material.** All of this week's daily journals, all meeting notes dated this week, everything that moved to Completed or became overdue in `Tasks.md`.
3. **Domain distillation — REQUIRED, this is the ritual's core output.** For each active domain: did anything this week change what's true?
   - Yes → append a dated `_log.md` entry, replace stale `_context.md` text (don't stack on top of it).
   - No → write nothing to the files, but say so explicitly: "example-domain — no change this week."
   Do the same for active projects (`_index.md` + roll-up in `_projects-index.md`).
   **Report at the end, always, in chat:**
   ```
   Context written this week:
   - [domain] – [what changed] → _log.md, _context.md
   - [domain] – no change
   Projects updated:
   - [project] – [what moved]
   ```
   If this block is empty for every domain two weeks running, that's a signal to raise explicitly — not a clean week.
4. Update domain `_index.md` files wherever Step 3 changed the picture.
5. Load and run `ritual-weekly-review.md`.
6. Surface a weekly summary in chat: what moved, what stalled, key decisions, cross-domain signals, what to carry forward.
7. Wins review — read `wins.md`, surface what's logged plus unconfirmed candidates, prompt for anything else.
8. Archive `Notes.md` — move `## To Process` into `## Archive → Week of [date]`.
9. Archive `Tasks.md` — move completed items into `## Completed → Week of [date]`.
10. Write the weekly journal (`Weekly Journals/Week of YYYY-MM-DD.md`, from template if needed) — include the Step 3 report verbatim, so there's a permanent record of which weeks actually got a real distillation.
11. Log any system/structural changes made this week to `_change-log.md`.
12. Confirm next Monday's "week start" calendar block exists; flag if missing.

**Rule this ritual exists to enforce:** a deliberate "no change" is a valid, healthy output. A silent absence of any output — this ritual not running at all for a week — is the actual failure state, and nothing else in the system catches it as reliably as this step running on schedule.
