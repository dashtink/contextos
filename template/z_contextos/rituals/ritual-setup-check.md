# Ritual — Setup Check

**Triggers:** "check my setup" / "validate the vault" / end of setup (Phase 6) / after a big restructure

**Goal:** report pass or fail with file names. Fix what you can; list what needs the user. Read-only until you report.

**Checks:**
1. **Leftover placeholders:** none of `[PLACEHOLDER]`, `[domain-name]`, `[Assistant Name]`, `[YYYY-MM-DD]`, `[later` markers remain outside `z_contextos/templates/`, except items intentionally marked `[later: reason]` (list those).
2. **Template residue:** no `example-domain`, no sample tasks, no placeholder rows in `_projects-index.md`.
3. **Domains:** every domain in `_architecture.md` has `Domains/<d>/_index.md`, `_data/Domains/<d>/_context.md`, `_log.md`, and a `domain/<d>` tag in `_rules-tagging.md`. No second `_log.md` under `Domains/`.
4. **Tags:** every tag used in files exists in the vocabulary.
5. **Links:** no `[[wikilinks]]` point to missing files.
6. **Frontmatter:** every file with frontmatter has a valid `updated:` date.
7. **Core file vs vault:** `contextos-core.md` lists the same domains, projects and rituals as the vault.
8. **Router:** `router.md` has a real vault path and the user confirms it is pasted into Claude.
9. **Rituals index:** points only to files inside the vault, and every ritual file is listed.
10. **Size:** no file over ~200 KB or image-heavy note in the context path.
11. **Sensitive material:** nothing from `_rules-sensitive.md`'s never-store list is in the vault (check names and obvious paths; don't read contents of suspect files).
12. **`[confirm]` count per domain,** so the owner sees what needs verifying.

**Output:**
```
Setup check — [date]
Blockers: [n] — [file: problem]
Warnings: [n] — [file: problem]
[confirm] items: [domain: n, ...]
Intentionally open ([later]): [list]
```
Zero blockers = pass.

## If a connector is down
This ritual only reads the vault. If the vault is unreachable, say so and stop.
