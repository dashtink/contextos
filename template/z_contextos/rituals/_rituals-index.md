# Rituals Index — Intent Recognition

Full narrative reference: `docs/03-rituals.md` in the parent repo. This file is the routing table the assistant checks first — identical content lives in both by design, so either alone is a complete reference.

## Intent Recognition

| Intent | Signals | Ritual file |
|---|---|---|
| Morning briefing | "morning", "let's get started", "what's on my plate", any morning greeting | `ritual-morning.md` |
| End of day | "end of day", "let's finish the day", "let's wrap up for the day" | `ritual-eod.md` |
| Session wrap | "wrap this up", "end of session", "that's it for now" | `ritual-wrap.md` |
| Start of week | "start of week", "orient me for the week", Monday opener | `ritual-sow.md` |
| End of week | "end of week", "close it out", Friday ritual prompt | `ritual-eow.md` |
| Process transcript | "here's a transcript", paste/upload of meeting notes | `ritual-transcript.md` |
| Process notes | "process my notes", "process this", drop of unorganized notes | `ritual-inbox.md` |
| Meeting prep | "prep me for [meeting]" | `ritual-meeting-prep.md` |
| Meeting debrief | "quick debrief on [meeting]" | `ritual-debrief.md` |
| Weekly review | "give me a weekly review", "how was my week" | `ritual-weekly-review.md` |
| Context audit | "audit my context files", "what's out of date" | `ritual-context-audit.md` |
| Feedback to incorporate | `> FEEDBACK: [comment]` inline in a doc | write to the right file immediately, no ritual needed |

## Conditional Chains (no confirmation needed)

| Ritual | Condition | Auto-triggers |
|---|---|---|
| Morning | Yesterday's EOD section missing | → runs `ritual-eod.md` for yesterday first |
| Morning | Monday + last week's weekly review missing | → runs `ritual-eow.md` first |
| Morning | A scheduled-scan doc exists for today | → reads + processes automatically, no confirmation needed |
| Start of Week | Last week's weekly journal missing/incomplete | → runs `ritual-eow.md` first |
| End of Week / Weekly Review | Weekly journal file doesn't exist | → creates from template first |

## Rule

Always load the full ritual file before running it. Never execute from memory or from this index alone — the index tells you *which* file to load, not what it says.
