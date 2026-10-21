# Changelog

Template versions. Personal vaults record the `template-version` they started from in `z_contextos/system/_change-log.md`; to update, compare it to this file and apply the listed changes without overwriting personal files.

## 0.2.1 — 2026-10-21
Wording only; no structural changes. Safe to apply by replacing the listed `system` files.
- Repo-wide language pass: removed the remaining "no memory" and "stateless" framing from `README.md` and `docs/02-architecture.md` (built-in memory acknowledged; ContextOS described as the explicit, editable layer).
- Removed leftover "bootstrap doc", "project-instructions file" and re-paste wording from `docs/02-architecture.md`, `docs/03-rituals.md`, `ritual-wrap.md` and `_rules-token.md`.
- `docs/03-rituals.md`: added Setup Check and the retroactive Session Wrap chain to the index and chain tables.
- Merged the two setup guides: `SETUP.md` is the only setup procedure; `docs/04-setup-guide.md` became `docs/04-getting-started.md` (how to start, domains, layout, rhythm, customizing) and no longer repeats the phases.
- Fixed ritual count (12) in the template change log. Release version now shown in the README.

## 0.2.0 — 2026-10-21
Based on feedback from a real second-vault setup.
- **Agent-led setup:** root `CLAUDE.md` and `SETUP.md` playbook (7 phases, each with "done when"). Point Claude at the repo and it does the setup.
- **Router pattern:** `project-instructions/router.md` is pasted once; `contextos-core.md` lives in the vault and is read each session. Behavior changes no longer require re-pasting.
- **New:** `ritual-setup-check.md`, `_rules-sensitive.md` (never-store list, large files), `_why.md` (design reasons, inside the vault), `_persona-guide.md`, `_source-adapters.md`.
- **Session Wrap default:** Morning runs a retroactive wrap for any prior-day session that wasn't wrapped.
- **Every ritual:** an "If a connector is down" fallback.
- **Template cleanup:** `example-domain` and the Northwind core file moved to `examples/northwind/`; broken "parent repo" pointers removed; folder READMEs added.
- **Tags:** added `type/person`, `type/transcript`. Meeting-Note template has structured properties and a quoted-title note.
- **Obsidian:** preconfigured Daily Notes and Templates settings; `People.base` and `Meetings.base` (not yet tested in Obsidian).
- **Provenance:** `[confirm]` rule for inferred facts.
- **Docs:** manifesto opens with a one-page summary (what/does/use/how, building blocks, principles); "Where does this go?" table; domain vs project guidance; clarified built-in memory and harness.

## 0.1.0
Initial release.
