---
updated: 2026-01-01
---
# Architecture — Vault Map & Domain Index

> Read this file first, every session, before doing anything else. Then load only what the current task needs — see `z_contextos/rules/_rules-token.md`.

## Vault Map

```
Daily/
  Notes.md
  Tasks.md
Domains/
  [domain]/_index.md, reference/, working-docs/
Projects/
  _projects-index.md
  [project]/_index.md
  Complete/
Bases/
Links/
Scratch Pad/
z_contextos/
  system/                 ← this file, _context-registry.md, _change-log.md
  rules/
  rituals/
  reference/
  templates/
  project-instructions/
  x_archive/
  _data/
    Daily-Journal/
    Weekly-Journals/
    Meeting-Notes/
    People/
    Domains/[domain]/_context.md + _log.md
```

## Domain Index

| Domain | Owns | Context file |
|---|---|---|
| personal-ops | Org structure, career goals, wins — every instance should have this one | `z_contextos/_data/Domains/personal-ops/_context.md` |

_Add a row here every time a domain is created. A domain is durable knowledge with no end date; a deliverable with a deadline is a project. See `reference/_why.md`._

## Tag Taxonomy

Closed, namespaced. Propose new tags before using them — see `_rules-tagging.md`.

- `domain/[domain-name]`
- `type/task` · `type/scratch` · `type/link` · `type/meeting` · `type/decision` · `type/person` · `type/transcript`
- `org/[stakeholder-or-team]`
- `system/ritual` · `system/rule` · `system/change`
- `status/active` · `status/at-risk` · `status/not-started` · `status/shipped` · `status/parked`

## Project Status Values (closed set)

`active` · `at-risk` · `not-started` · `shipped` · `parked`

"At-risk" means a deadline has been missed or demonstrably will be — not "this feels urgent."

## Known Drift Log

_Track any place the map above stops matching the real folder structure. Fix this file the moment drift is found — don't let a stale map compound. Empty is the healthy state._
