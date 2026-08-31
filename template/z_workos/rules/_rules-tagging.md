# Rules — Tagging

Closed vocabulary. An open tagging system drifts within weeks — this one stays useful by forcing a propose-then-use step for anything new.

## Canonical Namespaces

| Namespace | Values | Example |
|---|---|---|
| `domain/*` | one per active domain (see `_architecture.md`) | `domain/example-domain` |
| `type/*` | `task`, `scratch`, `link`, `meeting`, `decision` | `type/link` |
| `org/*` | stakeholder or team names, added as needed | `org/product-team` |
| `system/*` | `ritual`, `rule`, `change` | `system/change` |
| `status/*` | `active`, `at-risk`, `not-started`, `shipped`, `parked` | `status/active` |

## Adding a New Tag

1. Propose it in-session: state the tag, the namespace it belongs to, and why an existing tag doesn't cover it.
2. If approved, add it to this file's canonical list.
3. Log the addition to `_change-log.md` with the date and reason.
4. Only then use it on a file.

Never invent a tag ad hoc "just this once" — that's exactly how an open taxonomy starts drifting. If you're not sure a tag exists yet, check this file before using it.

## Project Status (closed set)

`active` · `at-risk` · `not-started` · `shipped` · `parked`
