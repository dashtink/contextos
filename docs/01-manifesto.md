# ContextOS — Manifesto & Philosophy

## 0 — ContextOS on one page

**The thesis:** the bottleneck in working with AI was never the model. It's context.

### What it is
A folder of plain-text notes (an Obsidian vault) plus a small set of rules and behavior specs. Claude reads it at the start of work and updates it as you go. It holds what's true now about your work (people, projects, decisions, deadlines), the history of how it changed, and how the assistant should behave. It is a context layer that runs inside tools you already use (Claude Desktop or Claude Code). It is not a harness, a plugin or an API; the harness is the app that runs the model, and ContextOS is the memory and instructions it reads.

### What it does
- Every session starts oriented. You stop re-explaining who reports to whom, what was decided, what's still open.
- A morning briefing from calendar, tasks, email, chat and prior sessions, and prep for each meeting.
- Transcripts turn into meeting notes, context updates and tasks in one pass.
- Nothing tracked slips silently: overdue items, stale context and skipped rituals get surfaced.
- A dated record of decisions and reasoning, and wins captured for review season.
- Claude reads and writes local files, so it drafts docs in Obsidian and you edit them in place, which is hard to do in a Google Doc.

### How you use it
Five phrases, said in chat: **"morning"** to start the day, **"wrap this up"** to end a work block, **"end of day"**, and **"end of week"** / **"start of week"**. Setup is agent-led: point Claude at this repo and it follows [`SETUP.md`](../SETUP.md). Plan on about two hours up front, then a few minutes a day.

### How it works: the building blocks
| Block | What it is |
|---|---|
| **Vault** | Plain markdown that holds state. The chat is where reasoning happens. |
| **Two layers** | Your layer (`Daily/`, `Domains/`, `Projects/`, `Links/`, `Scratch Pad/`) and the system layer (`z_contextos/`: rituals, rules, templates, persona, memory). |
| **Domains** | Durable subject areas with no end date. Each has a human dashboard and a machine-facing context + log. |
| **Projects** | Deliverables with a deadline, usually spanning domains. They move to `Projects/Complete/` when shipped. |
| **Memory files** | `_context.md` (current state), `_log.md` (append-only history), `_index.md` (human dashboard). |
| **People and meetings** | One note per recurring person and per meeting, surfaced as Bases (views). |
| **Rituals** | Numbered behavior specs, loaded fresh from disk each run: Morning, End of Day, Session Wrap, Start/End of Week, Weekly Review, Process Transcript, Process Notes, Meeting Prep, Meeting Debrief, Context Audit, Setup Check. |
| **Rules** | One file per concern (context files, tagging, tokens, documents, sensitive material, system changes). Rules are contracts for handling files; the principles below are the *why*. |
| **Persona and voice guide** | The persona is a behavioral contract for the assistant. The voice guide is for ghostwriting as you. |
| **Router** | The one short file pasted into Claude's project instructions. It points the assistant at the core file in the vault, so behavior changes never need re-pasting. |
| **Ambient sources** | Read-only inputs (calendar, email, chat, tasks, drive, prior sessions), always date-filtered. |
| **Closed vocabularies** | Tags, project status and task tiers use fixed lists. New tags need propose-then-approve. |
| **Change log and registry** | The system documents its own changes. |

### Operating principles
1. **Vault as memory, chat as compute.** If it matters, write it down.
2. **Distill, don't accumulate.** Context holds current state; history goes to the log.
3. **Every file read costs tokens.** Load only what the task needs: lazy-load by domain, date-filter sources, use ranges for big files.
4. **Invisible steps get silently skipped.** Anything load-bearing must produce a visible artifact. "Nothing changed" is a valid output; silence is the failure state.
5. **Ritual fidelity over speed.** Load the spec in full every time. Never run from memory.
6. **Domains are not projects.** Promote to a project only if it hits two of: spans domains, hard deadline, more than one deliverable.
7. **Closed vocabularies over free-form tags.** Open tagging drifts within weeks.
8. **One task tier.** A two-tier model collapsed because the second tier stopped being opened.
9. **Wins are opt-in.** The system surfaces candidates; you decide.
10. **Don't guess attribution.** Wrong speaker labels are worse than none.
11. **Reads before writes, writes one at a time.** Filesystem access can drop mid-session; if a write fails, dump the summary in chat.
12. **The system documents itself.** Behavior changes get logged the same session.
13. **Every fix needs its own audit.** A monitor only catches the failure it was built for.
14. **Overhead must stay smaller than the overhead it replaces.**
15. **Inference gets marked.** Anything the assistant infers is tagged `[confirm]` with its source until you verify it.

**Costs:** upfront build, ongoing ritual discipline, periodic pruning. It decays without these.

### Where this sits next to built-in memory
Claude has its own memory, can search past chats, and supports Projects with uploaded files. Those help, but they are hard to inspect, structure or keep current in near real time, and they don't enforce a shape. ContextOS is the explicit, editable version: you can read it, fix it, version it, and the assistant is told exactly which parts to load for which task. The practice of deciding what goes into a model's context and loading it on demand rather than all at once is sometimes called *context engineering*; loading only what a task needs is *progressive disclosure*. ContextOS applies both to a personal knowledge base.

### Personal first, team-capable
It was built and run by one person: one vault, one assistant, solo and internal-only, with no access boundaries inside the vault. A team handoff would first need personal build notes separated out. In principle it can support a team, for example Obsidian for personal context and a GitHub repo for shared team context, but that layout isn't designed here yet.

## 1 — The Problem

- **LLMs don't carry reliable, inspectable context between sessions.** Built-in memory and past-chat search exist, but they're opaque, hard to keep near-real-time, and unstructured, so anyone using an LLM for ongoing work still pays a re-explaining tax.
- **The obvious fixes don't fix it.** Agents, skills, and scheduled automation give you *automation*, not *context*. You can automate a broken process exactly as easily as a good one — if what's being run doesn't actually know the reporting structure, automating it just means getting wrong answers faster and on a schedule. Re-pasting docs every session isn't a system either — that's just the tax, paid more efficiently.
- **The personal overhead is real and mostly invisible.** A meaningful chunk of any week isn't strategic thinking — it's re-establishing context: what did we decide, who owns this now, where did I leave this thread. None of that shows up on a task list. All of it eats the day.
- **The meta-problem: knowledge work quietly became context-assembly.** Original thinking is a small fraction of the job now. The rest is remembering, connecting, and re-explaining — across multiple domains, a half-dozen stakeholders, and whatever changed since the last look. Nothing built for knowledge work — not the AI tools, not the calendar, not the task tracker — is built to carry that load. So this system exists to carry it.

## 2 — The Philosophy

**The workbench metaphor.** The vault is a workbench that's always set up — tools and materials in known places, nothing needs to be found before it can be used. Claude is a coworker at that bench who already knows what's on it. This isn't "remember what I said last time" (a parlor trick) — it's a living, interactive workspace: Claude reads from it and writes back to it, so the system compounds instead of resetting.

### Design principles that emerged as non-negotiable

- **Distill, don't accumulate.** Context files hold current state only; history lives in log files. Dated sections stacking up inside `_context.md` instead of getting pruned into `_log.md` turned out to be the actual source of token bloat — not the lazy-load routing, which already worked fine. (Full story: [`docs/05-lessons-learned.md`](05-lessons-learned.md).)
- **Domains ≠ Projects.** Domains are permanent, durable areas of ownership. Projects are time-bound, cross-domain deliverables. Conflating the two is the most common structural error — a cross-cutting initiative with no project home will bloat whichever domain file it happens to land in. Promotion into a full Project is deliberately not automatic — a thing has to hit at least two of: spans more than one domain, has a hard deadline, produces more than one deliverable.
- **The system-building workspace stays where it is.** A separate vault for internal build notes was considered and rejected — a split only earns its cost if there's a real access, audience, or lifecycle reason. It's solo, internal-only, already isolated by folder convention. Splitting it would add a second filesystem root and a second place for staleness to hide. Revisit only if the vault needs to be handed to someone else without exposing personal build notes.
- **No splitting into multiple project instances by domain.** Seriously considered, rejected — it would shrink each domain's context but destroy cross-domain visibility, which is the entire point of the system (e.g. connecting a competitive signal to a messaging decision to a product launch).
- **Recognition/wins are opt-in, never automatic.** The system surfaces candidates; the human decides what counts. This came directly out of a real gap — automated scan logic hunts for action items, not recognition signals, so a praise email tripped nothing.
- **Ritual fidelity over speed.** Skipping a step to save time in the moment is not acceptable — the system's entire value depends on being reliable. A shortcut today is a hole in context three weeks from now.
- **A two-tier task model was tried and collapsed to one.** Forcing every stray reminder into a tracker produces a task list nobody trusts; running two tiers meant the second quietly stopped being referenced. Lesson: a task system nobody opens isn't a lightweight backup, it's dead weight.

### The persona layer

A dedicated persona file defines who runs the system day to day — an embedded chief-of-staff persona: direct, efficient, dry without being passive-aggressive, explicitly forbidden from cheerleading, willing to flag a problem before being asked. A separate voice-guide file does the reverse — not how the assistant sounds as itself, but how to disappear entirely and write *as you* when ghostwriting: direct without being blunt, low filler, no fake certainty, edited down rather than up.

### The shared operating layer

A role-specific "ops" file isn't a domain — it's shared operating infrastructure every domain draws from: process-stage definitions, an asset/deliverable tiering framework, and the standing list of recurring meetings or working groups. Domains hold what's *true*; this holds how the machinery of the work actually operates, independent of domain.

## 3 — Domains, In Practice (Illustrative)

The specific domains in this template are placeholders — a real instance replaces them with the actual areas of ownership for the role running it. Nothing below describes any real employer, product, or business situation; it's included only to show the *shape* a domain takes once it's been in use for a while:

- **A market/growth domain** — segmented workstreams (positioning, competitive intel, enablement) because they have different owners, timelines, and audiences. The kind of finding that belongs here: a metric moving for a different reason than the one everyone assumed, once someone actually traced it back through the log instead of re-guessing at it each quarter.
- **A product domain** — a running assessment of where a product stands against the market, tracked over time rather than re-derived from scratch each quarter. The kind of finding that belongs here: a slow-building pattern that's invisible in any single data point but obvious once it's logged consistently across several.
- **A process/execution domain** — where "the map doesn't match the territory" shows up in actual delivery: a workflow skipping a step its own template marks as required, or a process tracker that's been silently abandoned for an ad-hoc alternative nobody documented.
- **A strategy domain** — the kind of thinking that spans weeks of scattered signal (an idea moving from informal proposal, to team discussion, to a locked decision, to visible external demand) that would be impossible to hold in working memory without somewhere for each fact to land as it happens.
- **A competitive-intelligence domain** — originally nested inside another domain, moved out into its own because it kept needing to talk to two or three others too. A lived example of the domains-not-projects principle mattering: the domain earned its own existence before anyone declared it should have one.
- **A personal-operations domain** — org chart, career trajectory, which relationships are worth investing in vs. maintaining. Not subject-matter expertise — the one domain most likely to get silently dropped in a system built to chase deliverables, which is exactly why it should be first-class, not an afterthought.

## 4 — The Rituals, In Full

Twelve ritual files, each loaded fresh in full every time it runs — never from memory, since the assistant has no training-data knowledge of what a specific ritual means in this system without reading the spec. Full specs: [`docs/03-rituals.md`](03-rituals.md).

- **Morning** is the most heavily instrumented. Opens with non-negotiable rules (ambient sources pulled, meeting notes created, inbox items routed not just counted, context written before the briefing goes out) precisely because these are the steps most tempting to skip under time pressure.
- **End of Day** and **Session Wrap** solve the same problem (closing something out) at two scopes — a day vs. a single working session. Both require zero summary from the human.
- **Start/End of Week** are the weekly bookends and refuse to run out of order. **Weekly Review** is its own ritual, not a section bolted onto End of Week — one is operational, the other is synthesis. Collapsing them would put housekeeping and actual thinking in competition for the same five minutes, and housekeeping always wins.
- **Process Transcript** and **Process Notes** both move raw capture into somewhere durable, and both refuse to guess speaker attribution from auto-transcription labels unless unambiguous — wrong attribution is worse than none.
- **Meeting Prep** and **Meeting Debrief** are before/after the same event. Debrief has a deliberately low input bar — one question, since a full summary is rarely available.
- **Context Audit** is explicitly honest about its own limits — its own spec says it's a periodic catch-up, not the primary mechanism for keeping context current, and that if files are frequently stale, the real problem is that in-session updates aren't happening.

## 5 — Goals, Pains, Benefits

**Goals:** Never re-explain the same context twice. Every session starts oriented, not from zero. Nothing tracked slips silently. Cross-domain connections get made because nothing is siloed. The system's overhead stays smaller than the overhead it replaces — the day that stops being true is the day it's not worth running.

**Pains it solves:**
- *Before:* the start of a week spent reconstructing what was overdue and who owns what. → *After:* the weekly ritual rebuilds it automatically from ambient sources.
- *Before:* recognition signals vanish, no record survives to review season. → *After:* wins surface as candidates at every close-out ritual, every time.
- *Before:* a long recording sits unprocessed for weeks. → *After:* the transcript ritual routes it into meeting notes, context, and tasks in one pass.
- *Before:* cross-cutting work bloats a single domain's context file until unreadable. → *After:* it gets its own Project home.
- *Before:* a signal relevant to two domains gets logged once, wherever someone happened to be thinking that day. → *After:* deliberately logged in both.

**Benefits, as outcomes:** Time recovered from re-orientation, redirected to actual strategic work. A timestamped, defensible record of decisions and reasoning. Confidence that gets *better* with use instead of degrading — the opposite of most personal productivity setups.

## 6 — Evolution: Why It Changes

Every major revision came from a real failure observed in use, never from theorizing in advance. In rough order: a foundational vault restructure; a first system review pass; a mid-cycle refactor formalizing the two-tier task model and a written context-update process; a full-file audit that surfaced domain context degrading into unpruned logs (confirmed as the actual bloat source), a cross-cutting workstream with no home, and no standing automation independent of manual triggering.

The turning-point moment: the stated priority behind that audit, verbatim, was *"the biggest help I need is staying on top of all the context so I don't miss anything."* That sentence reordered the plan — capture completeness now outranks structural elegance.

The pattern across every version: this is a product with a backlog, not a finished artifact.

## 7 — What It Costs

- **Upfront:** the vault structure, rules layer, and rituals all have to be built — and are still being revised, always.
- **Ongoing:** ritual fidelity is non-negotiable — discipline, not just setup. Context files need periodic pruning or they silently degrade back into logs.
- **Tooling tax:** filesystem-access tooling can be unreliable mid-session; working rule: finish all reads before starting writes, write files one at a time (a mid-batch failure silently loses whatever wasn't written).
- **The honest tradeoff:** this only pays off because the alternative — rebuilding context from memory and inbox archaeology every week — costs more. But "costs more" doesn't mean "costs nothing." It costs real discipline, every time, or it decays like everything else does.
