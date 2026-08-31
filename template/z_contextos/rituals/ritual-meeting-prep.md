# Ritual — Meeting Prep

**Called by:** `ritual-morning.md`, once per calendar event. **Standalone trigger:** "prep me for [meeting]"

**Reads:** the relevant domain's `_context.md`, prior meeting notes with the same attendees/topic, domain `reference/` material if relevant.

**Does:** identifies the domain from the meeting title + attendees, cross-referencing the Personal Ops stakeholder table when it's unclear. Writes **Background**, **Questions**, and **Watch For** sections into the meeting note — using the shared Meeting Note template, not a custom structure invented per-meeting.

**Why the shared template matters:** an earlier version let this ritual and the general meeting-note creation logic each define their own structure, and they drifted apart. One template, always, avoids that.
