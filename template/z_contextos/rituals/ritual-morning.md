# Ritual — Morning

**Triggers:** "morning" / "let's get started" / "what's on my plate" / any morning greeting

**Non-negotiable rules (do these even under time pressure):**
- Ambient sources (calendar, email, chat logs) get pulled — not skipped because "nothing's probably new."
- A meeting note gets created for every calendar event today, no prompting needed.
- Notes.md items get routed per `ritual-inbox.md` logic, not just counted.
- Context/journal writes happen *before* the briefing is delivered, not after.

**Reads, in order:**
1. Yesterday's daily journal. If yesterday's `## End of Day` section is missing → run `ritual-eod.md` for yesterday first, retroactively, without asking.
2. If today is Monday and last week's Weekly Review is missing → run `ritual-eow.md` first.
3. Google Calendar (or equivalent) — today's events.
4. `Daily/Tasks.md` — active items.
5. Email — subject lines + senders only, last 24h.
6. Chat/Slack logs — date-filtered, last 1 work day.
7. Domain `_index.md` files — lazy-loaded, only domains with open tasks or recent signal.
8. Raw transcript/voice-note folders + Meeting Notes — scan for anything unprocessed.

**Does, in order:**
1. Move completed `Tasks.md` items to `## Completed`.
2. Create today's daily journal from template.
3. Auto-create a meeting note for every calendar event today (attendees, purpose, domain context pulled in, open questions) — no prompting needed.
4. Write the day's context/journal entries.
5. Deliver the briefing in chat — **last, not first.**
6. Append the Morning Briefing section to today's journal.

**Output template:**

```
## Yesterday's Sessions – What We Did
[recap]

## Rollover Items for Today
[numbered list]

---
## Daily Briefing – [Weekday Month DD]
**Calendar:** [meetings, linked to prep notes]
**Email signals:** [1-2 bullets if material]
**Chat signals:** [1-3 bullets if material]
**Tasks – [N] active items:** [overdue + due this week only]
**Suggested focus:** [2-3 items] ← you decide
**Domain pulse:** [1 line per active domain]
```

**Known failure mode this ritual guards against:** a multi-day gap where no session runs at all is a different failure than stale context, and needs its own check — compare the most recent daily journal's filename to today's date, and surface the gap explicitly if it's more than one weekday, even if nothing else looks stale.
