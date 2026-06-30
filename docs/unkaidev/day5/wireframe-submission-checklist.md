# NHMS — Wireframe Submission Checklist (PC-Web)

> **BA Lead review · Sprint 1 · Day 4–5**
> Legend: ✅ submitted · ❌ missing · ⚠️ submitted wrong screen (see note)

---

## Kieu Quang Van (`unkaidev`) — M1 Intake & EHR · 7 screens

| Screen ID | Screen Name | PNG | PDF | Note |
|---|---|:---:|:---:|---|
| M1-US-01 | Resident List | ✅ | ✅ | |
| M1-US-02 | Resident Profile — Detail | ✅ | ✅ | |
| M1-US-03 | Create / Edit Resident Profile | ✅ | ✅ | |
| M1-US-04 | Pre-Admission Screening | ✅ | ✅ | |
| M1-US-05 | Admission Form | ✅ | ✅ | |
| M1-US-06 | Initial Assessment Form | ✅ | ✅ | |
| M1-US-08 | LOC Classification Result | ✅ | ✅ | |

**Result: 7 / 7** ✅

---

## Phan Thanh Loc (`Codename-Lok`) — M2 Care Planning + M3-US-01 · 5 screens

| Screen ID | Screen Name | PNG/PDF | Note |
|---|---|:---:|---|
| M2-US-01 | Care Plan — Create / Edit | ✅ | "Care Plan Dashboard WEB" |
| M2-US-02 | Care Plan — Detail View | ✅ | "Resident Care Plan Detail WEB" |
| M2-US-05 | Daily Task List (CNA Dashboard) | ✅ | "Care Task Assignment WEB" |
| M2-US-06 | Task Completion Log | ❌ | Not submitted — submitted "eMAR Medication Schedule WEB" instead (→ M3-US-04, not assigned) |
| M3-US-01 | Medication Administration Dashboard | ✅ | "Medication Administration WEB" |

**Result: 4 / 5** — missing M2-US-06

> ⚠️ **Note:** Loc submitted `eMAR Medication Schedule WEB.pdf` which maps to **M3-US-04** (thienhn's assignment). This file has been accepted into share as `wireframe_M3-US-04_mar_web.pdf` since thienhn did not submit it.

---

## Huynh Ngoc Thien (`thienhn22git-cloud`) — M3 eMAR (4 screens) + M7-US-01 · 5 screens

| Screen ID | Screen Name | PNG | PDF | Note |
|---|---|:---:|:---:|---|
| M3-US-02 | Med-Pass — Barcode Scan | ✅ | ✅ | "Advanced Verification Web" |
| M3-US-03 | Verification Override | — | ✅ | "Verification Override WEB.pdf" (day5) |
| M3-US-04 | Medication Administration Record (MAR) | ❌ | ❌ | Not submitted — covered by Codename-Lok |
| M3-US-06 | Medication Order List | — | ✅ | "Medication Order List WEB.pdf" (day5) |
| M7-US-01 | Report New Incident | ✅ | ✅ | "Incident Reporting Web" |

**Result: 4 / 5** — M3-US-04 covered by Codename-Lok

> ⚠️ **Note:** Thien submitted 3 extra screens outside MVP scope: Pharmacy Integration Web, Smart Med-Pass Scheduling Web, Wound Management Web. These are saved in `docs/share/wireframes/extra/` for reference.

---

## To Duy Bac (`duybac210`) — M7 Incident (2 screens) + Admin (3 screens) · 5 screens

| Screen ID | Screen Name | PNG | PDF | Note |
|---|---|:---:|:---:|---|
| M7-US-02 | Incident — Chart Lock Confirmation | ✅ | ✅ | |
| M7-US-04 | Incident List | ✅ | ✅ | |
| AD-01 | User List | ✅ | ✅ | |
| AD-02 | Create / Edit User | ✅ | ✅ | |
| AD-05 | Facility Settings | ✅ | ✅ | |

**Result: 5 / 5** ✅

---

## Nguyen Thi Phuong Thao (`nickhocbaicuathao-lab`) — Admin Config · 5 screens

| Screen ID | Screen Name | PNG | PDF | Note |
|---|---|:---:|:---:|---|
| AD-06 | LOC Rate Table | ✅ | ✅ | |
| AD-07 | Staffing Ratio Configuration | ✅ | ✅ | |
| AD-08 | Incident Severity Levels | ✅ | ✅ | |
| AD-09 | SLA Configuration | ✅ | ✅ | |
| AD-10 | Demo Data Seeder | ✅ | ✅ | |

**Result: 5 / 5** ✅

---

## Tổng kết

| Member | Assigned | Submitted | Missing |
|---|:---:|:---:|---|
| unkaidev | 7 | 7 | — |
| Codename-Lok | 5 | 4 | M2-US-06 *(delayed)* |
| thienhn22git-cloud | 5 | 4 | M3-US-04 *(covered by Codename-Lok)* |
| duybac210 | 5 | 5 | — |
| nickhocbaicuathao-lab | 5 | 5 | — |
| **Total** | **27** | **25** | **2 screens** |

### Màn hình thiếu cần bổ sung

| Screen ID | Screen Name | Responsible | Status |
|---|---|---|---|
| M2-US-06 | Task Completion Log | Codename-Lok | Delayed |
| M3-US-04 | MAR (Medication Administration Record) | thienhn22git-cloud | Covered by Codename-Lok |

> M3-US-03 và M3-US-06 đã được Thiện bổ sung (day5 PDF). M3-US-04 có file từ Codename-Lok (`wireframe_M3-US-04_mar_web.pdf`). Còn thiếu thực tế: **1 screen** (M2-US-06).

---

*Last updated: 2026-06-30 (rev 2 — thienhn M3-US-03 & M3-US-06 added) · Branch: `docs/s1/unkaidev-wireframe-self-checklist`*
