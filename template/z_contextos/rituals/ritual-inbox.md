# Ritual — Process Notes

**Triggers:** "process my notes" / "process this" / drop of unorganized notes

**Reads:** `Daily/Notes.md` → `## To Process`, plus email/chat signal new since the last briefing (fallback: last 24h if no briefing timestamp is found).

**Routing logic:**

| Item type | Route to |
|---|---|
| Actionable follow-up (soft) | `Tasks.md` → Active |
| Real deliverable with a due date | `Tasks.md` → Running Tasks, date bolded |
| Context / knowledge update | Relevant domain `_context.md`, via the 5-step context update process in `_rules-context.md` |
| Link to save | `Links/`, tagged `type/link` + `domain/[x]` |
| Working doc / draft / plan | `Scratch Pad/` or `Domains/[domain]/working-docs/`, tagged `type/scratch` + `domain/[x]` |
| New stakeholder mentioned | `z_contextos/_data/People/[Name].md` |
| FYI only / no action | Archive in Notes (mark processed) |

**Escape hatch:** if an item is too vague to route confidently, ask one clarifying question rather than guess. A wrong guess costs more to unwind than one short question.

## If a connector is down

Say so at the top of the output ("Calendar not reachable"), skip that source, and continue with what is available. Never silently produce a result that looks complete. Record the gap in the journal so the next run can catch up. If the vault itself is unreachable, produce the full output in chat so it can be pasted in later.
