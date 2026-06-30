# Wireframe Draft — Admin Config & Data Core Screens
> Author: Nguyen Thi Phuong Thao · Day 4 · Sprint 1 · Deadline: 2026-06-30
> Issue: #53 · Branch: docs/s1/nickhocbaicuathao-lab-wireframe-admin-config-core

## Assigned Screens (5)

| Screen ID | Screen Name |
|---|---|
| AD-06 | LOC Rate Table |
| AD-07 | Staffing Ratio Configuration |
| AD-08 | Incident Severity Levels |
| AD-09 | SLA Configuration |
| AD-10 | Demo Data Seeder |

---

## Wireframe Checklist & Key Elements

### AD-06 — LOC Rate Table
**Primary Actor:** System Administrator
**Trigger:** Admin → "LOC Rates" section

Key elements to wireframe:
- [ ] Page header: "Level of Care Rate Table" + "Add Level" button
- [ ] Rate table: rows = LOC levels (Level 1 | 2 | 3 | 4)
  - Columns: LOC Level | Description (tooltip or expandable) | Daily Rate ($/day) | Effective Date | Actions
  - Inline edit: click rate cell → number input with save/cancel
- [ ] LOC Level badge colors consistent with M1-US-08 (Level 1=blue, 2=green, 3=orange, 4=red)
- [ ] "Add Level" modal form: Level number, description, daily rate, effective date
- [ ] Delete action: only for levels not currently assigned to any resident (with guard)
- [ ] "Seed Default Values" button: populates sample rates (for demo)
- [ ] Last updated timestamp per row

**Notes:** LOC daily rates are used in billing calculations. Level assignments come from M1-US-08. Ensure level numbers match across screens for consistency.

---

### AD-07 — Staffing Ratio Configuration
**Primary Actor:** System Administrator
**Trigger:** Admin → "Compliance Config" section

Key elements to wireframe:
- [ ] Page header: "Staffing Ratio Configuration"
- [ ] Compliance context banner: "California regulations require minimum 3.5 nursing hours per resident per day (BR-01)"
- [ ] Configuration form:
  - Minimum hours per resident per day: number input (default: 3.5, validation min: 0)
  - Breakdown by shift: Day | Evening | Night (hours each, optional sub-fields)
  - Weekend override toggle + separate threshold
- [ ] Alert Threshold section:
  - "Warn when actual ratio falls below X% of minimum" — percentage input
  - Alert notification recipients: multi-select (DON email list)
- [ ] "Save Configuration" primary button
- [ ] Version history accordion: "Previous configurations" — date, value, changed by

**Notes:** This configuration drives staffing compliance alerts in the DON dashboard. BR-01 threshold is the California regulatory minimum.

---

### AD-08 — Incident Severity Levels
**Primary Actor:** System Administrator
**Trigger:** Admin → "Incident Config" section

Key elements to wireframe:
- [ ] Page header: "Incident Severity Level Configuration"
- [ ] Severity levels table (rows = Low | Medium | High | Critical):
  - Columns: Severity Name | Color indicator | Description | Chart Lock Trigger | Actions
  - Chart Lock Trigger: toggle (Yes/No) — determines if this severity auto-locks chart (BR-07)
  - Inline name/description edit
- [ ] "Add Severity Level" button (for custom levels beyond defaults)
- [ ] Color picker per severity level (for badge/UI consistency)
- [ ] Delete guard: cannot delete severity if used in existing incidents
- [ ] Reset to Defaults button (with confirmation dialog)
- [ ] Preview section: shows how severity badges will render in M7-US-01 / M7-US-04

**Notes:** Chart Lock Trigger = Yes means submitting an incident of this severity automatically activates the lock flow (M7-US-02). NFR-03 states this must be configurable.

---

### AD-09 — SLA Configuration
**Primary Actor:** System Administrator
**Trigger:** Admin → "SLA Config" section

Key elements to wireframe:
- [ ] Page header: "Incident Reporting SLA Configuration"
- [ ] Regulatory context banner: "NFR-06: Incidents must be reported to relevant authorities within defined SLA windows"
- [ ] SLA rules table: rows per incident severity
  - Columns: Severity | SLA Window (hours) | Escalation at (% of SLA elapsed) | Notification Target
  - Default values: High → 24h, Critical → 24h, Medium → 48h, Low → 72h
  - Editable: SLA Window (number input, unit: hours) per row
- [ ] Escalation settings:
  - Escalation threshold % slider (e.g., 75% elapsed → notify DON again)
  - Notification recipients: email list per severity
- [ ] "Save SLA Rules" primary button
- [ ] "Effective from" date picker (changes apply to new incidents only, not existing)
- [ ] Warning banner if SLA window < regulatory minimum (configurable minimum check)

**Notes:** SLA countdown timer in M7-US-04 / M7-US-05 reads from this configuration. Changes only affect incidents reported after effective date.

---

### AD-10 — Demo Data Seeder
**Primary Actor:** System Administrator
**Trigger:** Admin → "Dev Tools" section

Key elements to wireframe:
- [ ] Page header: "Demo Data Seeder" + warning badge: "Development / Demo Use Only"
- [ ] Warning banner: "Seeding data will add test records. This action cannot be automatically undone."
- [ ] Seed package selector: cards or checklist
  - Package: Residents (~20 sample residents) — shows preview count
  - Package: Medications (sample medication orders per resident)
  - Package: Incidents (sample incidents across severities)
  - Package: Users (sample staff accounts per role)
  - Package: Care Plans (sample care plans linked to residents)
  - Package: All (select all above)
- [ ] Seed options:
  - "Clear existing demo data first" toggle (destructive — highlighted)
  - Date offset field: "Set admission dates relative to today" (keeps dates current)
- [ ] "Seed Selected Data" primary button (disabled until at least one package selected)
- [ ] Progress feedback: loading bar + "Seeding [X] residents... done" status messages
- [ ] Results summary: records created per category
- [ ] "Clear All Demo Data" danger button (separate, red, with confirmation dialog)

**Notes:** Seeder loads fixture CSV/JSON from the repo's seed files. Used to populate the system before demo presentations. Target: ~20 residents, sample meds, sample incidents.

---

*Draft scaffold — Day 4 · Sprint 1 · To be completed with wireframe artifacts by 2026-06-30*
*Wireframe files (.fig / .png / .pdf) to be added in subsequent commits on this branch.*
