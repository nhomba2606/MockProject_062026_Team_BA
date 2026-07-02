# Nursing Home Management System - End-to-End Screen Workflows

## Module 1: Intake & Electronic Health Records (EHR)

### 1. Pre-Admission Screening (M1-US-04)
* **Primary Actor:** Admission Staff
* **Trigger:** User clicks "New Admission" from the home screen or Resident List.
* **End-to-End Flow & Decision Points:**
    1.  Admission Staff initiates step 1 of the 3-step admission flow (Pre-Screen -> Admission -> Assessment).
    2.  Staff fills out the clinical needs questionnaire (e.g., checking necessary support levels for ADLs, psychiatric history).
    3.  **Decision Point (BR-06 Compliance):** The system evaluates the inputs against the facility's licensed capabilities.
        * *Pass:* The system displays a green banner and enables the "Proceed to Admission Form" CTA.
        * *Flag:* If the applicant requires care beyond the facility's scope (e.g., severe behavioral risks in a standard Assisted Living facility), the system displays an amber/red banner.
* **Data Inputs:** Clinical needs checkboxes, "Special requirements" free-text.
* **Data Outputs:** BR-06 Compliance Result (Pass/Flag state).
* **Edge Cases:** The applicant is flagged but the facility has a special waiver; the user must input a reason and click "Submit for Review" rather than proceeding directly.

### 2. Admission Form (M1-US-05)
* **Primary Actor:** Admission Staff
* **Trigger:** Successful completion of M1-US-04 (Pre-Admission Screening).
* **End-to-End Flow & Decision Points:**
    1.  Basic demographic data is auto-populated from the pre-screen phase.
    2.  Staff selects an Admission Date and assigns a room from the dropdown of currently available rooms only.
    3.  Staff confirms the Payer Source (Medicare, Medicaid, Private Pay, etc.).
    4.  Staff verifies that all required legal consents (POA, DNR, Financial agreements) are signed using a checklist.
    5.  **Decision Point:** "Confirm Admission" is disabled until all mandatory fields and consent checkboxes are completed.
* **Data Inputs:** Admission Date, Room Assignment, Signed Consents checklist.
* **Data Outputs:** Resident record created in "Active" or "Pending" status.
* **Edge Cases:** Selected room becomes unavailable during form completion; user attempts to submit without mandatory POA documentation.

### 3. Initial Assessment Form (M1-US-06)
* **Primary Actor:** Nurse (RN)
* **Trigger:** Admission is confirmed (M1-US-05 completed), usually within the first 14 days of arrival.
* **End-to-End Flow & Decision Points:**
    1.  Nurse accesses the assessment form containing sections for ADLs, Diagnoses, Allergies, Vitals, and Cognitive Status.
    2.  Nurse evaluates ADLs (Bathing, Dressing, Eating, Mobility, Toileting, Continence) on a 0-4 scale. The system calculates a running total (e.g., ADL Total: X / 24).
    3.  Nurse inputs Vitals and Cognitive status (Alert, Confused, Lethargic, etc.).
    4.  Nurse saves the assessment, triggering the automatic Level of Care (LOC) calculation.
* **Data Inputs:** ADL scores, Vitals, Cognitive status, clinical notes, diagnosis, allergies.
* **Data Outputs:** Completed Assessment Record, ADL Total Score.
* **Edge Cases:** Resident refuses assessment; partial assessment saved as draft.

### 4. LOC Classification Result (M1-US-08)
* **Primary Actors:** Nurse, Director of Nursing (DON)
* **Trigger:** M1-US-06 (Initial Assessment) is saved.
* **End-to-End Flow & Decision Points:**
    1.  System displays a summary card with the ADL Score and the algorithmic Suggested LOC (Level 1-4) with an explanation formula.
    2.  It previews the daily billing rate associated with this LOC.
    3.  **Decision Point:**
        * *Confirm:* DON accepts the suggested LOC.
        * *Override:* DON clicks override, which mandates entering an Override Reason in a textarea.
    4.  System logs the final decision with an audit note (Confirmed/Overridden by [Name] at [timestamp]).
* **Data Inputs:** Override reason (if applicable).
* **Data Outputs:** Confirmed LOC Level, Daily Rate assignment, Audit Log entry.
* **Edge Cases:** Algorithmic calculation places the resident on the boundary of two tiers; DON must use clinical judgment to override.

---

## Module 2: Care Planning & Daily Tasks

### 1. Care Plan — Create / Edit (M2-US-01)
* **Primary Actors:** Nurse, DON
* **Trigger:** LOC is confirmed, or a 90-day periodic review triggers an "Edit Care Plan" action.
* **End-to-End Flow & Decision Points:**
    1.  Nurse defines clinical "Goals" with target dates and statuses (Active, Met, Discontinued).
    2.  Nurse sets "Interventions" assigned to specific roles (e.g., CNA, PT) and frequency.
    3.  Nurse checks specific daily "Care Tasks" to be pushed to CNA dashboards.
    4.  System auto-saves periodically. Nurse finalizes by clicking "Save Care Plan".
* **Data Inputs:** Goals, Interventions, Care Tasks selection.
* **Data Outputs:** Active Care Plan, automated injection of tasks into Module 4 (Scheduling) and Module 2 (CNA Dashboard).
* **Edge Cases:** Interventions contradict physician orders; user navigates away before saving (handled by auto-save).

### 2. Daily Task List - CNA Dashboard (M2-US-05) & Task Completion (M2-US-06)
* **Primary Actor:** Certified Nursing Assistant (CNA)
* **Trigger:** CNA logs into the system at the start of their shift.
* **End-to-End Flow & Decision Points:**
    1.  CNA views M2-US-05, seeing a grouped list of residents and their pending tasks (color-coded: Pending, Done, Overdue).
    2.  CNA clicks a task to open M2-US-06 (Task Completion Log).
    3.  CNA reads instructions and clicks "Mark as Done".
    4.  **Decision Point (Abnormal Condition):** If the CNA notices an issue (e.g., skin redness during bathing), they toggle "Flag Abnormal Condition".
    5.  This reveals required fields for description, severity (Low, Medium, High, Critical), and a "Send Alert to Nurse" button.
* **Data Inputs:** Task status, observation notes, abnormal condition severity.
* **Data Outputs:** Completed task timestamp, immediate alert routed to floor Nurse (if flagged).
* **Edge Cases:** CNA mistakenly marks a task as done (requires supervisor override to undo); network offline (requires offline-sync capability).

---

## Module 3: Electronic Medication Administration Record (eMAR)

### 1. Med-Pass Barcode Scan (M3-US-02) & Verification Override (M3-US-03)
* **Primary Actor:** Nurse (RN/LPN)
* **Trigger:** Nurse clicks "Start Med-Pass" from the eMAR Dashboard for a specific resident.
* **End-to-End Flow & Decision Points:**
    1.  Nurse opens the scanner. A persistent Allergy Alert banner is visible if applicable.
    2.  Nurse scans the resident's wristband barcode and the medication packaging barcode.
    3.  System cross-references the "5 Rights": Right Resident, Right Drug, Right Dose, Right Route, Right Time (within a +/- 30 min window).
    4.  **Decision Point (Verification Result):**
        * *All-Clear:* Green checkmarks appear; Nurse clicks "Administer".
        * *Mismatch / Out of Window:* System displays a warning and blocks standard administration, triggering M3-US-03 (Verification Override).
    5.  If overridden, Nurse must select a reason (Barcode unreadable, Emergency, Patient unavailable, etc.) and check a clinical justification acknowledgment box before confirming.
* **Data Inputs:** Barcode scans (or manual entry), Override reason, Justification checkbox, "Refused" or "Missed" toggles.
* **Data Outputs:** Administration timestamp, updated MAR grid, pharmacy inventory decrement.
* **Edge Cases:** Barcode is smudged (fallback to manual entry); resident violently refuses medication; drug administered in an emergency before scanning (requires post-administration override).

---

## Module 7: Incident & Risk Management

### 1. Report New Incident (M7-US-01) & Chart Lock Confirmation (M7-US-02)
* **Primary Actors:** Nurse, CNA, DON
* **Trigger:** An adverse event occurs (Fall, Med Error, Elopement, Skin Integrity issue).
* **End-to-End Flow & Decision Points:**
    1.  Staff clicks the global "Report Incident" button.
    2.  Staff selects Incident Type, Resident, Date/Time, Severity Level, and types a detailed description (minimum 50 chars).
    3.  Staff submits the report.
    4.  **System Automation (BR-07):** The system immediately fires M7-US-02, a blocking modal indicating "Chart Locked". This prevents any retrospective editing of the resident's EHR to preserve data integrity for state surveyors.
    5.  The modal displays a countdown SLA timer (e.g., 24h or 48h based on severity) for when the DON must submit the official report to the state.
    6.  User must click "Acknowledge & Continue" to dismiss the modal.
* **Data Inputs:** Incident categorization, Severity, Narrative description, Witnesses.
* **Data Outputs:** Locked EHR Chart (read-only state), Incident Log record, SLA timer initialization.
* **Edge Cases:** User tries to dismiss the lock notification without acknowledging; incident involves multiple residents (requires separate reports).

---

## Module Admin: System Configuration

### 1. SLA Configuration (AD-09)
* **Primary Actor:** System Administrator
* **Trigger:** Need to update incident reporting deadlines based on new state regulations (NFR-06).
* **End-to-End Flow & Decision Points:**
    1.  Admin accesses the SLA Config screen, which displays a regulatory compliance banner.
    2.  Admin adjusts the SLA window hours for different severities (Critical, High, Medium, Low).
    3.  Admin sets an Escalation Threshold (e.g., send warning at 80% of SLA time consumed) and assigns notification targets (e.g., DON, Facility Administrator).
    4.  Admin sets an "Effective From" date and saves.
* **Data Inputs:** SLA hours, Escalation percentage, Target roles.
* **Data Outputs:** Updated global background timer rules for Module 7.
* **Edge Cases:** Admin attempts to set an SLA window *higher* than the legal maximum allowed by state law (system should throw a validation warning).

### 2. Demo Data Seeder (AD-10)
* **Primary Actor:** System Administrator (Dev/Demo environments only)
* **Trigger:** Need to populate the system for investor demos or QA testing.
* **End-to-End Flow:** Admin selects a data package (Residents, Meds, Incidents), chooses whether to clear existing data, and clicks "Seed". System shows a loading bar and outputs a results summary.
* **Edge Cases:** Seeding over an environment that has real PHI (Protected Health Information). This tool must be strictly disabled/removed in Production builds.
