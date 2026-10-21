# ContextOS — Setup Guide

The fast path: **point Claude at this repo and say "set up ContextOS."** Claude reads [`CLAUDE.md`](../CLAUDE.md) and [`SETUP.md`](../SETUP.md), asks a few questions, builds your vault, and checks it. This guide is the human-readable version of what it does, so you know what to expect and can do any step by hand.

**Time:** about 2 hours for phases 1 to 6, mostly answering questions. **You need:** Obsidian (free) and Claude Desktop with the Filesystem extension, or Claude Code. Calendar, email and drive connections are recommended, not required.

## How to start

- **Claude Code:** open this repo (or a folder containing it) and say *"Set up ContextOS for me."*
- **Claude Desktop:** give the Filesystem extension access to a folder that contains this repo and your target vault location, then say *"Read SETUP.md in the contextos repo and set up my vault."*
- **No repo access:** Claude can fetch files one at a time; `template/MANIFEST.txt` lists every file so nothing gets missed.

## The path

| # | Phase | Time | Done when |
|---|---|---|---|
| 1 | **Prepare.** Choose a vault folder (local, not iCloud/Dropbox), copy `template/` into it, open it in Obsidian. | 10 min | The vault opens and shows the template folders. |
| 2 | **Decide.** Domains, projects, task source, on-demand vs scheduled, ambient sources, what must never be stored. | 15 min | You've confirmed each choice. |
| 3 | **Interview.** Role, people, working style and persona, goals. Claude generates your persona, core file, domains, projects and People notes. | 20 min | No raw `[PLACEHOLDER]`s remain except those marked `[later]`. |
| 4 | **Seed** (optional). Claude scans the last 30 days of connected sources and drafts each domain, marking inferred facts `[confirm]`. | 30 min | Every domain has a context and log. |
| 5 | **Connect.** Create a Claude Project, paste `router.md` once, grant vault access. | 10 min | Saying "morning" runs the ritual and writes a journal. |
| 6 | **Check.** Claude runs the setup check. | 10 min | Zero blockers. |
| 7 | **First week.** Run morning and end-of-day, resolve `[confirm]` items. | a few min/day | You've used it four days. |

## Deciding your domains

- A **domain** is durable knowledge with no end date that you keep current ("competitive-intel").
- A **project** has a deadline and a deliverable, usually spanning domains ("Q1 launch"). It moves to `Projects/Complete/` when shipped.
- Shared company or brand material is reference, or a domain of its own.
- Start with **3 to 5 domains plus `personal-ops`**. Lowercase-hyphenated names. You can add more later; just tell the assistant.
- Test: *spans multiple domains and has a deadline and a deliverable → project. Ongoing subject knowledge → domain.*

Examples: `segment-gtm`, `product-launches`, `competitive-intel`, `pricing-packaging`, `customer-insight`, `personal-ops`.

## Your vault, in one picture

You mostly edit `Daily/Notes.md`, `Daily/Tasks.md`, `Domains/<d>/_index.md` and `working-docs/`. The assistant manages `z_contextos/` (journals, meeting notes, People, domain `_context.md` / `_log.md`). See the "Where does this go?" table in [`02-architecture.md`](02-architecture.md). People and meetings have their own notes and Bases (`Bases/People.base`, `Bases/Meetings.base`) so you can browse them as tables.

## Connections and sources

Rituals read calendar, email, chat, drive and task tools if connected. Missing a source is fine: the ritual says "X not reachable" and continues. Source specifics (Gemini, Otter, Zoom, Jira, Linear, Asana) are in `z_contextos/reference/_source-adapters.md`. What must stay out of the vault, and how big files are handled, are in `z_contextos/rules/_rules-sensitive.md`.

## How the project instructions work

You paste a short **router** into Claude's project instructions once. It gives the vault path and says "read `contextos-core.md` from the vault first." All behavior lives in the vault, so changing a persona, domain or ritual takes effect next session. Re-paste only if the vault path or the router itself changes.

## Permissions

Restructuring (removing template residue, moving files) may need the assistant to delete or move files. Grant that up front or approve each prompt.

## Daily rhythm

| When | Say | What happens |
|---|---|---|
| Morning | "morning" | Briefing, meeting prep, task recommendations. If a past day's sessions weren't wrapped, they're wrapped first. |
| End of work block | "wrap this up" | Context updated, journal entry, tasks reconciled |
| End of day | "end of day" | Ambient catch-up, tomorrow's priorities |
| End of week | "end of week" | Weekly distillation of every domain, archive, wins review |
| Start of week | "start of week" | Prior week recap, week ahead |

Rituals run on demand. Scheduled runs only work with the app open and are not part of setup.

## Customizing later

- **Persona or voice:** edit `_persona.md` / `_voice-guide.md` (see `_persona-guide.md`). Specific examples beat adjectives.
- **New domain or project:** tell the assistant, or create the files from `z_contextos/templates/`.
- **Change a ritual:** edit `z_contextos/rituals/ritual-<name>.md`. If a trigger phrase changes, update the routing table in the core file and the rituals index.
- **Pull template updates:** the vault's change log records the `template-version` you started from. Compare to this repo's `CHANGELOG.md` and apply changes without overwriting personal files.

## Minimal rebuild order (from nothing)

Vault skeleton → router + core file → architecture map → domain skeletons → three rules (context files, tagging, tokens) → Morning and Session Wrap → End of Week → persona → change log.
