# BRD — Version Index

This folder tracks the Business Requirements Document lineage through its
version lifecycle: **Draft (Pre-Baseline) → Baseline (Pre-CR) → Baseline
(Post-CR)**. Each version lives in its own subfolder, named after the
document's version number, so the canonical/current version is always
unambiguous.

| Version | Folder | File | Status | Date |
|---|---|---|---|---|
| v0.8 | [`v0.8/`](v0.8/) | `brd-v0.8-business-analysis.md` | Draft (Pre-Baseline) — superseded | 2026-06-26 |
| v0.9 | [`v0.9/`](v0.9/) | `brd-v0.9-discovery-day4.docx` | Draft (Pre-Baseline) — superseded | 2026-06-27 |
| v1.0 | [`v1.0/`](v1.0/) | `brd-v1.0.md` | **Baseline (Pre-CR) — CURRENT** | 2026-06-29 |

## Reading order

- **Always cite `v1.0/brd-v1.0.md`** as the current BRD unless you are
  specifically researching document history.
- `v0.8` and `v0.9` are earlier discovery-stage drafts, kept for traceability
  only — they predate the confirmed Phase 1 decisions in `v1.0`.
- When a Change Request lands against the BRD, add a `v1.1/` folder
  (Baseline, Post-CR) rather than editing `v1.0/` in place — this preserves
  the pre-CR baseline for audit/traceability.

## Naming convention

`docs/share/brd/<version>/brd-<version>[-slug].<ext>` — kebab-case, one
subfolder per version. This mirrors the versioning convention in
`../../../.claude/rules/docs-storage.md` §4, applied per-artifact so each
shared deliverable (`brd`, `srs`, `user-stories`, ...) versions independently.
