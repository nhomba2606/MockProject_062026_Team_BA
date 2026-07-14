# Process Diagrams — Version Index

This folder tracks the Business Process Diagrams (BPMN) lineage through its
version lifecycle: **Draft (Pre-Baseline) → Baseline (Pre-CR) → Baseline
(Post-CR)**. Each version lives in its own subfolder, named after the
document's version number, so the canonical/current version is always
unambiguous.

| Version | Folder | File | Status | Date |
|---|---|---|---|---|
| v1.0 | [`v1.0/`](v1.0/) | `png/nhms_e2e_workflow.png` | **Baseline (Pre-CR) — CURRENT** | 2026-07-01 |

## Reading order

- **Always cite `v1.0/png/nhms_e2e_workflow.png`** as the current end-to-end
  workflow diagram unless you are specifically researching document history.
- The `png/` subfolder holds the exported raster; if a source file (e.g.
  `.bpmn`, `.drawio`) is added later, it lives alongside `png/` in the same
  version folder.
- When a Change Request lands against the process flow, add a `v1.1/` folder
  (Baseline, Post-CR) rather than editing `v1.0/` in place — this preserves
  the pre-CR baseline for audit/traceability.

## Naming convention

`docs/share/process-diagrams/<version>/png/<file>` — one subfolder per
version. This mirrors the versioning convention in
`../../../.claude/rules/docs-storage.md` §4, applied per-artifact as
established by [`docs/share/brd/README.md`](../brd/README.md).
