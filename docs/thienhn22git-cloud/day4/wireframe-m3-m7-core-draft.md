# Wireframe Draft — M3 eMAR & M7 Incident Core Screens
> Author: Huynh Ngoc Thien · Day 4 · Sprint 1 · Deadline: 2026-06-30
> Issue: #51 · Branch: docs/s1/thienhn22git-cloud-wireframe-m3-m7-core

## Assigned Screens (5)

| Screen ID | Screen Name |
|---|---|
| M3-US-02 | Med-Pass — Barcode Scan |
| M3-US-03 | Verification Override |
| M3-US-04 | Medication Administration Record |
| M3-US-06 | Medication Order List |
| M7-US-01 | Report New Incident |

---

## Wireframe Checklist & Key Elements

### M3-US-02 — Med-Pass — Barcode Scan
**Primary Actor:** Nurse (RN/LPN)
**Trigger:** "Start Med-Pass" from M3-US-01 → select resident

Key elements to wireframe:
- [ ] Resident header: Name, Room, Allergy Alert banner (persistent red strip if allergies present — M3-US-07 component)
- [ ] Barcode scan viewport: camera preview area with scan frame overlay
- [ ] Manual entry fallback: "Enter code manually" link → text input + Submit
- [ ] 5 Rights verification display (auto-populated after scan):
  - Right Resident (name match indicator: Pass/Fail)
  - Right Drug (medication name + scan code)
  - Right Dose (dosage + unit)
  - Right Route (Oral / IV / Topical / etc.)
  - Right Time (scheduled time vs. current time, with window indicator ±30 min)
- [ ] Verification result: All-Clear state (green checkmarks) + "Administer" button
- [ ] Mismatch state: warning panel → "Override" button or "Cancel"
- [ ] "Mark as Refused" button (resident refuses medication)
- [ ] "Mark as Missed" button (administration window closed)

**Notes:** Barcode scan uses webcam (no physical scanner in MVP). Time window ±30 min; outside window triggers override flow (M3-US-03). Allergy banner is always visible (NFR).

---

### M3-US-03 — Verification Override
**Primary Actor:** Nurse
**Trigger:** Barcode mismatch or administration outside the time window

Key elements to wireframe:
- [ ] Modal or full-page overlay: "Override Required" heading
- [ ] Alert summary: reason for override (e.g., "Barcode mismatch: scanned [X], expected [Y]" or "Time window exceeded by [N] minutes")
- [ ] Override Reason dropdown: predefined options
  - Barcode unreadable / damaged
  - Emergency administration
  - Time window exception (physician-approved)
  - Patient transported / unavailable
  - Other (requires text)
- [ ] "Other" free-text field (conditional, required if "Other" selected)
- [ ] Acknowledgment checkbox: "I confirm this override is clinically justified"
- [ ] "Confirm Override" primary button (disabled until reason selected + checkbox ticked)
- [ ] "Cancel — Do Not Administer" secondary button
- [ ] Audit log note: "Override will be logged with your credentials and timestamp" (informational)

**Notes:** Override is logged to audit trail (NFR-02). All override records are visible in M3-US-04.

---

### M3-US-04 — Medication Administration Record (MAR)
**Primary Actor:** Nurse / DON
**Trigger:** Resident Profile → "eMAR" tab

Key elements to wireframe:
- [ ] MAR header: Resident name, Room, Current month/date range filter
- [ ] Date range filter: calendar-based or quick select (Today | This Week | This Month)
- [ ] Medication list (rows): Drug name | Dose | Route | Frequency | Prescriber
- [ ] Administration timeline grid (columns = days, rows = medications):
  - Cell status indicators: Given (green check) | Missed (red X) | Refused (orange dash) | Override (yellow triangle)
  - Cell tooltip on hover: administered by, timestamp, notes, override reason
- [ ] Legend bar: icon/color key for status indicators
- [ ] "Print MAR" button
- [ ] Filter: All | Given | Missed | Refused | Override

**Notes:** MAR is read-only view; it aggregates all eMAR events. Override entries show the reason from M3-US-03.

---

### M3-US-06 — Medication Order List
**Primary Actor:** Nurse / DON
**Trigger:** Resident Profile → "Medications" tab

Key elements to wireframe:
- [ ] Page header: "Active Medication Orders — [Resident Name]"
- [ ] "Active Orders" / "Discontinued" tabs
- [ ] Medication order table: columns →
  - Drug Name (generic + brand)
  - Dose + Unit (e.g., 500mg)
  - Route (Oral / IV / Topical / etc.)
  - Frequency (Once Daily / BID / TID / PRN / etc.)
  - Start Date
  - Prescriber Name
  - Status badge: Active | PRN | Discontinued
- [ ] Allergy conflict indicator: warning icon if drug conflicts with known allergy
- [ ] Search/filter by drug name
- [ ] Order details expandable panel (click row): full prescription notes, last administered timestamp

**Notes:** In MVP, orders are entered manually by Nurse (no e-prescribing integration). Allergy conflict is visual only (no automated block).

---

### M7-US-01 — Report New Incident
**Primary Actor:** Nurse / CNA / DON
**Trigger:** "Report Incident" global button (accessible from any screen via header/FAB)

Key elements to wireframe:
- [ ] Modal or dedicated page: "Report New Incident" heading
- [ ] Incident Type selector: dropdown or card grid
  - Fall | Medication Error | Skin Integrity | Behavioral | Elopement | Other
- [ ] Resident selector: searchable dropdown (resident name + room)
- [ ] Date & Time of Incident: date picker + time picker (defaults to now)
- [ ] Severity Level selector: Low | Medium | High | Critical (radio or segmented control with color cues)
- [ ] Incident Description: required textarea (min 50 chars guidance)
- [ ] Witness field: optional text input
- [ ] "Submit Report" primary button
- [ ] Immediate feedback on submit: "Incident Reported — Chart will be locked" toast/banner
- [ ] Auto-trigger: chart lock process starts (BR-07) → leads to M7-US-02

**Notes:** Global "Report Incident" button should appear in the main navigation/header across all screens. Severity level determines chart-lock and SLA rules (AD-08, AD-09).

---

*Draft scaffold — Day 4 · Sprint 1 · To be completed with wireframe artifacts by 2026-06-30*
*Wireframe files (.fig / .png / .pdf) to be added in subsequent commits on this branch.*
