# Wireframe Draft — M1 Intake & EHR Core Screens
> Author: Kieu Quang Van · Day 4 · Sprint 1 · Deadline: 2026-06-30
> Issue: #49 · Branch: docs/s1/unkaidev-wireframe-m1-core

## Assigned Screens (7)

| Screen ID | Screen Name |
|---|---|
| M1-US-01 | Resident List |
| M1-US-02 | Resident Profile — Detail |
| M1-US-03 | Create / Edit Resident Profile |
| M1-US-04 | Pre-Admission Screening |
| M1-US-05 | Admission Form |
| M1-US-06 | Initial Assessment Form |
| M1-US-08 | LOC Classification Result |

---

## Wireframe Checklist & Key Elements

### M1-US-01 — Resident List
**Primary Actor:** Admission Staff / Nurse / DON
**Trigger:** Login → Home

Key elements to wireframe:
- [ ] Page header: "Resident List" title + "Add New Resident" CTA button (top-right)
- [ ] Search bar: full-text by name, room number, resident ID
- [ ] Filter bar: Status tabs — All | Active | Discharged | Pending
- [ ] Data table/card list: columns → Name, Room No., Status badge, DOB, Payer Source
- [ ] Empty state design (no residents found)
- [ ] Pagination controls or infinite scroll indicator
- [ ] Row hover state + click interaction → navigates to M1-US-02

**Notes:** Status filter is critical; "Pending" = awaiting admission confirmation (BR-06).

---

### M1-US-02 — Resident Profile — Detail
**Primary Actor:** All clinical actors
**Trigger:** Click resident row from M1-US-01

Key elements to wireframe:
- [ ] Resident header card: Full name, DOB, Room, Status badge (Active/Discharged)
- [ ] DNR status indicator — prominent colored badge (red if DNR=Yes)
- [ ] Tab navigation bar: Overview | Assessments | Care Plan | eMAR | LOC | Audit
- [ ] Overview tab content: Demographics block (emergency contact, POA/guardian)
- [ ] Diagnosis list (numbered, sortable)
- [ ] Allergy list with warning-color styling
- [ ] Payer source label (Medicare / Medicaid / Private)
- [ ] LOC level badge (Level 1–4)
- [ ] Action button group: Edit Profile | Report Incident | New Assessment

**Notes:** This is the central hub screen — tabs link to other modules.

---

### M1-US-03 — Create / Edit Resident Profile
**Primary Actor:** Admission Staff
**Trigger:** "Add New Resident" button / Edit action in M1-US-02

Key elements to wireframe:
- [ ] Form header: "New Resident" or "Edit Resident — [Name]" mode indicator
- [ ] Personal info section: First Name, Last Name, Date of Birth, Gender (dropdown)
- [ ] Emergency Contact section: Name, Phone, Relationship (grouped fieldset)
- [ ] POA (Power of Attorney) toggle + conditional field: POA Full Name
- [ ] DNR toggle: Yes / No (with visual emphasis when Yes)
- [ ] Payer Source dropdown: Medicare | Medicaid | Private Pay | Other
- [ ] Form action buttons: Save (primary) | Cancel (secondary)
- [ ] Inline validation error states (required fields, date format)
- [ ] "Duplicate name" warning banner

---

### M1-US-04 — Pre-Admission Screening
**Primary Actor:** Admission Staff
**Trigger:** "New Admission" button → first step of admission flow

Key elements to wireframe:
- [ ] Step progress indicator (Step 1 of 3: Pre-Screen | Admission | Assessment)
- [ ] Clinical needs questionnaire: multi-checkbox list of care needs
- [ ] "Special requirements" free-text area
- [ ] BR-06 compliance check result banner: Pass (green) or Flag (amber/red)
- [ ] Pass state: "Proceed to Admission Form" CTA enabled
- [ ] Flag state: "Flag for Clinical Review" reason field + "Submit for Review" button
- [ ] Back button (return to previous flow)

**Notes:** BR-06 compliance check runs automatically on submit; if flagged, admission is blocked.

---

### M1-US-05 — Admission Form
**Primary Actor:** Admission Staff
**Trigger:** Successfully passed pre-admission screening

Key elements to wireframe:
- [ ] Step progress indicator (Step 2 of 3)
- [ ] Resident name/DOB auto-populated from screening (read-only header)
- [ ] Admission Date picker (required)
- [ ] Room Assignment dropdown (shows available rooms only)
- [ ] Payer Source confirmation (pre-filled from M1-US-03, editable)
- [ ] Signed Consents section: checklist of required documents (e.g., Admission Agreement, HIPAA Notice, Financial Responsibility)
- [ ] Submit button: "Confirm Admission" (disabled until all required fields filled + consents checked)
- [ ] "Save Draft" secondary button

---

### M1-US-06 — Initial Assessment Form
**Primary Actor:** Nurse (RN)
**Trigger:** After admission confirmed (auto-triggered or via "Start Assessment" CTA)

Key elements to wireframe:
- [ ] Assessment header: Resident name, Room, Admission date, "New Assessment" label
- [ ] ADL Scoring section (title: "Activities of Daily Living"):
  - Rows: Bathing | Dressing | Eating | Mobility/Ambulation | Toileting | Continence
  - Scale per row: 0 (Independent) → 4 (Total Assistance) — radio or slider
  - Running total display: "ADL Total: X / 24"
- [ ] Diagnosis input: searchable multi-select or free-text + add-button list
- [ ] Allergy section: text input + "Add Allergy" button → displayed as removable tags
- [ ] Vitals section: BP (systolic/diastolic), Heart Rate, Temperature, Weight (lbs/kg), Height
- [ ] Cognitive Status: Alert & Oriented | Confused | Lethargic | Unresponsive (radio group)
- [ ] Clinical notes free-text area
- [ ] "Save Assessment" primary button → triggers LOC calculation (M1-US-08)

---

### M1-US-08 — LOC Classification Result
**Primary Actor:** Nurse / DON
**Trigger:** After M1-US-06 assessment saved

Key elements to wireframe:
- [ ] Summary card: "ADL Score: [X] / 24"
- [ ] Suggested LOC badge (Level 1 | 2 | 3 | 4) with color coding
- [ ] Formula explanation line: "Based on ADL score of [X]: Level [Y]"
- [ ] "Confirm LOC" primary button
- [ ] "Override" secondary button → expands override panel:
  - Override Reason (required textarea, min 20 chars)
  - Confirm Override button
- [ ] Audit note: "Confirmed/Overridden by [Nurse Name] at [timestamp]" (visible after save)
- [ ] LOC daily rate preview: "$[rate]/day (from LOC Rate Table)"

**Notes:** Override must be logged for audit (NFR-02). Confirmed LOC triggers care plan creation flow (M2-US-01).

---

*Draft scaffold — Day 4 · Sprint 1 · To be completed with wireframe artifacts by 2026-06-30*
*Wireframe files (.fig / .png / .pdf) to be added in subsequent commits on this branch.*
