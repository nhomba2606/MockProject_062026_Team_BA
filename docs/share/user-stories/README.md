# User Stories — Version Index

This folder tracks the User Stories + Acceptance Criteria lineage through its
version lifecycle: **Draft (Pre-Baseline) → Baseline (Pre-CR) → Baseline
(Post-CR)**. Each version lives in its own subfolder, named after the
document's version number, so the canonical/current version is always
unambiguous.

| Version | Folder | Files | Status | Date |
|---|---|---|---|---|
| v1.0 | [`v1.0/`](v1.0/) | `us-ac-sc001-007_sc028.docx`, `us-ac-sc008-016.docx`, `us-ac-sc017-025.docx`, `us-ac-sc026-034.docx`, `us-ac-sc035-044.docx`, `us-ac-tracking.xlsx` | **Baseline (Pre-CR) — CURRENT** | 2026-07-10 |

## Reading order

- **Always cite the `v1.0/` set** as the current User Stories + AC baseline
  unless you are specifically researching document history.
- `us-ac-tracking.xlsx` is the coverage tracker across all screens (SC001–SC044);
  the five `.docx` files hold the story/AC text split by screen range.
- When a Change Request lands against these user stories, add a `v1.1/` folder
  (Baseline, Post-CR) rather than editing `v1.0/` in place — this preserves
  the pre-CR baseline for audit/traceability.

## Naming convention

`docs/share/user-stories/<version>/<file>` — one subfolder per version. This
mirrors the versioning convention in `../../../.claude/rules/docs-storage.md`
§4, applied per-artifact as established by
[`docs/share/brd/README.md`](../brd/README.md), so each shared deliverable
(`brd`, `user-stories`, `wireframes`, ...) versions independently.
