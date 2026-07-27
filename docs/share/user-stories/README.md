# User Stories — Version Index

This folder tracks the User Stories + Acceptance Criteria lineage through its
version lifecycle: **Draft (Pre-Baseline) → Baseline (Pre-CR) → Baseline
(Post-CR)**. Each version lives in its own subfolder, named after the
document's version number, so the canonical/current version is always
unambiguous.

| Version | Folder | Files | Status | Date |
|---|---|---|---|---|
| v0.9 | [`v0.9/`](v0.9/) | `us-ac-sc001-007_sc028.docx`, `us-ac-sc008-016.docx`, `us-ac-sc017-025.docx`, `us-ac-sc026-034.docx`, `us-ac-sc035-044.docx`, `us-ac-tracking.xlsx` | Draft (Pre-Baseline) — superseded | 2026-07-09 |
| v1.0 | [`v1.0/`](v1.0/) | `us-ac-sc001-007_sc028.docx`, `us-ac-sc008-016.docx`, `us-ac-sc017-025.docx`, `us-ac-sc026-034.docx`, `us-ac-sc035-044.docx`, `us-ac-tracking.xlsx` | Baseline (Pre-CR) — superseded | 2026-07-10 |
| v1.1 | [`v1.1/`](v1.1/) | `us-ac-sc001-007_sc028_sc045-047.docx`, `us-ac-sc008-016.docx`, `us-ac-sc017-025.docx`, `us-ac-sc026-034.docx`, `us-ac-sc035-044.docx`, `us-ac-tracking.xlsx` | **Baseline (Post-CR) — CURRENT** | 2026-07-13 |

## Reading order

- **Always cite the `v1.1/` set** as the current User Stories + AC baseline
  unless you are specifically researching document history.
- `us-ac-tracking.xlsx` is the coverage tracker across all screens; the
  `.docx` files hold the story/AC text split by screen range.
- `v1.1` is the Post-CR update for the Holiday Configuration change request:
  it adds SC045–SC047 coverage into the first `.docx` and refreshes
  `us-ac-sc008-016.docx`, `us-ac-sc026-034.docx`, `us-ac-sc035-044.docx`, and
  the tracker. `us-ac-sc017-025.docx` is unchanged from `v1.0` and carried
  forward so `v1.1` stays a complete, self-contained set.
- When the next Change Request lands, add a `v1.2/` folder (Baseline,
  Post-CR) rather than editing `v1.1/` in place — this preserves each prior
  baseline for audit/traceability.

## Naming convention

`docs/share/user-stories/<version>/<file>` — one subfolder per version. This
mirrors the versioning convention in `../../../.claude/rules/docs-storage.md`
§4, applied per-artifact as established by
[`docs/share/brd/README.md`](../brd/README.md), so each shared deliverable
(`brd`, `user-stories`, `wireframes`, ...) versions independently.
