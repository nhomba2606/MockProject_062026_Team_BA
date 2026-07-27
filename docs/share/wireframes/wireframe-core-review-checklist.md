# NHMS MVP — Wireframe Core Review Checklist

---

## M1 — Intake & EHR `7 screens`

### M1-US-01 · Resident List
**Primary Actor:** Admission Staff / Nurse / DON · **Trigger:** Login → Home

- [ ] Page header: "Resident List" title + "Add New Resident" CTA button (top-right)
- [ ] Search bar: full-text by name, room number, resident ID
- [ ] Filter bar: Status tabs — All | Active | Discharged | Pending
- [ ] Data table/card list: Name, Room No., Status badge, DOB, Payer Source
- [ ] Empty state (no residents found)
- [ ] Pagination or infinite scroll
- [ ] Row click → navigates to M1-US-02

---

### M1-US-02 · Resident Profile — Detail
**Primary Actor:** All clinical actors · **Trigger:** Click resident from M1-US-01

- [ ] Resident header card: Full name, DOB, Room, Status badge
- [ ] DNR status indicator — prominent colored badge
- [ ] Tab navigation: Overview | Assessments | Care Plan | eMAR | LOC | Audit
- [ ] Overview tab: Demographics block (emergency contact, POA/guardian)
- [ ] Diagnosis list
- [ ] Allergy list (warning-color styling)
- [ ] Payer source label
- [ ] LOC level badge (Level 1–4)
- [ ] Action button group: Edit Profile | Report Incident | New Assessment

---

### M1-US-03 · Create / Edit Resident Profile
**Primary Actor:** Admission Staff · **Trigger:** "Add New Resident" button / Edit action in M1-US-02

- [ ] Form header: "New Resident" or "Edit Resident — [Name]" mode indicator
- [ ] Personal info: First Name, Last Name, DOB, Gender
- [ ] Emergency Contact section: Name, Phone, Relationship
- [ ] POA toggle + conditional field: POA Full Name
- [ ] DNR toggle: Yes / No (with visual emphasis when Yes)
- [ ] Payer Source dropdown: Medicare | Medicaid | Private Pay | Other
- [ ] Save (primary) | Cancel (secondary) buttons
- [ ] Inline validation error states

---

### M1-US-04 · Pre-Admission Screening
**Primary Actor:** Admission Staff · **Trigger:** "New Admission" button → step 1 of admission flow

- [ ] Step progress indicator (Step 1 of 3: Pre-Screen | Admission | Assessment)
- [ ] Clinical needs questionnaire (multi-checkbox list)
- [ ] "Special requirements" free-text area
- [ ] BR-06 compliance result banner: Pass (green) or Flag (amber/red)
- [ ] Pass state: "Proceed to Admission Form" CTA enabled
- [ ] Flag state: reason field + "Submit for Review" button
- [ ] Back button

---

### M1-US-05 · Admission Form
**Primary Actor:** Admission Staff · **Trigger:** Pass pre-admission screening

- [ ] Step progress indicator (Step 2 of 3)
- [ ] Resident name/DOB auto-populated (read-only header)
- [ ] Admission Date picker
- [ ] Room Assignment dropdown (available rooms only)
- [ ] Payer Source confirmation (pre-filled, editable)
- [ ] Signed Consents section: checklist of required documents
- [ ] "Confirm Admission" primary button (disabled until all required fields filled + consents checked)
- [ ] "Save Draft" secondary button

---

### M1-US-06 · Initial Assessment Form
**Primary Actor:** Nurse (RN) · **Trigger:** After admission confirmed

- [ ] Assessment header: Resident name, Room, Admission date
- [ ] ADL Scoring section: Bathing | Dressing | Eating | Mobility | Toileting | Continence (0–4 scale per row)
- [ ] ADL running total display: "ADL Total: X / 24"
- [ ] Diagnosis input: searchable multi-select or free-text + add-button list
- [ ] Allergy section: text input + "Add Allergy" → removable tags
- [ ] Vitals: BP, Heart Rate, Temperature, Weight, Height
- [ ] Cognitive Status: Alert & Oriented | Confused | Lethargic | Unresponsive
- [ ] Clinical notes free-text area
- [ ] "Save Assessment" button → triggers LOC calculation

---

### M1-US-08 · LOC Classification Result
**Primary Actor:** Nurse / DON · **Trigger:** After M1-US-06 saved

- [ ] Summary card: "ADL Score: [X] / 24"
- [ ] Suggested LOC badge (Level 1–4) with color coding
- [ ] Formula explanation: "Based on ADL score of [X]: Level [Y]"
- [ ] "Confirm LOC" primary button
- [ ] "Override" secondary button → expands: Override Reason textarea (required) + Confirm Override button
- [ ] Audit note: "Confirmed/Overridden by [Name] at [timestamp]"
- [ ] LOC daily rate preview: "$[rate]/day"

---

## M2 — Care Planning `4 screens`

### M2-US-01 · Care Plan — Create / Edit
**Primary Actor:** Nurse / DON · **Trigger:** After LOC confirmed or "Edit Care Plan" action

- [ ] Page header: "Create Care Plan" or "Edit Care Plan — [Resident Name]"
- [ ] Resident info bar: Name, Room, LOC Level, Admission Date (read-only strip)
- [ ] Goals section: "Add Goal" → description (free-text), target date, status (Active | Met | Discontinued), remove button
- [ ] Interventions section: "Add Intervention" → description (free-text), assigned role, frequency, remove button
- [ ] Care Tasks section: daily care tasks checkboxes
- [ ] "Save Care Plan" primary | "Save Draft" secondary | Cancel buttons
- [ ] Auto-save indicator

---

### M2-US-02 · Care Plan — Detail View
**Primary Actor:** Nurse / CNA / DON · **Trigger:** Resident Profile → "Care Plan" tab

- [ ] Care plan status banner: Active | Draft | Under Review
- [ ] Last updated timestamp + author name
- [ ] Next review date badge (90-day cycle, BR-03) + days-remaining counter
- [ ] Goals list: numbered, description + target date + status badge
- [ ] Interventions list: grouped by role (CNA | Nurse | DON)
- [ ] Active care tasks summary count
- [ ] "Edit Care Plan" button (role-gated: Nurse/DON only)
- [ ] "Trigger Reassessment" button (DON only)
- [ ] Print/Export button

---

### M2-US-05 · Daily Task List (CNA Dashboard)
**Primary Actor:** CNA · **Trigger:** Login → Home (primary landing for CNA)

- [ ] Dashboard header: "Today's Tasks — [Date]" + shift indicator
- [ ] Summary stats bar: Total | Completed | Pending | Overdue
- [ ] Task list grouped by Resident: resident name + room as group header, task cards with due time + status chip (Pending | Done | Overdue)
- [ ] Task type icons: Vitals | Bathing | Repositioning | Feeding | Medication-related
- [ ] Filter: All | Pending | Completed | Overdue
- [ ] Pull-to-refresh / Last synced timestamp
- [ ] Empty state (all tasks done)

---

### M2-US-06 · Task Completion Log
**Primary Actor:** CNA · **Trigger:** Tap a task from M2-US-05

- [ ] Task header: Task name, Resident name, Room, Due time
- [ ] Task instructions (read-only, from care plan)
- [ ] "Mark as Done" primary button (large, prominent)
- [ ] Notes / observation field (optional free-text)
- [ ] "Flag Abnormal Condition" toggle → reveals: description field (required) + Severity selector (Low | Medium | High | Critical) + "Send Alert to Nurse" button
- [ ] Timestamp auto-filled on save: "Completed at [HH:MM] by [CNA Name]"
- [ ] Back button (without saving)

---

## M3 — eMAR `5 screens`

### M3-US-01 · Medication Administration Dashboard
**Primary Actor:** Nurse (RN/LPN) · **Trigger:** Login → eMAR section (primary landing for Nurse)

- [ ] Dashboard header: "Medication Administration — [Date]" + shift indicator
- [ ] Summary stats: Pending | Completed | Overdue | Skipped
- [ ] Resident list with med-pass status: name + room, urgency color (Green=on time | Amber=due soon | Red=overdue), next med due time, "Start Med-Pass" CTA
- [ ] Filter: All | Due Now | Overdue | Completed
- [ ] Global Allergy Alert banner (if unacknowledged allergy flag exists)
- [ ] Shift handover note (optional free-text)

---

### M3-US-02 · Med-Pass — Barcode Scan
**Primary Actor:** Nurse · **Trigger:** "Start Med-Pass" from M3-US-01

- [ ] Resident header + persistent Allergy Alert banner (M3-US-07 component)
- [ ] Barcode scan viewport: camera preview + scan frame overlay
- [ ] Manual entry fallback: "Enter code manually" link → text input
- [ ] 5 Rights verification display (post-scan): Right Resident | Right Drug | Right Dose | Right Route | Right Time (Pass/Fail per right, time window ±30 min)
- [ ] All-Clear state: green checkmarks + "Administer" button
- [ ] Mismatch state: warning panel + "Override" button or "Cancel"
- [ ] "Mark as Refused" button
- [ ] "Mark as Missed" button

---

### M3-US-03 · Verification Override
**Primary Actor:** Nurse · **Trigger:** Barcode mismatch or out-of-window administration

- [ ] Modal/full-page: "Override Required" heading
- [ ] Alert summary: reason for override (mismatch detail or time exceeded)
- [ ] Override Reason dropdown: Barcode unreadable | Emergency administration | Time window exception | Patient unavailable | Other
- [ ] "Other" free-text field (conditional, required)
- [ ] Acknowledgment checkbox: "I confirm this override is clinically justified"
- [ ] "Confirm Override" primary button (disabled until reason + checkbox)
- [ ] "Cancel — Do Not Administer" secondary button
- [ ] Audit log info note

---

### M3-US-04 · Medication Administration Record (MAR)
**Primary Actor:** Nurse / DON · **Trigger:** Resident Profile → "eMAR" tab

- [ ] MAR header: Resident name, Room, date range filter
- [ ] Date range filter: Today | This Week | This Month
- [ ] Medication rows × Day columns grid: cell status indicators (Given ✓ | Missed ✗ | Refused — | Override △)
- [ ] Cell tooltip on hover: administered by, timestamp, notes, override reason
- [ ] Legend bar: color/icon key
- [ ] Filter: All | Given | Missed | Refused | Override
- [ ] "Print MAR" button

---

### M3-US-06 · Medication Order List
**Primary Actor:** Nurse / DON · **Trigger:** Resident Profile → "Medications" tab

- [ ] Page header: "Active Medication Orders — [Resident Name]"
- [ ] Active Orders / Discontinued tabs
- [ ] Order table: Drug Name, Dose + Unit, Route, Frequency, Start Date, Prescriber, Status badge
- [ ] Allergy conflict warning icon (if drug conflicts with known allergy)
- [ ] Search/filter by drug name
- [ ] Row click → expandable detail panel: full prescription notes + last administered timestamp

---

## M7 — Incident & Risk `3 screens`

### M7-US-01 · Report New Incident
**Primary Actor:** Nurse / CNA / DON · **Trigger:** "Report Incident" global button (accessible from any screen)

- [ ] Modal or dedicated page: "Report New Incident" heading
- [ ] Incident Type selector: Fall | Medication Error | Skin Integrity | Behavioral | Elopement | Other
- [ ] Resident selector: searchable dropdown (name + room)
- [ ] Date & Time of Incident: picker (defaults to now)
- [ ] Severity Level: Low | Medium | High | Critical (radio/segmented with color cues)
- [ ] Incident Description: required textarea (min 50 chars guidance)
- [ ] Witness field (optional)
- [ ] "Submit Report" primary button
- [ ] Post-submit feedback: "Incident Reported — Chart will be locked" toast/banner

---

### M7-US-02 · Incident — Chart Lock Confirmation
**Primary Actor:** Nurse / DON · **Trigger:** Auto-triggered after incident saved (BR-07)

- [ ] Blocking modal/overlay (cannot dismiss without confirming)
- [ ] Lock icon + "Chart Locked" heading
- [ ] Resident name + room
- [ ] Lock timestamp: "Chart locked at [HH:MM:SS] on [Date]"
- [ ] Incident type label
- [ ] Info text: "Chart is read-only. DON review required before unlock."
- [ ] SLA countdown preview: "Report within [24h/48h] — [X hours remaining]"
- [ ] "Acknowledge & Continue" required primary button
- [ ] Audit acknowledgment note

---

### M7-US-04 · Incident List
**Primary Actor:** DON · **Trigger:** "Incidents" navigation section

- [ ] Page header: "Incidents" + "Report New Incident" button
- [ ] Summary stats: Total Open | Overdue SLA | Pending Review | Resolved this month
- [ ] Incident table: ID, Resident + Room, Type badge, Severity badge (color-coded), Reported By + At, Status badge, SLA Timer widget
- [ ] Filter: Status | Severity | Date Range | Type
- [ ] Search by resident name or incident ID
- [ ] Row click → Incident Detail & Timeline (M7-US-03)
- [ ] SLA overdue row highlight (red when deadline passed)

---

## Admin `8 screens`

### AD-01 · User List
**Primary Actor:** System Administrator · **Trigger:** Admin → "Users" section

- [ ] Page header: "User Management" + "Add New User" button
- [ ] Summary chips: Total | Active | Inactive
- [ ] User table: Full Name, Email, Role badge, Status badge, Last Login, Actions menu (Edit | Deactivate/Reactivate | Reset Password)
- [ ] Search by name or email
- [ ] Filter: Role | Status
- [ ] Bulk action bar (rows selected): Deactivate Selected

---

### AD-02 · Create / Edit User
**Primary Actor:** System Administrator · **Trigger:** "Add New User" or "Edit" from AD-01

- [ ] Form header: "New User" or "Edit User — [Full Name]"
- [ ] Personal Info: First Name, Last Name, Email (required, unique validation)
- [ ] Role Assignment dropdown: CNA | Nurse (RN) | Nurse (LPN) | DON | Admission Staff | System Admin + role description helper text
- [ ] Account Status toggle (edit mode only)
- [ ] Temporary Password section (create mode): auto-generate toggle, manual field, "Send welcome email" checkbox
- [ ] Save primary | Cancel secondary
- [ ] Validation error states

---

### AD-05 · Facility Settings
**Primary Actor:** System Administrator · **Trigger:** Admin → "Facility" section

- [ ] Page header: "Facility Settings"
- [ ] General Info: Facility Name, Facility ID (read-only), Address, Target State (California default), Phone
- [ ] Operational Settings: Timezone selector, Fiscal Year Start, Bed Capacity
- [ ] Branding (optional): logo upload, primary color picker
- [ ] "Save Settings" button
- [ ] "Last saved by [Admin] at [timestamp]" footer note

---

### AD-06 · LOC Rate Table
**Primary Actor:** System Administrator · **Trigger:** Admin → "LOC Rates" section

- [ ] Page header: "Level of Care Rate Table" + "Add Level" button
- [ ] Rate table: LOC Level (1–4 with color badges), Description, Daily Rate ($/day, inline editable), Effective Date, Actions
- [ ] "Add Level" modal: Level number, description, daily rate, effective date
- [ ] Delete guard (if level assigned to residents)
- [ ] "Seed Default Values" button
- [ ] Last updated timestamp per row

---

### AD-07 · Staffing Ratio Configuration
**Primary Actor:** System Administrator · **Trigger:** Admin → "Compliance Config" section

- [ ] Page header: "Staffing Ratio Configuration"
- [ ] Regulatory banner: "California: minimum 3.5 hrs/resident/day (BR-01)"
- [ ] Config form: minimum hrs/resident/day input, shift breakdown (Day | Evening | Night), weekend override toggle
- [ ] Alert Threshold: warn-below percentage input, notification recipients multi-select
- [ ] "Save Configuration" button
- [ ] Version history accordion: previous configs (date, value, changed by)

---

### AD-08 · Incident Severity Levels
**Primary Actor:** System Administrator · **Trigger:** Admin → "Incident Config" section

- [ ] Page header: "Incident Severity Level Configuration"
- [ ] Severity table: Name (inline editable), Color indicator, Description, Chart Lock Trigger toggle, Actions
- [ ] "Add Severity Level" button
- [ ] Color picker per level
- [ ] Delete guard (if used in existing incidents)
- [ ] Reset to Defaults button (+ confirmation dialog)
- [ ] Preview: how badges render in M7-US-01 / M7-US-04

---

### AD-09 · SLA Configuration
**Primary Actor:** System Administrator · **Trigger:** Admin → "SLA Config" section

- [ ] Page header: "Incident Reporting SLA Configuration"
- [ ] Regulatory banner: NFR-06 context
- [ ] SLA rules table: Severity | SLA Window (hrs, editable) | Escalation at (% of SLA) | Notification Target
- [ ] Default values: Critical/High → 24h | Medium → 48h | Low → 72h
- [ ] Escalation threshold slider + notification recipients
- [ ] "Save SLA Rules" button
- [ ] "Effective from" date picker
- [ ] Warning if SLA < regulatory minimum

---

### AD-10 · Demo Data Seeder
**Primary Actor:** System Administrator · **Trigger:** Admin → "Dev Tools" section

- [ ] Page header: "Demo Data Seeder" + "Development / Demo Use Only" warning badge
- [ ] Warning banner (destructive action notice)
- [ ] Seed package selector: Residents | Medications | Incidents | Users | Care Plans | All
- [ ] Options: "Clear existing demo data first" toggle, date offset field
- [ ] "Seed Selected Data" primary button (disabled until package selected)
- [ ] Progress feedback: loading bar + per-category status messages
- [ ] Results summary: records created per category
- [ ] "Clear All Demo Data" danger button + confirmation dialog

---

## Tổng kết

| Module | Screens | Reviewed |
|---|---|---|
| M1 — Intake & EHR | 7 | 0 |
| M2 — Care Planning | 4 | 0 |
| M3 — eMAR | 5 | 0 |
| M7 — Incident & Risk | 3 | 0 |
| Admin | 8 | 0 |
| **Total** | **27** | **0** |

---

*Draft files per member: `docs/<login>/day4/wireframe-*-draft.md` · Issues: #49 – #53 · Sprint 1*
