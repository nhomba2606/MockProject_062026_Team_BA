# User Stories: M1 - Intake & EHR Module

### M1-US-01 Resident list -- User Story:
As an Admission Staff member, Nurse, or DON, I want to view, search, and filter a list of all residents, so that I can quickly find a specific resident and check their current admission status.
**Acceptance Criteria:**
* **Given** the user is on the Home/Resident List screen, **When** the screen loads, **Then** the system displays a paginated list of residents including Name, Room No., Status, DOB, and Payer Source.
* **Given** the user is on the Resident List, **When** the user enters a valid name or room number in the search bar, **Then** the system filters the list to show only matching residents.
* **Given** the user is on the Resident List, **When** the user clicks the "Pending" status filter tab, **Then** the system updates the list to show only residents awaiting admission confirmation.
* **Given** the user is on the Resident List with filters applied, **When** no residents match the criteria, **Then** the system displays an empty state message (e.g., "No residents found").

### M1-US-02 Resident profile detail -- User Story:
As a clinical staff member, I want to view a resident's comprehensive profile including demographics, DNR status, and medical alerts, so that I can make informed and safe care decisions.
**Acceptance Criteria:**
* **Given** the user is on the Resident List (M1-US-01), **When** the user clicks on a resident's row, **Then** the system navigates to M1-US-02 and displays the resident's header card and Overview tab.
* **Given** the resident has an active Do Not Resuscitate (DNR) order, **When** the profile loads, **Then** the system displays a prominent red DNR status badge in the header.
* **Given** the user is viewing the Resident Profile, **When** the user clicks the "Care Plan" or "eMAR" tab, **Then** the system switches the view to the respective clinical module data for that resident.

### M1-US-03 Create/edit resident -- User Story:
As an Admission Staff member, I want to input or update a resident's personal, emergency, and legal information (POA/DNR), so that the facility maintains accurate, compliant records.
**Acceptance Criteria:**
* **Given** the user is on the Create/Edit Resident form, **When** the user fills in all required fields and clicks "Save", **Then** the system saves the profile and navigates back to the Resident Profile Detail screen.
* **Given** the user is on the Create/Edit Resident form, **When** the user toggles "POA" to "Yes", **Then** the system displays a mandatory "POA Full Name" input field.
* **Given** the user is on the Create/Edit Resident form, **When** the user attempts to save with empty required fields (e.g., Last Name, DOB), **Then** the system highlights the missing fields and displays an inline validation error message.
* **Given** the user is creating a new resident, **When** the entered First and Last Name match an existing active resident, **Then** the system displays a "Duplicate name" warning banner before allowing the save.

### M1-US-04 Pre-admission screening -- User Story:
As an Admission Staff member, I want to complete a clinical needs questionnaire for a prospective resident, so that the system can automatically verify if our facility is legally equipped to admit them (BR-06 compliance).
**Acceptance Criteria:**
* **Given** the user has completed the clinical needs questionnaire, **When** the capabilities match the facility's license (Pass), **Then** the system displays a green success banner and enables the "Proceed to Admission Form" button.
* **Given** the user has completed the clinical needs questionnaire, **When** the applicant's needs exceed the facility's licensed capabilities (Flag), **Then** the system displays an amber/red warning banner and blocks direct admission.
* **Given** the screening is flagged, **When** the user wishes to request an exception, **Then** the system requires the user to input a reason in the "Flag for Clinical Review" field and click "Submit for Review".

### M1-US-05 Admission form -- User Story:
As an Admission Staff member, I want to assign a room, confirm payment source, and verify signed legal consents, so that I can officially admit a screened resident into the facility.
**Acceptance Criteria:**
* **Given** the user is on the Admission Form, **When** the user clicks the "Room Assignment" dropdown, **Then** the system displays only the rooms that are currently available and unoccupied.
* **Given** the user is filling out the Admission Form, **When** one or more mandatory consent checkboxes (e.g., Admission Agreement) are left unchecked, **Then** the "Confirm Admission" button remains disabled.
* **Given** all required fields and consent checklists are completed, **When** the user clicks "Confirm Admission", **Then** the system changes the resident's status to "Active" and navigates to the Resident Profile.

### M1-US-06 Initial assessment -- User Story:
As a Registered Nurse (RN), I want to score the resident's Activities of Daily Living (ADLs) and record vitals, so that the system can accurately calculate their required Level of Care (LOC).
**Acceptance Criteria:**
* **Given** the RN is on the Initial Assessment Form, **When** they select scores (0-4) for various ADL categories, **Then** the system dynamically updates the "ADL Total" display in real-time.
* **Given** the RN is filling out the form, **When** they type an allergy and click "Add Allergy", **Then** the system displays the allergy as a visually distinct, removable tag.
* **Given** the assessment form is completely filled, **When** the RN clicks "Save Assessment", **Then** the system saves the clinical data and automatically navigates to the LOC Classification Result screen (M1-US-08).

### M1-US-07 Assessment history -- User Story:
As a Nurse or DON, I want to view a chronological list of a resident's past clinical assessments, so that I can track changes in their health and dependency levels over time.
**Acceptance Criteria:**
* **Given** the user is on the "Assessments" tab of the Resident Profile, **When** the screen loads, **Then** the system displays a list of all past assessments sorted by date (newest first).
* **Given** the user is viewing the Assessment history, **When** the user clicks on a specific historical assessment record, **Then** the system opens a read-only view of that assessment's details (ADL scores, vitals, notes).
* **Given** a newly admitted resident has no prior assessments, **When** the user navigates to the Assessments tab, **Then** the system displays a "No previous assessments found" empty state message.

### M1-US-08 LOC classification -- User Story:
As a Director of Nursing (DON), I want to review, confirm, or override the system-suggested Level of Care (LOC) and its associated daily rate, so that the resident receives appropriate care and accurate billing.
**Acceptance Criteria:**
* **Given** the user is on the LOC Classification Result screen, **When** the user agrees with the algorithm, **Then** clicking "Confirm LOC" finalizes the level, logs the timestamp, and assigns the daily billing rate.
* **Given** the DON clicks the "Override" secondary button, **When** the override panel expands, **Then** a mandatory "Override Reason" textarea is displayed.
* **Given** the DON attempts to confirm an override, **When** the "Override Reason" field is empty or contains fewer than 20 characters, **Then** the system blocks the submission and displays a validation error.
* **Given** an override is successfully submitted, **When** the record is saved, **Then** the system logs an audit note stating "Overridden by [DON Name] at [timestamp]" visible on the profile.

### M1-US-09 LOC history -- User Story:
As a DON or Billing Administrator, I want to view the history of LOC changes and overrides for a resident, so that I can audit rate adjustments and ensure regulatory compliance.
**Acceptance Criteria:**
* **Given** the user is on the "LOC" tab of the Resident Profile, **When** the page loads, **Then** the system displays a table of historical LOC levels including Start Date, End Date, Daily Rate, and the user who authorized it.
* **Given** a historical LOC record was the result of a manual override, **When** the user views the LOC history table, **Then** the system displays an indicator (e.g., an icon or badge) and allows the user to click to read the specific override reason.
* **Given** the user is viewing the LOC history, **When** the user clicks the "Print/Export" button, **Then** the system generates a downloadable PDF/CSV audit report of the resident's LOC changes.
