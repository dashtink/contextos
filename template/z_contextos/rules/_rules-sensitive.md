# Rules — Sensitive Material and Large Files

## Never store in the vault
Written during setup. Default list (edit it):
- HR matters, performance reviews about other people, compensation.
- Personal calendar details unrelated to work.
- Customer personal data, credentials, API keys, anything under NDA that policy forbids sharing with an AI tool.

User-specific additions: [later: filled in during setup]

**What the assistant does:** if asked to ingest something on this list, don't write it. Say what you skipped and why. When reading ambient sources, summarize around it (for example "personal appointment") instead of copying details.

**Where the vault lives:** a local folder, not synced to personal cloud storage. If this is for work, check that the company's AI policy covers local files and that each connector is approved.

## Large and image-heavy files
- Files over ~200 KB, or notes with embedded images, don't belong in the context path.
- When ingesting such a note, strip embedded images and keep the text, or link the file instead of copying it.
- To read a big file, grep it or read a line range; never load it whole.
- `ritual-setup-check.md` flags any file over the threshold.
