# Wireframe Draft — M7 Incident & Admin Core Screens
> Author: To Duy Bac · Day 4 · Sprint 1 · Deadline: 2026-06-30
> Issue: #52 · Branch: docs/s1/duybac210-wireframe-m7-admin-core

## Assigned Screens (5)

| Screen ID | Screen Name |
|---|---|
| M7-US-02 | Incident — Chart Lock Confirmation |
| M7-US-04 | Incident List |
| AD-01 | User List |
| AD-02 | Create / Edit User |
| AD-05 | Facility Settings |

---

## Wireframe Checklist & Key Elements

### M7-US-02 — Incident — Chart Lock Confirmation
**Primary Actor:** Nurse / DON
**Trigger:** Auto-triggered immediately after incident saved in M7-US-01 (BR-07)

Key elements to wireframe:
- [ ] Full-page or modal overlay (blocking — cannot dismiss without confirming)
- [ ] Lock icon + heading: "Chart Locked"
- [ ] Resident name + room number
- [ ] Lock timestamp: "Chart locked at [HH:MM:SS] on [Date]" (auto-generated)
- [ ] Incident type label
- [ ] Informational text: "This resident's chart is now read-only. A DON review is required before unlock."
- [ ] SLA countdown preview: "Incident must be reported within [24h / 48h] — [X hours remaining]" (per AD-09 config)
- [ ] "Acknowledge & Continue" primary button (required to proceed)
- [ ] Audit note: "Acknowledgment logged with your credentials"

**Notes:** Chart lock is automatic and mandatory (BR-07); the confirmation screen is the gate that forces awareness. Unlock requires DON action (M7-US-07 — secondary screen).

---

### M7-US-04 — Incident List
**Primary Actor:** DON
**Trigger:** "Incidents" navigation section

Key elements to wireframe:
- [ ] Page header: "Incidents" + "Report New Incident" button (top-right)
- [ ] Summary stats row: Total Open | Overdue SLA | Pending Review | Resolved this month
- [ ] Incident table: columns →
  - Incident ID (auto-generated)
  - Resident Name + Room
  - Incident Type badge
  - Severity badge (color-coded: Low=grey | Medium=blue | High=orange | Critical=red)
  - Reported By + Reported At
  - Status badge: Open | Under Review | Resolved | Reported to Authority
  - SLA Timer widget (M7-US-05 component): countdown for open incidents
- [ ] Filter bar: Status | Severity | Date Range | Incident Type
- [ ] Search by resident name or incident ID
- [ ] Row click → Incident Detail & Timeline (M7-US-03, secondary screen)
- [ ] SLA overdue visual: row highlighted in red if SLA deadline passed

**Notes:** SLA timer (M7-US-05) is an embedded widget in each open incident row — shows countdown 24h/48h (NFR-06). Color alert when <2h remaining.

---

### AD-01 — User List
**Primary Actor:** System Administrator
**Trigger:** Admin → "Users" section

Key elements to wireframe:
- [ ] Page header: "User Management" + "Add New User" button
- [ ] Summary chips: Total Users | Active | Inactive
- [ ] User table: columns →
  - Full Name
  - Email
  - Role badge (CNA | Nurse/RN | Nurse/LPN | DON | Admission Staff | Admin)
  - Status badge: Active | Inactive
  - Last Login timestamp
  - Actions menu (3-dot): Edit | Deactivate / Reactivate | Reset Password
- [ ] Search bar: by name or email
- [ ] Filter: Role | Status
- [ ] Bulk action bar (appears when rows selected): Deactivate Selected

**Notes:** Soft-delete only — deactivated accounts retain history. Role display should clearly distinguish clinical roles (CNA/Nurse/DON) from admin.

---

### AD-02 — Create / Edit User
**Primary Actor:** System Administrator
**Trigger:** "Add New User" button or "Edit" from AD-01 actions menu

Key elements to wireframe:
- [ ] Form header: "New User" or "Edit User — [Full Name]"
- [ ] Personal Information section:
  - First Name (required)
  - Last Name (required)
  - Email Address (required, unique — validation on blur)
- [ ] Role Assignment section:
  - Role dropdown: CNA | Nurse (RN) | Nurse (LPN) | DON | Admission Staff | System Admin
  - Role description helper text below dropdown (explains permissions)
- [ ] Account Status toggle: Active | Inactive (hidden for new user — defaults Active)
- [ ] Temporary Password section (create mode only):
  - Auto-generate password toggle
  - Manual password field (shown if auto-generate off)
  - "Send welcome email" checkbox
- [ ] Form action buttons: Save (primary) | Cancel (secondary)
- [ ] Validation error states: email already in use, required fields empty

---

### AD-05 — Facility Settings
**Primary Actor:** System Administrator
**Trigger:** Admin → "Facility" section

Key elements to wireframe:
- [ ] Page header: "Facility Settings"
- [ ] General Information section:
  - Facility Name (text input)
  - Facility ID (read-only, system-generated)
  - Address fields: Street, City, State dropdown, ZIP
  - Target State dropdown: California (default for MVP compliance rules)
  - Phone Number
- [ ] Operational Settings section:
  - Timezone selector (dropdown, e.g., America/Los_Angeles)
  - Fiscal Year Start (month selector)
  - Bed Capacity (number input)
- [ ] Branding section (optional):
  - Facility logo upload (image upload field, max 2MB)
  - Primary color picker (for demo theming)
- [ ] "Save Settings" primary button
- [ ] "Last saved by [Admin] at [timestamp]" footer note

**Notes:** Facility ID is immutable; target state (California) determines compliance rule set (BR-01: 3.5 hrs/resident/day staffing ratio).

---

*Draft scaffold — Day 4 · Sprint 1 · To be completed with wireframe artifacts by 2026-06-30*
*Wireframe files (.fig / .png / .pdf) to be added in subsequent commits on this branch.*
