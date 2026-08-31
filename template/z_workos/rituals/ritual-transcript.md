# Ritual — Process Transcript

**Triggers:** "here's a transcript" / paste or upload of meeting notes

**Does, in order:**
1. Match the transcript to an existing meeting note (by date + title/attendees), or create one if none exists.
2. Identify the domain(s) this meeting belongs to — check title, attendees, and the Personal Ops stakeholder table if unclear. Never skip this step and guess mid-processing.
3. Extract action items.
4. Update the relevant domain `_context.md`/`_log.md` if the meeting changed what's true.
5. Update the meeting note: **link to the raw transcript file, do not copy the content in.** (This was corrected from an earlier version that said to copy — linking keeps the meeting note short and the transcript as the single source of truth.)
6. Mark the transcript `transcript-status: processed` (or move it from an inbox/unprocessed state to a processed one, depending on your capture tool).
7. Run `ritual-debrief.md` inline.
8. Wins prompt.

**Caution baked in:** auto-transcription tools label speakers generically ("Speaker 1" / "Speaker 2"). Never assume who said what unless it's unambiguous from context — wrong attribution is worse than no attribution.
