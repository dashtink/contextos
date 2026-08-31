# ContextOS — Setup Guide

This is the generic, shareable onboarding flow — what you'd hand to someone standing up their own instance. It walks through tools, vault structure, assistant configuration, first session, and customization.

## 00 — Start Here

**What ContextOS does:** without it, every session with your assistant starts blank — you re-explain your role, projects, stakeholders, and context every time. ContextOS maintains structured files in a plain-text vault that the assistant reads at the start of each session, so it knows who you are and what's changed without repeating yourself.

**What you get:** a morning briefing pulling from calendar/tasks/email/chat; automatic meeting prep for every calendar event; transcripts processed into context updates, action items, and meeting notes; cross-domain project tracking separate from ongoing subject-matter memory; a weekly rhythm that keeps context current; a running log of wins for review season.

**Before you start — required:** Obsidian (free) · Claude Desktop.

**Recommended connections:** calendar, email, document storage, a shared chat-log export if your team maintains one.

**Setup order:** 01 – Tools & Prerequisites → 02 – Understanding Your Vault → 03 – Setting Up Claude → 04 – Your First Session → (optional) 05 – Customizing.

**The setup trigger:** once your vault is open in Obsidian and Claude Desktop is configured, say: `setup contextos onboarding`. The assistant walks you through configuring domains, filling in context, and getting ready for your first morning briefing.

## 01 — Tools & Prerequisites

**Obsidian** — the note-taking app that houses the vault.
1. Download from obsidian.md.
2. Create a new vault — put it inside your Documents directory (e.g. `Documents/ContextOS/`); avoid iCloud Drive/Dropbox unless you understand how syncing interacts with Obsidian.
3. Note the full vault path.
4. Enable the **Templates** core plugin (Settings → Core plugins) — required for auto-creating daily journals and meeting notes; set the template folder to `z_workos/templates`.

**Claude Desktop**
1. Download and sign in.
2. Enable the Filesystem extension (Settings → Extensions → Filesystem → toggle on → select your vault folder → Save).
3. Create a Claude Project named "ContextOS" or "[Your name] + ContextOS" — project instructions go here in Step 3.

**Connected tools** (Settings → Integrations): calendar, email, document storage. If your team maintains a shared chat-log export, get the file reference — you'll add it to project instructions in Step 3.

**Nice to have:**
- Obsidian theme: Minimal or Things.
- Community plugins: Dataview (powers Base views for domain dashboards), Templater (better date handling).
- Obsidian Bases (built-in database view) — no setup needed, requires Obsidian 1.8+.

**Obsidian basics if you're new:** "Open folder as vault" to open; frontmatter is the `---` block with properties like `date:`, `tags:`, `updated:`; type `[[` to link notes; you mainly read, rarely edit — rituals create/update most files automatically.

## 02 — Understanding Your Vault

**Two layers:**
- **Your layer** (daily use): `Daily/` (captures, tasks, journal), `Domains/` (work areas, each with a dashboard), `Projects/` (cross-domain initiatives with a deadline, if used), `Links/`, `Scratch Pad/`.
- **The system layer** — `z_workos/` — infrastructure the assistant reads/writes: rituals, rules, context storage, templates. Think of it like the engine of a car — it's there, you can look at it, but you don't need to touch it to drive.

**Daily/**

| File | What it is | Who writes it |
|---|---|---|
| `Notes.md` | Quick capture buffer | You |
| `Tasks.md` | The single task tier (or soft follow-ups only, if you run a two-tier mode) | You + assistant |

**Domains/:** one folder per work area — `_index.md` (dashboard), `reference/` (stable background + links), `working-docs/` (drafts).

**z_workos/_data/:** the assistant's persistent memory. Daily Journal (one note/day — briefing, session summaries, EOD), Weekly Journals (weekly review, carry-forward), Meeting Notes, Domains/[domain]/ (`_context.md` + `_log.md`), People (recurring stakeholders).

**What you should edit — freely:** `Notes.md`, `Tasks.md`, `Domains/[domain]/_index.md`, `working-docs/`, `Projects/[project]/_index.md`.

**Occasionally (setup/customizing):** `_persona.md`, `_voice-guide.md`, the project-instructions file (then re-paste).

**Leave alone (the assistant manages):** Daily Journal, Weekly Journals, Meeting Notes, domain `_context.md`/`_log.md`.

**How the assistant reads your vault:** every session, it reads `_architecture.md` (vault map) then lazy-loads only the relevant domain `_context.md` files for the current task — never the whole vault at once.

**The context loop:** you share something (transcript, doc, thread) → the assistant notes it in the daily journal → the End-of-Week ritual distills the week's journals into domain `_log.md`/`_context.md` updates (the primary mechanism, not every session) → next session the assistant reads the updated context → already knows what happened. (A transcript being processed, or something directly contradicting existing context, updates immediately rather than waiting for the weekly pass.)

## 03 — Setting Up Claude

**Option A — worksheet (recommended):** fill out a setup worksheet (name/role/reporting structure, domains, tool connections, org context), paste the completed worksheet into Claude, say `setup contextos onboarding`. The assistant builds the project-instructions file, sets up domain folders and context files, and asks what to do first.

**Option B — fill the template directly:** open `z_workos/templates/workos-core-template.md`, replace every `[PLACEHOLDER]`. Key sections: Who You Are (assistant name), Vault path, Domains, Task Tracking mode (single-tier recommended default), chat-log sources. Then paste the full file into Claude Desktop → your project → Settings → Project Instructions.

**Choosing domains** — a good domain is a distinct area with its own stakeholders/projects/state, something you return to across sessions, bounded enough to fit one context file. Illustrative examples:

| Domain | Good for |
|---|---|
| `segment-gtm` | ICP work, messaging, acquisition for a segment |
| `product-launches` | Launch process tracking, launch assets, coordination |
| `competitive-intel` | Battlecards, win/loss, competitor tracking |
| `platform-strategy` | Long-horizon strategy, infrastructure, identity-level decisions |
| `pricing-packaging` | Pricing strategy, packaging decisions |
| `customer-insight` | Research program, surveys, NPS, customer signal |
| `product-area` | Product area ownership, roadmap, feature launches |
| `personal-ops` | Career, level goals, relationships, org dynamics — everyone should have this |

3–6 domains is the sweet spot; lowercase, hyphenated names (they become folder names).

**Task tracker (optional, Option B):** connect it via its MCP integration if one exists, or skip entirely and stay single-tier.

## 04 — Your First Session

**Before you start:** vault open in Obsidian; Claude Desktop open with the project selected; Filesystem extension enabled and pointed at the vault; project instructions pasted in.

**The setup trigger:** `setup contextos onboarding`. The assistant reads the vault + instructions, asks about role/domains (or reads your worksheet), creates domain folders, writes starter `_context.md`/`_index.md` files, fills in `personal-ops/_context.md`, confirms, asks "what would you like to do first?"

**Your first morning briefing** — say "morning": the assistant checks for a prior-day journal (none yet, that's fine), pulls calendar/tasks/email/chat, creates meeting prep stubs, delivers a structured chat briefing, appends it to the journal. Expect a thinner briefing on day 1 — no historical context yet; it fills in with use.

**After the briefing:** review calendar (prep notes already linked); set priority for the day if using a tracker — the assistant suggests, you decide, never auto-applied; start a work session by naming the domain.

**Ending your first session** — say "wrap this up": context updates written, session summary appended to the journal, soft follow-ups added to `Tasks.md`, wins prompt. Do this at the end of every work block — it's how context stays current.

**Daily rhythm:**

| Time | Say | What happens |
|---|---|---|
| Morning | "morning" | Briefing, meeting prep, task recommendations |
| End of work block | "wrap this up" | Context updated, journal entry, tasks reconciled |
| End of day | "end of day" | Ambient catchup, tomorrow's priorities, transcripts surfaced |
| End of week | "end of week — close it out" | Weekly review, archive, wins review |
| Start of week | "start of week — orient me" | Prior week recap, week ahead, priorities |

## 05 — Customizing

**Change how the assistant communicates** — edit `_persona.md`: assistant name, tone (direct vs. warm), what it doesn't do ("no bullet points unless asked", "never start with 'great question'"), when to push back vs. just execute.

**Update the voice guide** — edit `_voice-guide.md` (used whenever the assistant drafts in your name): how you naturally write, phrases you'd never say, channel-specific notes, examples of your own writing. More specific is better — "I write short sentences, lead with the point, never say 'circle back'" beats "I write professionally."

**Add a new domain:** create `Domains/[name]/` (`_index.md`, `reference/`, `working-docs/`) + `z_workos/_data/Domains/[name]/` (`_context.md`, `_log.md`) → add to the project instructions domain map → re-paste instructions. Or just tell the assistant — it handles the file creation and tells you what's left.

**Add a new project:** create `Projects/[name]/_index.md` from the template, add a row to `_projects-index.md`. No context/log split needed (finite, doesn't need current-state/history separation). On shipping: durable knowledge moves to the owning domain's context, status set to shipped, folder moves to `Projects/Complete/`.

**Modify a ritual** — edit `z_workos/rituals/ritual-[name].md` directly to change what it reads/does/produces. No re-paste needed unless it affects project instructions; if a trigger phrase changes, update the Intent Recognition table and re-paste.

**Update project instructions** — edit the core project-instructions file in Obsidian when a domain is added/renamed, the vault path changes, a ritual trigger changes, or role/reporting changes. Copy the full file back into Claude Desktop → Project → Settings → Project Instructions.
