# ContextOS — Lessons Learned

This is a real build history, generalized from a system that ran daily for over three months. It's included deliberately — the point of this repo isn't "here's a clever idea," it's "here's what happens when you actually run a context system in production, including the parts that broke." Company-specific details have been scrubbed; the failure modes and fixes are unaltered.

## The headline lesson: invisible steps get silently skipped

**The naive model:** update the relevant context file continuously, in every session, whenever something relevant comes up; audit occasionally to catch drift.

**What actually happened:** across roughly 50 sessions over three months, two of six domain context files received zero updates — while an adjacent daily-journal habit, doing comparable work, ran at nearly 100%. Same person, same discipline, wildly different reliability. The difference wasn't willpower. It was that the journal produces a visible, dated artifact every time it runs, and the "update context if relevant" instruction doesn't produce anything you can see when it's skipped.

**The fix:** stop relying on a step with no visible output. Move the load-bearing maintenance work to a ritual that *has* to produce a visible artifact — a weekly distillation that names every domain, including the ones with no change ("mm-corp — no change this week"). A daily "days since last update" counter was added as an alarm, but the alarm was never the fix — the mandatory weekly report was.

**The generalizable principle:** if a process depends on a step that produces nothing to look at when it's skipped, budget for it being skipped, no matter how many times it's marked non-negotiable. Design the visible artifact in from the start, not as a patch after the first audit finds the gap.

## The fix didn't ship clean — it needed a second audit

The redesign above was diagnosed correctly, but the first full week under the new model had **zero production runs.** No weekly journal, no distillation report — the exact same silent-skip failure mode it was built to prevent, in a new form. Worse: a multi-day stretch passed with no ritual triggered at all, and nothing in the system detected the gap, because the existing alarm checked "is context stale," not "did a session even happen."

**Fix on top of the fix:** the morning ritual now compares the most recent journal filename against today's date and surfaces the gap explicitly if it's more than one weekday — a second, independent tripwire for a different failure mode than the first one caught. The lesson under the lesson: a monitoring mechanism only catches the specific failure it was built to catch. A new fix needs its own audit, not an assumption that "we already solved this class of problem."

## Recognition signals don't look like tasks

Automated inbox-scanning logic was built to catch action items — anything phrasing itself like a request. A colleague's praise email tripped nothing, because praise doesn't look like a task. The fix wasn't smarter NLP; it was making wins an explicit, opt-in prompt at every close-out ritual, decoupled from the "find action items" logic entirely. **Lesson:** don't assume a detection system built for one signal type (asks) will generalize to a structurally different one (recognition) just because both arrive in the same channel.

## Splitting a workspace only pays for itself with a real reason

A separate vault for internal build/design notes was proposed twice and rejected both times — the actual test applied was "is there a real access, audience, or lifecycle reason," not "would this be cleaner." Splitting would have doubled the filesystem-access surface and created a second place for staleness to hide, for a benefit that was purely aesthetic. The same logic killed a proposal to split the assistant's project config by domain — it would have shrunk each individual context load, but destroyed the cross-domain visibility that was the entire point of running one system instead of six. **Lesson:** a structural split is a cost with compounding maintenance tax; only pay it for a reason that's actually load-bearing (who can see it, when it needs to be handed off, whether its lifecycle actually diverges) — not for "this feels more organized."

## Task systems collapse to the tier people actually use

An earlier version ran two task tiers — soft follow-ups and hard deliverables. The second tier quietly stopped being referenced within weeks; everything real happened in the tier people actually opened. Collapsing to one tier wasn't a simplification for its own sake — it was following the evidence of what was actually being used. **Lesson:** a second system "for completeness" that nobody opens isn't a lightweight backup — it's dead weight that will eventually be trusted less than nothing, because it'll contain stale data implying false completeness.

## Documentation drift is a standing tax, not a one-time bug

An architecture map referenced files that had already been renamed away, in more than one place, across more than one revision. Every refactor round now explicitly starts with "fix what's already wrong" before adding anything new — because the map silently drifting from the territory isn't a one-off mistake, it's the default outcome of any system that changes without a hard rule forcing the docs to change with it. That's the entire reason the system-change flow (see [`02-architecture.md`](02-architecture.md#how-the-system-changes-itself)) requires updating every touched file *in the same session*, not as a follow-up.

## Tooling instability shapes the architecture, not just the workflow

Filesystem-level access to the vault is not always reliable — it can drop or time out mid-session unpredictably. This produced a concrete rule that shows up in the actual ritual specs: **finish all reads before starting writes, and write files one at a time.** A batched multi-file write that fails partway through silently loses whatever wasn't written yet — sequential writes turn a partial failure into a visible, recoverable one instead of an invisible, destructive one. Every ritual with a "failure mode built in" note (Session Wrap especially) exists because this bit the system in production, not as speculative defensive coding.

## What actually held up

Not everything was a failure story. Several bets paid off exactly as designed, over months of real use:

- The Domain/Project split test ("deadline + deliverable → Project, else Domain") held with effectively zero misfiled items across a full audit.
- Closed vocabularies (tags, project status, task tiers) held — no invented tags ever appeared outside the approved list.
- The `_context.md`/`_log.md` split, once the maintenance-mechanism fix landed, produced exactly the outcome it was designed for: a context file that stayed a single bounded read instead of degrading into an unbounded scroll.

The pattern worth taking away isn't "get it right the first time." It's: instrument for the failure, watch it happen anyway, fix the actual mechanism (not the symptom), and write down why — so the next version of the system, or someone else's version of it, doesn't have to relearn it the expensive way.
