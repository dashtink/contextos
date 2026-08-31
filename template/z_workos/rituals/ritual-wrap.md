# Ritual — Session Wrap

**Triggers:** "wrap this up" / "end of session" / "that's it for now"

**Goal:** close out a single working session — distinct from a whole day. Someone might wrap five sessions in a day, or run one session spanning two days.

**Step 0 — read before writing.** Read the `_context.md` for every domain this session touched before writing anything to it.

**Does, in order:**
1. Identify which domain(s) this session touched — before writing anything.
2. Write pending `_context.md` updates for those domains (replace stale text, don't stack — see `_rules-context.md`).
3. Append a journal session entry summarizing what happened.
4. Update the `updated:` frontmatter + visible "Last updated" line on every touched file.
5. Log to `_change-log.md` if any system/structural changes were made this session.
6. Reconcile `Daily/Tasks.md` — move anything completed, add anything new that surfaced.
7. Wins prompt: "anything worth logging as a win this session?"
8. Summarize in chat: what was produced/decided, what's still open, which files need attention, and a re-paste flag if the project-instructions file changed.

**Built-in failure mode:** if a vault write fails mid-wrap, produce the entire pending summary in chat, formatted so it can be pasted back into the vault manually — never let a failed write silently lose work that hasn't saved yet.
