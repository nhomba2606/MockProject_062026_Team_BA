# Discovery Analysis
# Nursing Home Management System in the United States

## 1. Business Context / Pain Points

### 1.1. Project Domain

Based on the analyzed business contents, the project belongs to the following domain:

**Healthcare Technology / Elderly Care / Long-term Care / Nursing Home Management System**

This can be understood as a healthcare technology field, more specifically, a nursing home management and long-term care management system for elderly people.

This project should not be understood simply as a system for managing elderly resident profiles. The nature of the problem is to build a system that supports the overall operation of a care facility, including:

* admitting elderly residents;
* assessing initial conditions;
* classifying care levels;
* creating personalized care plans;
* managing daily care tasks;
* managing medications;
* managing meals and nutrition;
* managing staff and work shifts;
* managing incidents/risks;
* managing costs and invoices;
* providing information to families/guardians.

The central object of the entire system is the elderly resident. All data and business processes revolve around the care lifecycle of this object.

---

### 1.2. Business Context

A nursing home or long-term care facility needs to manage many complex activities at the same time. These activities are not separate from each other but are closely connected.

For example, the initial assessment result of an elderly resident can directly affect the care level, care plan, task schedule of nurses/caregivers, service costs, and reporting information for the family.

The core business flow can be understood as follows:

**Initial assessment**
→ **Care level classification**
→ **Care plan creation**
→ **Daily care task generation**
→ **Staff assignment**
→ **Medication / meal / incident updates**
→ **Cost / report / family information updates**

Therefore, the main value of the system does not only lie in storing data, but also in the ability to connect data between departments and support real care operations.

---

### 1.3. Main Pain Points

#### Pain point 1: Elderly resident data is fragmented

An elderly resident has a large amount of information that needs to be managed, including personal information, relatives, guardians, medical history, allergies, current medications, activities of daily living ability, cognitive condition, fall risk, diet, care level, contract, and costs.

If this information is managed through paper documents, Excel files, messages, or multiple disconnected tools, the facility can easily face missing data, incorrect data, duplicate data, or uncertainty about which information is the latest.

#### Pain point 2: Initial assessment is an important but complex business process

Initial assessment is not only a profile entry step. It is the step that determines many important issues:

* whether the facility has enough capacity to admit the elderly resident;
* what level of care the elderly resident needs;
* whether there is a risk of falling, pressure ulcers, dysphagia, or cognitive decline;
* what type of care plan is needed;
* how many staff members need to be allocated;
* what service fee should be applied.

If the initial assessment is incorrect or incomplete, the following steps such as care planning, staff assignment, medication management, meal management, and billing can all be affected.

#### Pain point 3: Elderly care requires a high level of personalization

Each elderly resident has different health conditions, daily living abilities, dependency levels, diets, medications, and risks.

For example:

* a person with fall risk needs mobility support;
* a person with swallowing difficulty needs a soft or pureed diet;
* a person with pressure ulcer risk needs periodic repositioning;
* a person with cognitive decline needs closer behavior monitoring.

Without a supporting system, staff will find it very difficult to track and correctly follow the individual care plan for each resident.

#### Pain point 4: Daily care tasks are easily missed

A care plan only has value when it is converted into specific daily tasks for nurses/caregivers.

For example:

* supporting eating and drinking;
* supporting bathing;
* supporting toileting;
* measuring blood pressure;
* reminding medication intake;
* changing position;
* recording food intake;
* reporting abnormal conditions.

If these tasks are only recorded manually or communicated verbally, staff may forget, duplicate work, delay tasks, or fail to record the results.

#### Pain point 5: Medication management is a high-risk business process

Medication management directly affects the safety of elderly residents. Possible risks include:

* giving the wrong medication;
* wrong dosage;
* wrong time;
* wrong resident;
* missed medication dose;
* failure to record that the elderly resident refused medication;
* failure to detect allergies or contraindications.

Therefore, the medication module needs to be analyzed carefully and should not be considered only as a simple medication list.

#### Pain point 6: Staff management depends on care levels

Staff scheduling in a nursing home is not only about assigning shifts. The number of staff required depends on the number of elderly residents, their health conditions, and the care level of each resident.

If the system does not connect care level data with staff assignment, the facility may face staff shortages, staff overload, or reduced care quality.

#### Pain point 7: Costs need to be linked with care levels and services used

Care costs may depend on service packages, care levels, room types, medications, supplies, special diets, additional services, and length of stay.

If care data and financial data are not connected, invoices may be incorrect or difficult to explain to families/guardians.

#### Pain point 8: Families/guardians need information transparency

Families usually want to know how the elderly resident is being cared for, how they are eating, what activities they are joining, whether their health has changed, whether any incident has occurred, and why additional costs arise.

Without a transparent update channel, the facility may have to handle many phone calls, manual requests, complaints, or loss of trust from families.

---

## 2. Scope

Because the project domain is quite broad, the scope should be divided into phases. Advanced modules should not all be included in the same phase because this can easily cause overload, scope creep, and reduce the quality of the core flow.

---

### 2.1. Phase 1 – Core Scope

The first phase should focus on the core business flow of elderly residents.

Proposed modules for Phase 1:

1. Elderly resident profile management
2. Admission and initial assessment
3. Care level classification
4. Care plan management
5. Daily care task management
6. Basic medication management
7. Basic incident/risk recording
8. Basic staff assignment
9. Basic cost/service package information management

The goal of Phase 1 is to build the operational backbone of the system.

---

### 2.2. Phase 2 – Operational Expansion

After the core flow becomes stable, the system can be expanded with:

1. Detailed work schedule and shift management
2. Meal and nutrition management
3. Dashboard and operational reports
4. Basic family portal
5. Detailed invoice and payment management
6. Activity/recreation management for elderly residents
7. Additional service management

---

### 2.3. Phase 3 – Advanced Features and Integration

Advanced functions should only be added after the customer clearly confirms the need:

1. Pharmacy integration
2. Insurance integration
3. Barcode/QR for confirming elderly residents and medications
4. IoT/sensor device integration
5. Fall or bed-exit alerts
6. Advanced compliance reports
7. AI risk prediction
8. Multi-facility data analytics
9. Advanced mobile app for families and staff

---

### 2.4. Items That Should Not Be Assumed as In-scope by Default

The following items need to be clarified before being included in the project scope:

* Medicare/Medicaid;
* HIPAA;
* MDS/PDPM;
* EDI 835/837;
* pharmacy integration;
* hospital/clinic integration;
* automatic medical diagnosis;
* medical AI;
* IoT/sensors;
* medication barcode;
* staff payroll system;
* full accounting;
* legal reports by country/state.

These contents may be important, but they have a major impact on cost, timeline, technology, and legal responsibility, so they need to be confirmed with the Mentor.

---

## 3. Risk

### 3.1. Risk of Misunderstanding the Business Domain

Nursing home is a complex domain because it involves healthcare, service operation, staffing, finance, and legal responsibility.

If the BA misunderstands the business domain, the system may only stop at storing data without supporting real operations.

Areas that are easy to misunderstand include:

* initial assessment;
* care level classification;
* care plan creation;
* medication management;
* incident recording;
* family access rights;
* billing based on care level.

---

### 3.2. Risk of Scope Creep

The project has many related modules. If priorities are not clearly defined, the team may be pulled into too many directions such as EHR, eMAR, staffing, meals, finance, family portal, insurance, pharmacy integration, IoT, and AI.

The risk is that the system may have many functions, but none of them is deep enough to solve the core problem.

Proposed solutions:

* define a clear MVP;
* prioritize the core flow;
* divide the scope into phases;
* confirm mandatory modules with the customer;
* do not automatically assume advanced features are mandatory.

---

### 3.3. Risk of Sensitive Data

The system stores a large amount of sensitive data such as health conditions, medications, allergies, family information, guardian information, invoices, and incidents.

Therefore, the system needs to consider:

* role-based access control;
* audit log;
* limits on viewing/editing data;
* change history of important information;
* rules on what information is allowed to be displayed to families.

---

### 3.4. Medication Safety Risk

Medication is a high-risk business process. Medication errors can directly affect the health of elderly residents.

Risks include:

* wrong resident;
* wrong medication;
* wrong dose;
* wrong time;
* missed dose;
* failure to record the reason for a missed dose;
* lack of allergy alerts.

The medication module needs to be clearly defined in terms of process, permissions, status, and change logs.

---

### 3.5. Risk That Users Do Not Use the System Correctly

The main users may include nurses, caregivers, receptionists, accountants, kitchen staff, and managers. These user groups need to perform tasks quickly in their daily work.

If the interface is complicated or requires too much data entry, staff may enter incomplete data, enter data late, or fail to follow the correct process.

The system should prioritize:

* simple interface;
* quick operations;
* mobile/tablet compatibility if needed;
* reduced duplicate data entry;
* clear alerts.

---

### 3.6. Integration Risk

Contents such as pharmacy, insurance, EDI, IoT, or external devices can increase the complexity of the project.

Risks include:

* dependency on third parties;
* data synchronization errors;
* increased development cost;
* higher security requirements;
* difficulty in end-to-end testing.

These parts should be moved to later phases if there is no clear confirmation.

---

### 3.7. Legal and Compliance Risk

If the system serves the U.S. market, factors such as HIPAA, Medicare, Medicaid, MDS, PDPM, and EDI may be very important. If the system serves another market, the applicable regulations will be different.

Therefore, the target market and compliance standards need to be identified before finalizing the requirements.

---

## 4. Actor

Actors here are understood as parties that interact directly or indirectly with the system and business process.

---

### 4.1. Internal Actors

#### 1. System Administrator

Responsible for managing accounts, roles, permissions, and system configuration.

#### 2. Facility Manager / Nursing Home Manager

Monitors the overall operation, number of elderly residents, staff, incidents, reports, finance, and operational quality.

#### 3. Admission Staff

Creates elderly resident profiles, collects personal information, family information, documents, admission status, and coordinates the initial assessment.

#### 4. Nurse / Medical Staff

Performs health assessments, records health indicators, creates or updates care plans, manages medications, and monitors risks.

#### 5. Caregiver

Performs daily care tasks such as supporting eating and drinking, bathing, personal hygiene, mobility, recording conditions, and reporting abnormalities.

#### 6. Doctor / Clinical Specialist

Reviews health conditions, gives care instructions, and approves medications or care plans if required by the process.

#### 7. Nutritionist / Kitchen Staff

Manages menus, diets, food allergies, portions, and special dietary requirements.

#### 8. HR / Shift Coordinator

Manages work schedules, shift assignments, shift changes, and staff assignment by area, room, or care level.

#### 9. Accountant / Finance Staff

Manages service packages, costs, invoices, payments, debts, and financial reports.

---

### 4.2. External Actors

#### 1. Family / Guardian

Provides information, monitors care status, receives notifications, views invoices, makes payments if available, and sends requests to the facility.

#### 2. Elderly Resident

The central object being cared for and managed. Depending on the system design, the elderly resident may not directly use the system.

#### 3. Customer / Facility Owner

The party that provides business requirements, confirms scope, reviews the product, and accepts the system.

#### 4. External Partners

May include pharmacies, hospitals, clinics, insurance providers, payment gateways, or device providers. These actors should only be included in scope after confirmation.

---

## 5. Module Analysis and Priority

Modules should be arranged based on dependency level, business value, operational risk, and implementation order.

---

### Priority 1: Core Data and Core Care Flow

This is the group of modules that should receive the highest priority because it creates the foundation for the entire system.

---

### Module 1. Elderly Resident Profile Management

#### Purpose

Create and manage a centralized profile for each elderly resident.

#### Main Functions

* manage personal information;
* manage relatives/guardians;
* manage emergency contacts;
* manage medical history;
* manage allergies;
* manage current medications;
* manage attached documents/files if needed;
* manage resident status;
* store notes and basic care history.

This is the master data module of the system. Other modules such as assessment, care, medication, billing, incidents, and family portal all depend on elderly resident profile data.

#### Priority

**Very high.** This is the module that needs to be defined and implemented first.

---

### Module 2. Admission and Initial Assessment

#### Purpose

Assess admission eligibility and determine the care needs, risks, and care level of the elderly resident.

#### Main Functions

* pre-admission screening;
* post-admission assessment;
* ADL/IADL assessment;
* cognitive and behavioral assessment;
* fall risk assessment;
* pressure ulcer risk assessment;
* dysphagia assessment;
* mental health assessment;
* verification of legal/guardian information;
* recording assessment results;
* confirming or approving assessment results.

This is one of the most important business modules. It is not only a data entry form, but also a decision-making module. Assessment results affect care levels, care plans, daily tasks, staffing, and costs.

#### Priority

**Very high.** It needs to be analyzed in detail before designing the UI, database, and user stories.

---

### Module 3. Care Level Classification

#### Purpose

Classify elderly residents into care levels based on assessment results.

#### Main Functions

* define care levels;
* calculate or suggest care levels;
* allow manual adjustment if the user has permission;
* link care levels with care plans;
* link care levels with costs/service packages;
* store care level change history.

Care level is the bridge between health/care data and operational/financial data. It is necessary to clarify whether the system calculates automatically, staff select manually, or the system only suggests and an authorized person confirms.

#### Priority

**Very high.** It should be designed together with the initial assessment module and the care plan module.

---

### Module 4. Care Plan Management

#### Purpose

Create a personalized care plan for each elderly resident based on health condition, risks, and care level.

#### Main Functions

* create care plans;
* use care plan templates;
* suggest care plans from assessment results;
* define care activities;
* set frequency/schedule of execution;
* assign responsible roles;
* approve care plans;
* manage care plan status;
* manage versions if there are changes.

The care plan is the bridge between initial assessment and daily operations. For example, if an elderly resident has a high risk of pressure ulcers, the system needs to support the creation of periodic repositioning tasks.

#### Priority

**Very high.** It should be implemented after initial assessment and before the daily care task module.

---

### Module 5. Daily Care Task Management

#### Purpose

Convert the care plan into specific tasks for nurses/caregivers to perform.

#### Main Functions

* generate tasks from the care plan;
* create tasks manually;
* assign tasks by elderly resident, staff, shift, room, or area;
* update task status;
* send reminders;
* alert overdue tasks;
* add notes after execution;
* report abnormal conditions;
* track task completion rate.

This module helps the system enter real operations. Without this module, the care plan is only static data and cannot ensure that care activities are performed.

#### Priority

**Very high.** It should be included in Phase 1.

---

### Priority 2: High-risk Care Operation Modules

This group of modules is directly related to safety and care quality.

---

### Module 6. Medication Management / eMAR

#### Purpose

Manage the medication list, medication schedule, medication status, and medication history of each elderly resident.

#### Main Functions

* manage medication list;
* manage dosage;
* manage medication time and frequency;
* manage medication route;
* record medication administration status;
* alert overdue medication;
* record missed doses/refusal to take medication;
* check allergies if available;
* manage medication refills if needed;
* store medication administration history.

This is a high-risk module. The system should support the principles of the right resident, right medication, right dose, right route, and right time. However, functions such as barcode, medication interaction alerts, and pharmacy integration need to be confirmed before being included in scope.

#### Priority

**High.** It should be included in Phase 1 at a basic level or early Phase 2 depending on customer priority.

---

### Module 7. Incident and Risk Management

#### Purpose

Record, track, and handle incidents that occur during the care process.

#### Main Functions

* record falls;
* record injuries;
* record medication errors;
* record pressure ulcers;
* record abnormal behaviors;
* record emergency events;
* classify severity level;
* assign follow-up actions;
* notify the responsible person;
* attach evidence if needed;
* update the elderly resident’s risk status;
* create incident reports.

This module is important for safety, traceability, quality control, and legal responsibility. Clear permission control and audit logs are required for incident data.

#### Priority

**High.** At least a basic incident recording version should be included in Phase 1.

---

### Module 8. Meal and Nutrition Management

#### Purpose

Manage menus and diets suitable for the health condition of each elderly resident.

#### Main Functions

* manage menus;
* manage diet types;
* manage food allergies;
* manage foods to avoid;
* manage portions;
* record food intake;
* support special dietary instructions;
* notify kitchen/nutrition staff.

This module is linked with health profiles, initial assessment, care plans, and the family portal. This module becomes important if the facility provides personalized meal services.

#### Priority

**Medium to high.** It should be moved to Phase 2 if the customer does not confirm it as a mandatory requirement in Phase 1.

---

### Priority 3: Operation Management Modules

This group of modules supports facility operation management.

---

### Module 9. Staff and Shift Management

#### Purpose

Manage staff, work shifts, and staff assignment according to care needs.

#### Main Functions

* manage staff profiles;
* manage roles;
* manage certificates if needed;
* create work schedules;
* assign staff by shift, room, floor, or elderly resident;
* support shift changes;
* approve shift changes;
* alert staff shortages;
* calculate workload if needed.

The staff module in this problem should be linked with care levels and task workload. If many elderly residents require high-level care, the system should support management in identifying staff shortage risks.

#### Priority

**Medium to high.** Phase 1 should include basic assignment, while detailed scheduling can be moved to Phase 2.

---

### Module 10. Dashboard and Reports

#### Purpose

Provide managers with an overview of operations, residents, staff, incidents, and finance.

#### Main Functions

* report the number of elderly residents;
* report care levels;
* report completed/incomplete tasks;
* report overdue medications;
* report incidents;
* report staff workload;
* report revenue;
* report debts;
* report high-risk residents.

Reports only have value when the core data is accurate. Therefore, the dashboard should be designed based on the real decision-making needs of managers.

#### Priority

**Medium.** A basic dashboard can be included in Phase 1, while advanced reports can be moved to Phase 2.

---

### Priority 4: Business and Family Engagement Modules

This group of modules supports finance and customer experience.

---

### Module 11. Cost, Invoice, and Payment Management

#### Purpose

Manage service packages, costs, invoices, payments, and debts.

#### Main Functions

* manage service packages;
* manage fees based on care levels;
* manage room fees;
* manage additional services;
* create invoices;
* record payments;
* manage debts;
* adjust invoices;
* view invoice history;
* support online payment if needed.

Billing should be linked with care levels and services used. However, insurance, Medicare/Medicaid, or EDI need to be confirmed before being included in scope.

#### Priority

**Medium.** It should be implemented after the logic of care levels and service packages has been confirmed.

---

### Module 12. Family Portal

#### Purpose

Provide families/guardians with a channel to monitor permitted information about the elderly resident.

#### Main Functions

* view basic information;
* view care updates;
* view menus;
* view activities;
* view important notifications;
* view invoices;
* make payments if needed;
* send requests/feedback;
* manage access rights of family members.

The family portal depends heavily on data from core modules. It should not be implemented too early if the core flow is not stable, because the portal only has value when internal data is accurate and updated regularly.

#### Priority

**Medium.** It should be moved to Phase 2 if the customer does not consider it a mandatory selling point of Phase 1.

---

### Priority 5: Advanced Integration Modules

These modules should only be added to the plan after clear confirmation from the customer.

Possible modules include:

* pharmacy integration;
* insurance integration;
* hospital/clinic integration;
* barcode/QR;
* IoT/sensors;
* AI risk prediction;
* advanced compliance reports;
* multi-facility management.

Advanced modules can create additional value but increase technical complexity, security requirements, testing effort, cost, and legal responsibility. They should not be automatically included in scope without confirmation.

---

## 6. Diagram

### 6.1. Overall Business Flow

**Family / guardian sends admission request**
↓
**Admission staff creates elderly resident profile**
↓
**Nurse / medical staff performs initial assessment**
↓
**System classifies care level**
↓
**Care team creates personalized care plan**
↓
**System generates daily care tasks**
↓
**Nurse / caregiver performs and records results**
↓
**Update medication / meal / incident if any**
↓
**Update cost / report / information for family**

---

### 6.2. Module Dependency Diagram

**Elderly resident profile**
↓
**Admission & initial assessment**
↓
**Care level classification**
↓
**Care plan**
↓
**Daily care tasks**
↓
**Medication - Incident - Meal/Nutrition**
↓
**Staff / Shift assignment**
↓
**Cost / Invoice / Payment**
↓
**Dashboard / Reports**
↓
**Family portal**

---

### 6.3. Actor – Module Mapping

**System Admin:** User, role, permission management

**Admission staff:** Elderly resident profile, admission process

**Nurse / medical staff:** Initial assessment, care plan, medication, incident

**Caregiver:** Daily care tasks, care notes, abnormal condition reports

**Doctor / clinical specialist:** Health review, care instructions, medication/care plan approval if needed

**Nutritionist / kitchen staff:** Menu, diet, food allergies

**HR / shift coordinator:** Work schedule, staff assignment

**Accountant:** Service packages, invoices, payments, debts

**Facility manager:** Dashboard, reports, incident tracking, staff, finance

**Family / guardian:** Family portal, care updates, invoices, notifications

---

### 6.4. Data Flow from Assessment to Operation

**Initial assessment data**
↓
**Care level**
↓
**Care plan**
↓
**Daily care tasks**
↓
**Staff assignment**
↓
**Medication / meal / incident tracking**
↓
**Cost / reports / family updates**

---

## 7. Q&A

1. Does the system need to apply to the entire nursing home model in the United States or focus on a specific type of facility such as Assisted Living or Skilled Nursing Facility?

2. Are U.S.-specific standards such as HIPAA, Medicare, Medicaid, MDS, PDPM, and EDI 835/837 mandatory in the current scope?

3. If an elderly resident is rejected during admission, what information does the system need to store?

4. Will the care level be calculated automatically by the system, selected manually by staff, or suggested by the system and then confirmed by staff?

5. How is the care plan created?

6. Will caregivers receive tasks by shift, room, floor, or individual resident?

7. When a task is not completed or is skipped, how should staff record it?

8. Is the invoice calculated based on a fixed package or adjusted according to care level and additional services?

9. What information are families/guardians allowed to view on the family portal?
