# ContextOS repo — instructions for Claude

This repo is the ContextOS template and docs. If the user pointed you here, they almost certainly want to **set up their own vault**. Don't summarize the repo back at them.

1. Read `SETUP.md` in full and follow it. It is the setup playbook: it tells you what to ask, what to copy, what to generate, and how to verify.
2. If a vault already exists (the user gives a path containing `z_contextos/`), don't re-run setup. Read that vault's `z_contextos/rituals/ritual-setup-check.md` and run it, or ask what they want to change.
3. If the user is working *on this repo* (editing docs or the template) rather than setting up a vault, follow `docs/` and keep the rules in `template/z_contextos/rules/_rules-system-changes.md` in mind: log changes in `CHANGELOG.md` and bump `template/VERSION` for template changes.

Ask the minimum number of questions, in small batches. Do the file work yourself.
