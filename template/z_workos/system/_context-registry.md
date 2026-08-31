---
updated: 2026-01-01
---
# Context Registry — Staleness Thresholds & Last-Updated Tracking

Read by `ritual-context-audit.md` and `ritual-eow.md` Step 1. This file itself is checked for staleness weekly.

## Staleness Thresholds

| File type | Flag after |
|---|---|
| Active domain `_context.md` | 2 weeks without update |
| Domain `_index.md` | 2 weeks without update |
| Project `_index.md` (active/at-risk) | 1 week without update |
| Meeting notes (unprocessed transcript) | 1 week |
| This file | 1 week |
| `_architecture.md` | flag if out of sync with actual folder structure |

## Last-Updated Tracker

| File | Last updated | Status |
|---|---|---|
| `Domains/example-domain/_context.md` | 2026-01-01 | seeded (worked example) |
| `Domains/example-domain/_index.md` | 2026-01-01 | seeded (worked example) |
| `Domains/personal-ops/_context.md` | 2026-01-01 | seeded (placeholder — fill in) |
| `Domains/personal-ops/_index.md` | 2026-01-01 | seeded (placeholder — fill in) |
| `Projects/_projects-index.md` | 2026-01-01 | seeded (placeholder — fill in) |

_The End-of-Week ritual updates this table as part of its distillation step. Don't hand-maintain it outside that ritual — that's how it drifts from reality._
