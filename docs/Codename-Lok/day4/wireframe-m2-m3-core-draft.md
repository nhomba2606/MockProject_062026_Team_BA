# Wireframe Draft — M2 Care Planning & M3 eMAR Core Screens
> Author: Phan Thanh Loc · Day 4 · Sprint 1 · Deadline: 2026-06-30
> Issue: #50 · Branch: docs/s1/Codename-Lok-wireframe-m2-m3-core

## Assigned Screens (5)

| Screen ID | Screen Name |
|---|---|
| M2-US-01 | Care Plan — Create / Edit |
| M2-US-02 | Care Plan — Detail View |
| M2-US-05 | Daily Task List (CNA Dashboard) |
| M2-US-06 | Task Completion Log |
| M3-US-01 | Medication Administration Dashboard |

---

## Wireframe Checklist & Key Elements

### M2-US-01 — Care Plan — Create / Edit
**Primary Actor:** Nurse / DON
**Trigger:** After LOC confirmed (from M1-US-08) or "Edit Care Plan" action

Key elements to wireframe:
- [ ] Page header: "Create Care Plan" or "Edit Care Plan — [Resident Name]"
- [ ] Resident info bar: Name, Room, LOC Level, Admission Date (read-only strip)
- [ ] Goals section: "Add Goal" button → each goal entry has:
  - Goal description (free-text)
  - Target date picker
  - Status dropdown: Active | Met | Discontinued
  - Remove button
- [ ] Interventions section: "Add Intervention" button → each intervention has:
  - Intervention description (free-text)
  - Assigned role dropdown: CNA | Nurse | DON
  - Frequency dropdown: Daily | Weekly | PRN | As Ordered
  - Remove button
- [ ] Care Tasks section: assign daily care tasks (checkboxes from task library)
- [ ] "Save Care Plan" primary button | "Save Draft" secondary button | Cancel
- [ ] Auto-save indicator

**Notes:** Goals and interventions are free-text in MVP (no pre-built library).

---

### M2-US-02 — Care Plan — Detail View
**Primary Actor:** Nurse / CNA / DON
**Trigger:** Resident Profile → "Care Plan" tab

Key elements to wireframe:
- [ ] Care plan status banner: Active | Draft | Under Review
- [ ] Last updated timestamp + author name
- [ ] Next review date badge (90-day cycle per BR-03) with days-remaining counter
- [ ] Goals list: numbered, each showing description + target date + status badge
- [ ] Interventions list: grouped by responsible role (CNA | Nurse | DON)
- [ ] Active care tasks summary: count of tasks per day
- [ ] "Edit Care Plan" button (Nurse/DON only, role-gated)
- [ ] "Trigger Reassessment" button (DON only)
- [ ] Print/Export button

---

### M2-US-05 — Daily Task List (CNA Dashboard)
**Primary Actor:** CNA
**Trigger:** Login → Home (primary landing screen for CNA role)

Key elements to wireframe:
- [ ] Dashboard header: "Today's Tasks — [Date]" + shift indicator (Day/Evening/Night)
- [ ] Summary stats bar: Total tasks | Completed | Pending | Overdue
- [ ] Task list grouped by Resident:
  - Resident name + room number as group header
  - Task cards per resident: task name, due time, status chip (Pending/Done/Overdue)
  - Tap/click → opens M2-US-06 Task Completion Log
- [ ] Filter bar: All | Pending | Completed | Overdue
- [ ] Task type icons: Vitals | Bathing | Repositioning | Feeding | Medication-related
- [ ] Pull-to-refresh / Last synced timestamp
- [ ] Empty state (all tasks completed — celebration state)

**Notes:** This is the primary daily workflow screen for CNAs. Prioritize usability and clarity.

---

### M2-US-06 — Task Completion Log
**Primary Actor:** CNA
**Trigger:** Tap a task from M2-US-05

Key elements to wireframe:
- [ ] Task detail header: Task name, Resident name, Room, Due time
- [ ] Task instructions / description (from care plan intervention, read-only)
- [ ] Completion action: large "Mark as Done" button (primary, prominent)
- [ ] Notes / observation field: optional free-text ("Any notes?")
- [ ] "Flag Abnormal Condition" toggle:
  - When toggled ON: reveals Abnormal Condition description field (required) + Severity level selector (Low | Medium | High | Critical)
  - "Send Alert to Nurse" button appears
- [ ] Timestamp auto-filled on save: "Completed at [HH:MM] by [CNA Name]"
- [ ] Back button (return to M2-US-05 without saving)

**Notes:** Flagging abnormal condition sends alert to Nurse/DON (M2-US-07 is the alert on their end).

---

### M3-US-01 — Medication Administration Dashboard
**Primary Actor:** Nurse (RN/LPN)
**Trigger:** Login → eMAR section (primary landing for Nurse role)

Key elements to wireframe:
- [ ] Dashboard header: "Medication Administration — [Date]" + shift indicator
- [ ] Summary stats row: Pending med-passes | Completed | Overdue | Skipped
- [ ] Resident list with med-pass status:
  - Resident name + room number
  - Urgency color coding: Green (on time) | Amber (due soon, <30 min) | Red (overdue)
  - Next med due time label
  - "Start Med-Pass" CTA button per resident
- [ ] Filter: All | Due Now | Overdue | Completed
- [ ] Global "Allergy Alert" banner if any resident has unacknowledged allergy flag
- [ ] Shift handover note (optional free-text at top)

**Notes:** Color-coded urgency is a key UX requirement. Links to M3-US-02 (Barcode Scan) per resident.

---

*Draft scaffold — Day 4 · Sprint 1 · To be completed with wireframe artifacts by 2026-06-30*
*Wireframe files (.fig / .png / .pdf) to be added in subsequent commits on this branch.*
