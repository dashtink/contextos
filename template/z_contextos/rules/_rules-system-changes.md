# Rules — How the System Changes Itself

## The Rule

Document a new workflow behavior in the same session it's introduced — not as a follow-up task. A change-log entry written later, from memory, is how documentation drift starts.

## Change Type → Files to Update

| Change type | Files to update |
|---|---|
| New ritual or behavior change | `_rituals-index.md`, project-instructions file |
| New tool or integration added | `_architecture.md` (or a dedicated system-map doc) — component index |
| New ambient data source | The relevant rules file's ambient-sources section |
| Vault structure or file paths | `_architecture.md` (vault map + domain index) |
| Tag taxonomy change | `_architecture.md` / `_rules-tagging.md` |
| Persona or voice guide change | `_persona.md` or `_voice-guide.md` |

## Every Change, In Order

1. Make the change to the file(s) it actually lives in.
2. Update every other file the table above says is affected — in the same session, not "later."
3. Log it to `_change-log.md`: what changed, and *why*. The why is what lets a future rebuild avoid re-making a mistake already made once.
4. Update `_context-registry.md`'s last-updated column if a tracked file was touched.
5. If the change affects future-session behavior (persona, vault path, session protocol, key IDs, ritual list, or core rules), re-paste the project-instructions file into the assistant's project settings. **A change-log entry alone does not change live behavior** — the assistant only sees what's actually loaded into project instructions.

## Why This Is Strict

An architecture map that references files already renamed away, or a ritual index that's out of sync with what a ritual file actually does, is worse than no documentation — it actively misleads a fresh session that has no other way to know the system's real current state. Documentation drift is a standing tax, not a one-time bug; the discipline above is the only thing that keeps it from compounding.
