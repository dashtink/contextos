# Changelog

Template versions. Personal vaults record the `template-version` they started from in `z_contextos/system/_change-log.md`; to update, compare it to this file and apply the listed changes without overwriting personal files.

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
