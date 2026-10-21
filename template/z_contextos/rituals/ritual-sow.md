# Ritual — Start of Week

**Triggers:** "start of week" / "orient me for the week" / Monday opener

**Precondition:** if last week's weekly journal is missing or incomplete → run `ritual-eow.md` first. Start of Week refuses to orient for a new week on top of an unclosed one.

**Reads:**
- Last week's weekly journal.
- Calendar — full week ahead.
- Email + chat logs since last Friday's End of Day.
- Open and due-this-week tasks.

**Outputs:**
- This week's weekly journal, created from template.
- In chat: top 2-3 priorities for the week, meeting prep flags for anything already on the calendar, and priority recommendations split into Today (time-sensitive, highest priority) vs. Not Today (can wait) — suggested, never auto-applied.

## If a connector is down

Say so at the top of the output ("Calendar not reachable"), skip that source, and continue with what is available. Never silently produce a result that looks complete. Record the gap in the journal so the next run can catch up. If the vault itself is unreachable, produce the full output in chat so it can be pasted in later.
