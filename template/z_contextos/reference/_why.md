---
updated: 2026-10-21
---
# Why the system works this way

The short version of the design reasons the assistant and the user can lean on. Everything here lives inside the vault so no rule points outside it.

## Context maintenance
Updating `_context.md` "whenever something relevant comes up" failed silently: a step with no visible output gets skipped. The primary mechanism is the End-of-Week ritual, which must report on **every** domain, including "no change." Silence is the failure state; "nothing changed" is a valid output. Morning surfaces days-since-update as an alarm, but the alarm is not the fix.

## Three file types
- `_context.md`: current state only. Replace stale sections; never append.
- `_log.md`: append-only, dated, newest on top. One per domain, under `z_contextos/_data/Domains/`.
- `_index.md`: human dashboard. `_context.md` wins on conflict.

Each domain has two folders on purpose. `Domains/<d>/` is for the human (dashboard, reference, working docs). `z_contextos/_data/Domains/<d>/` is for the assistant (context, log). Keeping them apart stopped duplicate logs going stale.

## Domain or project?
A domain is durable knowledge with no end date. A project has a deadline and a deliverable and usually spans domains. A thing becomes a project only if it hits two of: spans domains, hard deadline, more than one deliverable. Shared company or brand material is reference, or a domain of its own.

## One task tier
A two-tier task model collapsed because the second tier stopped being opened. `Daily/Tasks.md` is the only tier.

## Closed vocabularies
Tags, project status and task tiers use fixed lists. Open tagging drifts within weeks, so new tags need propose-then-approve.

## Wins are opt-in
The system surfaces candidates; the human decides.

## Don't guess attribution
Auto-transcription speaker labels are not names. Wrong attribution is worse than none.

## Rules vs. operating principles
Files in `rules/` are contracts for handling files (context, tags, tokens, documents, system changes). The operating principles behind them are listed here.
