# ContextOS — Setup Playbook (for the assistant)

You are setting up a new ContextOS vault for the user. Follow this top to bottom. The user should only have to answer questions and approve a few steps. Don't hand them a to-do list of file operations.

**Time target:** under 2 hours end to end, most of it the user answering questions. Each phase has a **Done when**. Don't move on until it's true, and tell the user which phase you're in.

## Phase 0 — Check your access (2 min)

You need to read the repo's `template/` folder and write to a folder on the user's machine.

- **Claude Code or Claude Desktop with Filesystem access:** you're fine. Ask for the vault location in Phase 1.
- **No write access to the user's disk:** tell them plainly. Options: (a) open this repo in Claude Code or Claude Desktop with the Filesystem extension and re-run, or (b) you generate the files in chat, one file per code block, and they paste them. Prefer (a).
- **Can't clone the repo** (network policy, HTTP 403): fetch files one at a time and check them against `template/MANIFEST.txt`, which lists every file. Don't skip any.
- You may need **delete/move permission** in the vault when removing template residue. Ask for it up front instead of failing midway.

**Done when:** you know you can read the template and write the vault.

## Phase 1 — Prepare the vault (10 min)

1. Ask: *Where should the vault live?* Default `~/Documents/ContextOS`. Warn once, briefly, against iCloud/Dropbox-synced folders. If this is for work, also ask whether the company's AI policy allows local files in a model's context (see `_rules-sensitive.md`).
2. Copy everything inside `template/` (including the hidden `.obsidian/` folder) into that folder.
3. Tell the user to install Obsidian (free, obsidian.md) if they haven't, and open that folder as a vault. Required plugins: none beyond core. The `.obsidian/` config already points Daily Notes and Templates at the right folders.

**Done when:** the vault folder exists, contains `z_contextos/`, `Domains/`, `Daily/`, `Projects/`, and the user can open it in Obsidian (or says they'll do that later).

## Phase 2 — Decide (15 min)

These choices caused the most rework in real setups. Settle them before generating anything. Propose answers; don't make the user start from blank.

**Domains (start with 3 to 5, plus `personal-ops`).** A domain is durable knowledge you keep current, with no end date. A project is a deliverable with a deadline, and usually spans domains. Company or brand material that everyone shares is reference, or a domain of its own.
- Ask what subjects they need deep, ongoing knowledge of. Each is a domain candidate.
- Ask what they're actively building or shipping right now. Each is a **project**, not a domain.
- Names are lowercase-hyphenated (`competitive-intel`). Aim for something that fits one `_context.md` file.
- Restate the final list back and get a yes. Don't proceed on a guess.

**Task source of truth.** Default: `Daily/Tasks.md` only (single tier). Only use an external tracker if they already live in one and a connector exists.

**On demand vs. scheduled.** Default: rituals run when the user says the trigger phrase ("morning", "wrap this up"). Scheduled runs only work if the app is open and have to be set up separately. Don't build scheduling in setup.

**Ambient sources.** Ask which tools hold their calendar, mail, chat, documents and call notes, which of those you can already read, and which need approval first. Anything you can't read gets noted in the project core file as `not connected`, and the rituals skip it with a visible note (see each ritual's *If a connector is down* section).

**Sensitive material.** Ask what must never enter the vault (HR, compensation, personal calendar details, customer data). Record it in `z_contextos/rules/_rules-sensitive.md`.

**Done when:** you have a confirmed domain list, project list, task source, source list, and a "never store" list.

## Phase 3 — Interview (20 min)

Ask in four short batches. Wait for answers between batches. Offer defaults and options where it helps.

1. **Role:** name, title, team, manager, start date, time zone, working hours, focus areas (and what is explicitly *not* theirs), the 5 to 10 people they work with most and how, next three deadlines.
2. **Working style / persona:** brief or detailed, blunt or diplomatic, humor welcome? When should you push back versus just do it? Offer **three** assistant names or let them skip a name. Use `z_contextos/reference/_persona-guide.md` for starter personas and calibration examples. Voice guide (writing samples) is opt-in; skip it if they don't want it.
3. **Goals:** next 30/60/90 days, career goals, what counts as a win.
4. Anything from Phase 2 you still need.

Then generate, writing files one at a time, reading before writing:
- `z_contextos/reference/_persona.md` from their answers.
- `z_contextos/project-instructions/contextos-core.md`: fill every placeholder. Mark deliberately-open items `[later: <reason>]` rather than leaving raw `[PLACEHOLDER]`s.
- `Domains/personal-ops/` and `z_contextos/_data/Domains/personal-ops/`: fill from the interview.
- For each domain: copy `z_contextos/templates/Domain-{Index,Context,Log}.md` to `Domains/<d>/_index.md`, `z_contextos/_data/Domains/<d>/_context.md`, `z_contextos/_data/Domains/<d>/_log.md`, plus empty `reference/` and `working-docs/` under `Domains/<d>/`.
- For each project: a folder under `Projects/` from `Project-Index.md`, and a row in `Projects/_projects-index.md`.
- A file in `z_contextos/_data/People/` per key person, with `type/person` tag.
- Update `z_contextos/system/_architecture.md` domain index, `_rules-tagging.md` (`domain/<d>` tags), `_context-registry.md` tracker.
- Remove template residue: the `[example]` rows in `Daily/Tasks.md`, any remaining `[domain-name]`, `[YYYY-MM-DD]` outside `templates/`, and the placeholder rows in `_projects-index.md`. Dates in frontmatter become today's date.

**Done when:** the core file has no raw `[PLACEHOLDER]`s except those marked `[later: ...]`.

## Phase 4 — Seed (30 min, optional but recommended)

If calendar, mail, chat or docs are connected, scan the **last 30 days, subject lines and titles only**, and write a first pass into each domain's `_context.md` and `_log.md`.

- Mark every inferred fact `[confirm]` and add a provenance line: `(source: <where>, <date>)`.
- Don't state a fact when sources disagree. List both and mark `[confirm]`.
- Never copy a large document in; link it.
- Don't guess people's roles or attribute quotes you can't source.

**Done when:** each domain has a `_context.md` and `_log.md` with real content, and the number of `[confirm]` items per domain is reported to the user.

## Phase 5 — Connect Claude (10 min)

The project instructions are a **router**: a short file the user pastes once. Everything behavioral lives in the vault, so changing behavior later doesn't require re-pasting.

1. Produce `z_contextos/project-instructions/router.md` filled with the vault path (it's short).
2. Tell the user to create a Claude Project (suggest the name "ContextOS"), paste the router into Project Instructions, and give Claude Desktop's Filesystem extension access to the vault folder. Connect calendar/mail/drive per Phase 2.
3. If you are already running with the vault path accessible (Claude Code), you can confirm by reading `_architecture.md` and say so.

**Done when:** a new chat in that project, given the word "morning", reads the core file, runs `ritual-morning.md` and writes a daily journal. Offer to test that with them.

## Phase 6 — Check (10 min)

Load `z_contextos/rituals/ritual-setup-check.md` in full and run it. Fix what it finds. Report pass/fail with file names.

**Done when:** zero blockers.

## Phase 7 — First week

Tell the user, in four lines: say "morning" to start, "wrap this up" to end a work block, "end of day" to close the day, "end of week" on Friday. Day one will be thin; it fills in with use. Confirm `[confirm]` items as they come up.

## Rules for you during setup

- Read before writing. Write files one at a time. If a write fails, put the pending content in chat.
- Don't invent facts. Ask, or mark `[confirm]`.
- Don't store anything on the "never store" list.
- Ask the fewest questions that unblock the next step. Offer a recommended answer with each.
- Log the setup in `z_contextos/system/_change-log.md` as the first real entry, including `template-version` from `template/VERSION`.

## Placeholders: required vs. later

| Placeholder | Required? |
|---|---|
| Vault path, user name, role, manager, domain list, assistant name (or "none") | Required before Phase 5 |
| Time zone, working hours, key people, projects | Required, can be thin |
| Voice guide, `_docx-style-guide.md`, `_ops-layer.md`, persona calibration examples | Optional; mark `[later]` |
| Task tracker IDs, chat-log sources | Only if used |
