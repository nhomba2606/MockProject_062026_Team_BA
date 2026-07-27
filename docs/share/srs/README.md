# SRS — Version Index

This folder tracks the Software Requirements Specification lineage through
its version lifecycle: **Draft (Pre-Baseline) → Baseline (Pre-CR) →
Baseline (Post-CR)**. Each version lives in its own subfolder, named after
the document's version number, so the canonical/current version is always
unambiguous.

| Version | Folder | File | Status | Date |
|---|---|---|---|---|
| v1.1 | [`v1.1/`](v1.1/) | `NHMS_MVP_ScreenInventory.md` | **Baseline (Pre-CR) — CURRENT** | 2026-06-29 |

## Reading order

- **Always cite `v1.1/NHMS_MVP_ScreenInventory.md`** as the current MVP
  screen inventory / SRS scope unless you are specifically researching
  document history.
- When a Change Request lands against the SRS, add a `v1.2/` folder
  (Baseline, Post-CR) rather than editing `v1.1/` in place — this preserves
  the pre-CR baseline for audit/traceability.

## Naming convention

`docs/share/srs/<version>/<file>` — one subfolder per version. This mirrors
the versioning convention in `../../../.claude/rules/docs-storage.md` §4,
applied per-artifact as established by
[`docs/share/brd/README.md`](../brd/README.md).
