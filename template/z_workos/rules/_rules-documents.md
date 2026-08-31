# Rules — Document Routing & Generation

## Routing

| Document type | Destination |
|---|---|
| Shareable deliverable (leaves the workflow, goes to someone outside it) | Formal styled output (e.g. `.docx` via `_docx-style-guide.md`) → shared storage → present as a file, never raw HTML |
| Working/scratch doc (thinking in progress) | Plain markdown → owning project's folder if it has one, else the domain's `working-docs/`, else `Scratch Pad/` |

## Rules

- Never send raw HTML to shared storage as a "deliverable" — always go through the style guide and produce a real document.
- Never skip the style guide when generating a `.docx` — fonts, colors, headers, and callout types should match the standard even for an internal draft, so it's presentable without rework.
- Always confirm/present the file after upload — don't leave the human to go find it.

## Style Guide

Edit `z_workos/reference/_docx-style-guide.md` to match your own brand or house style (fonts, colors, headers, callout types). The assistant reads it before generating any `.docx`.
