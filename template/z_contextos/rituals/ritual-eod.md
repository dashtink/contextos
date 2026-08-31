# Ritual — End of Day

**Triggers:** "end of day" / "let's finish the day" / "let's wrap up for the day"

**Goal:** close out the day using ambient sources — zero summary required from the human.

**Step 0 — gather today's signal (no summary needed):** today's journal `## Session` entries, recent-chats tool (scan for decisions/info/actions not yet captured), email + chat logs since the morning briefing.

**Session completeness check:** count `## Session` entries in today's journal; if chat history suggests more sessions happened than got logged, flag it explicitly rather than silently assuming the log is complete.

**Does, in order:**
1. Capture today's signal in the daily journal (not domain context directly — the weekly End-of-Week distillation is what normally turns journal entries into domain context). Write directly to `_context.md`/`_log.md` today only if: a transcript was processed, something directly contradicts existing context, or it's explicitly requested.
2. Process any remaining `Notes.md` items (route per `ritual-inbox.md` logic).
3. Scan for unprocessed transcripts (raw transcript/voice-note folders, meeting notes marked `transcript-status: unprocessed`) → add to `Tasks.md` if found.
4. Review `Tasks.md` — mark anything completed.
5. Surface tomorrow's 2-3 most critical priorities.
6. Flag any sessions today that ran without a Session Wrap.
7. Wins prompt → append to `personal-ops/wins.md` if anything qualifies: `[date] · [category] · [what happened] · [why it matters]`.
8. Append a `## End of Day` section to today's journal: context updated (or not, and why), tomorrow's priorities, open threads, transcripts pending, sessions without a wrap, wins logged.
