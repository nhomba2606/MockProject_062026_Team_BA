# Wireframes — Version Index

This folder holds two things:

- **Per-module source wireframes** (`admin/`, `M1/`, `M2/`, `M3/`, `M7/`,
  `extra/`) — the working PDF/PNG exports organized by module, updated as
  screens change.
- **Versioned baseline snapshots** (`v1.0/`, ...) — a dated, full-screen-set
  capture of the UI at a point in time, following the same **Draft
  (Pre-Baseline) → Baseline (Pre-CR) → Baseline (Post-CR)** lifecycle used by
  [`docs/share/brd/README.md`](../brd/README.md).

| Version | Folder | Contents | Status | Date |
|---|---|---|---|---|
| v1.0 | [`v1.0/`](v1.0/) | 45 screen captures, `SC_001`–`SC_045` | **Baseline (Pre-CR) — CURRENT** | 2026-07-09 |

## Reading order

- **Always cite `v1.0/`** as the current full-screen baseline unless you are
  specifically researching document history.
- The per-module folders (`admin/`, `M1/`, ...) remain the source of truth for
  an individual screen's latest wireframe; `v1.0/` is a point-in-time snapshot
  of all screens together, useful for CR impact analysis and traceability.
- When a Change Request lands against the UI, add a `v1.1/` folder (Baseline,
  Post-CR) with the updated screen set rather than editing `v1.0/` in place —
  this preserves the pre-CR baseline for audit/traceability.

## Naming convention

`docs/share/wireframes/<version>/SC_<###>_<screen-code>_<slug>.png` — one
subfolder per version, filenames kept as captured (`SC_###` sequence +
screen code) for traceability back to the source capture. This mirrors the
versioning convention in `../../../.claude/rules/docs-storage.md` §4, applied
per-artifact as established by `docs/share/brd/README.md`.
