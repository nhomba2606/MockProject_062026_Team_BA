# Process Diagrams — Version Index

This folder tracks the Business Process Diagrams (BPMN) lineage through its
version lifecycle: **Draft (Pre-Baseline) → Baseline (Pre-CR) → Baseline
(Post-CR)**. Each version lives in its own subfolder, named after the
document's version number, so the canonical/current version is always
unambiguous.

| Version | Folder | File | Status | Date |
|---|---|---|---|---|
| v0.9 | [`v0.9/`](v0.9/) | `png/nhms_e2e_workflow_v2_sc.png` | Draft (Pre-Baseline) — superseded | 2026-07-02 |
| v1.0 | [`v1.0/`](v1.0/) | `png/nhms_e2e_workflow_v2.png` | **Baseline (Pre-CR) — CURRENT** | 2026-07-10 |

## Reading order

- **Always cite `v1.0/png/nhms_e2e_workflow_v2.png`** as the current
  end-to-end workflow diagram unless you are specifically researching
  document history.
- `v0.9` is an earlier discovery-stage export with SC screen-code
  annotations overlaid; `v1.0` is the clean baseline export that supersedes
  it. An older, unrelated `v1.0` export from the initial BPD commit was
  replaced by this `v2` diagram, since it is the version actually carried
  through the Draft → Baseline lifecycle in `docs/<login>/` staging.
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
