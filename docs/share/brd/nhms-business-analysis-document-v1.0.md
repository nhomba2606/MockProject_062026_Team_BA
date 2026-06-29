# Business Analysis Document (BAD)
## Nursing Home Management System (NHMS)

> **Stage:** Discovery / Requirements Analysis
> **Document type:** Business Analysis Document (precursor to BRD)
> **Status:** Draft
> **Language:** English (per project documentation standard); key business terms retained in English

---

## Document Control

| Field | Detail |
|---|---|
| Document ID | NHMS-BAD-001 |
| Project | Nursing Home Management System (NHMS) — MockProject_062026_Team_BA |
| Domain | Healthcare — Long-Term Care (U.S. market) |
| Author | BA Team |
| Owner / Approver | BA Lead — Kiều Quang Vân (`@unkaidev`) |
| Created | 2026-06-26 |
| Classification | Internal — Simulation |

### Version History

| Version | Date | Author | Change summary |
|---|---|---|---|
| 1.0 | 2026-06-26 | BA Team | Business Analysis Document — Discovery stage |

---

## Table of Contents

1. Introduction
2. Executive Summary
3. Business Context & Background
4. Problem Statement
5. Business Goals & Objectives
6. Stakeholder Analysis
7. Current State (As-Is)
8. Future State Vision (To-Be)
9. Scope
10. Functional Requirements (High-Level)
11. Non-Functional Requirements
12. Business Rules
13. Data & Integration View
14. Module Priority Classification
15. Constraints
16. Assumptions & Dependencies
17. Risk Register
18. Open Items — Points to Clear
19. Diagrams Roadmap (Appendix A)
20. Requirements Traceability (Appendix B)
21. Glossary (Appendix C)

---

## 1. Introduction

### 1.1 Purpose
This document captures the outcome of the Discovery phase for the NHMS project. It defines the business problem, stakeholders, current and future state, and high-level requirements that will be elaborated into the **Business Requirements Document (BRD)** in Milestone 2 and the **Software Requirements Specification (SRS)** in Milestone 3.

### 1.2 Scope of this document
Business-level analysis across the full system (8 modules) at **summary level**. It does not yet contain detailed use case specifications, wireframes, or data schemas — those are downstream deliverables.

### 1.3 Intended audience
BA Lead and BA team; downstream readers include solution architects, developers, and QA who will consume the BRD/SRS derived from this analysis.

### 1.4 References
- Source material: *Operational Workflows of U.S. Nursing Homes*, *NHMS System Architecture (8 modules)*, *Intake Assessment Module deep-dive*.
- Project repository: `nhomba2606/MockProject_062026_Team_BA` (README, milestone plan).
- Standards referenced: HIPAA, MDS, PDPM, RUGs, ICD-10, EDI 837/835.

---

## 2. Executive Summary

A mid-size, multi-facility nursing home operator in the United States requires a centralized **EHR/EMR & ERP platform for Long-Term Care**. Today, clinical care, regulatory compliance, and billing operate in disconnected silos, exposing the operator to medication errors, staffing-ratio violations, claim denials, and regulatory penalties.

The proposed system spans **8 modules across 4 functional groups**, unified by a single architectural principle — **Centralized Data Integration** — where a single resident assessment cascades automatically through care planning, staffing, and billing.

This document establishes the analytical foundation, prioritizes the modules by patient-safety, legal, and revenue impact, and lists the open points that must be resolved before requirements elaboration begins.

---

## 3. Business Context & Background

Nursing home operations in the U.S. are conducted within a heavily regulated industry governed by federal and state law, and revolve around a core triad:

| Pillar | Description |
|---|---|
| **Clinical Care** | Resident assessment, care planning, medication administration (EHR/EMR, eMAR). |
| **Compliance** | HIPAA, mandated staffing ratios, incident reporting, state/federal surveys. |
| **Billing & Finance** | Multi-payer billing (Medicare, Medicaid, Private Pay), claims & denial management. |

The operator manages multiple facilities and needs one system to handle resident intake, care planning, staff scheduling, billing, compliance reporting, and family communication.

### 3.1 Payer landscape

| Payer Source | Operational & billing characteristic |
|---|---|
| Medicare | Short-term post-acute (Skilled Nursing) only, capped at **100 days**; days must be tracked rigorously. |
| Medicaid | Long-term care for low-income residents; state-specific rules; "spend-down" asset verification. |
| Private Insurance / Out of Pocket | Billed by **Level of Care (LOC)**, updated periodically by the clinical team. |

---

## 4. Problem Statement

> **The operator lacks a centralized system; clinical care, compliance, and billing are fragmented — creating risk of medication error, resident falls, staffing-ratio violations, claim denials, and regulatory penalties due to delayed or inaccurate reporting.**

### 4.1 Pain points

| ID | Pain point | Impacted area |
|---|---|---|
| PP-01 | Medication error & dangerous drug interaction | Clinical / patient safety |
| PP-02 | Understaffing → fine / license revocation | Operations / compliance |
| PP-03 | Credential / license expiry not flagged | HR / compliance |
| PP-04 | Complex multi-payer claim denials | Billing |
| PP-05 | Incident reporting missed (24–48h deadline) | Compliance |
| PP-06 | HIPAA breach exposure | Data security |
| PP-07 | Manual intake assessment affecting billing & care | Clinical / billing |

### 4.2 Root cause analysis (5-Whys)

| Pain | Root cause |
|---|---|
| Fragmented operations | No **Centralized Data Integration** — modules do not share data |
| Manual errors & delays | Paper-based / manual processes |
| Missed deadlines & thresholds | Absence of automated alerts (med-pass, staffing, credential, pharmacy reorder) |
| Billing misaligned with care | Broken chain: *assessment → care plan → staffing → billing* |

---

## 5. Business Goals & Objectives

> ⚠️ **Quantified targets are not yet confirmed** — see Open Item OI-01.

| Goal ID | Business objective | Candidate KPI (to confirm) |
|---|---|---|
| BG-01 | Operate facilities on one integrated platform | Single source of truth across 8 modules |
| BG-02 | Strengthen regulatory compliance | Zero staffing-ratio violations; 100% incident reports within deadline |
| BG-03 | Optimize revenue | Reduced claim denial rate; accurate PDPM/LOC classification |
| BG-04 | Improve patient safety | Reduced medication-error rate |

---

## 6. Stakeholder Analysis

| Stakeholder | Type | Interest / Need | Influence |
|---|---|---|---|
| Resident | End beneficiary | Safe, person-centered care | Low |
| Family | External user | Transparency, billing, updates | Medium |
| CNA | Primary actor | Daily task checklists, med-pass | Medium |
| Nurse / LPN / RN | Primary actor | Assessments, eMAR, clinical charting | High |
| Director of Nursing (DON) | Decision maker | Care plans, staffing acuity | High |
| Nursing Home Administrator (NHA) | Sponsor / approver | Compliance, finance, operations | High |
| Billing / RCM staff | Primary actor | Claims, denial management | High |
| Infection Preventionist | Specialist | Infection control protocols | Medium |
| Dietary specialist / PT | Supporting actor | Diet orders, therapy schedules | Medium |
| State / Federal surveyor (HHS) | Regulator | Audit, survey readiness | High (external) |
| LTC Pharmacy | External system | Medication orders & refills | Medium |
| Insurance clearinghouse | External system | EDI claims (Medicare/Medicaid/Private) | Medium |

---

## 7. Current State (As-Is)

Operations rely on disconnected tools and manual/paper processes. Intake assessment is performed manually, with downstream impact on both care plans and billing. Alerts (medication windows, staffing ratios, credential expiry, pharmacy reorder) are not automated. Data is not centrally integrated, so a change in one area does not propagate to others. A detailed As-Is BPMN will be produced in Milestone 2 (see Appendix A).

---

## 8. Future State Vision (To-Be)

A single integrated EHR/EMR & ERP platform built on **Centralized Data Integration**. The clinical assessment is the system's center of gravity: it drives care planning, recalibrates staffing to acuity, and updates billing automatically. Compliance is enforced by design (chart auto-lock on incident, immutable audit trail, rule-based alerts).

### 8.1 Data flow exemplar (assessment-driven cascade)
`EHR (mobility decline)` → `Care Plan (inject "Transfer Assistance" task)` → `Scheduling (recalibrate floor staffing for higher acuity)` → `Billing (update invoice to new LOC rate)`.

---

## 9. Scope

### 9.1 In scope
All 8 modules at summary analysis level: Intake & EHR, Care Planning, eMAR, Staff Scheduling, Dining & Dietary, Billing & RCM, Incident & Risk Management, Family Portal.

### 9.2 Out of scope (Discovery phase)
Detailed use case specifications, wireframes/UI flows, physical data schema, and live integrations with named external systems (pharmacy, clearinghouse) — addressed in later milestones.

### 9.3 To be confirmed
MVP boundary vs full scope; target U.S. state(s) for state-specific rules (see Open Items).

---

## 10. Functional Requirements (High-Level)

| Group | Module | High-level capability |
|---|---|---|
| I. Clinical & Resident Care | **M1 Intake & EHR** | Digital charting, demographics, allergies, POA; intake assessments → LOC classification |
| | **M2 Care Planning** | Person-centered care plans; auto-translate to CNA task checklists |
| | **M3 eMAR** | Smart med-pass scheduling; barcode "5 Rights" verification; pharmacy integration |
| II. Operations & Workforce | **M4 Staff Scheduling** | Ratio calculation by census/acuity; open-shift management |
| | **M5 Dining & Dietary** | Diet filters per physician order; tableside ordering with allergy blocking |
| III. Billing & Financials | **M6 Billing & RCM** | Multi-payer billing; EDI 837/835 claims & denial management |
| IV. Compliance & Engagement | **M7 Incident & Risk Mgmt** | Incident reporting; chart auto-lock; wound management |
| | **M8 Family Portal** | Health updates, activities, menus, secure online payment |

---

## 11. Non-Functional Requirements

| NFR ID | Category | Requirement | Status |
|---|---|---|---|
| NFR-01 | Security / Privacy | HIPAA-compliant storage & access control | Confirmed |
| NFR-02 | Auditability | Immutable audit trail; e-signed assessment data cannot be altered | Confirmed |
| NFR-03 | Integrity | Chart auto-lock at time of incident | Confirmed |
| NFR-04 | Interoperability | EDI 837/835, ICD-10, MDS/PDPM standards | Confirmed |
| NFR-05 | Safety | Barcode verification enforcing the "5 Rights" | Confirmed |
| NFR-06 | Timeliness | Regulatory reporting within 24–48h | Confirmed |
| NFR-07 | Availability | Uptime target | ⚠️ To define |
| NFR-08 | Performance | Concurrency & response time | ⚠️ To define |
| NFR-09 | Retention | Data retention period | ⚠️ To define |

---

## 12. Business Rules

| BR ID | Rule (testable) |
|---|---|
| BR-01 | Staffing ratio must not exceed the state-mandated maximum residents per nurse/CNA. |
| BR-02 | For SNFs, MDS assessment must be completed within **14 days** of admission. |
| BR-03 | Reassessment must run every **90 days** or upon a Significant Change in Status. |
| BR-04 | Medicare SNF coverage is capped at **100 days**; payer source must transition when exhausted. |
| BR-05 | Assessment data, once e-signed, cannot be altered. |
| BR-06 | Pre-admission must be denied if the facility cannot meet the applicant's clinical needs. |

---

## 13. Data & Integration View

The architecture mandates **Centralized Data Integration** — all modules share data through a single, consistent resident record. Core entities anticipated: Resident, Assessment, Care Plan, Task, Medication Order, Staff, Shift, Incident, Invoice/Claim, Payer. The Entity Relationship Diagram (ERD) will be produced in Phase 3 and will bridge to the physical data schema in Phase 4 (see Appendix A).

---

## 14. Module Priority Classification

Prioritized by **patient safety**, **legal/regulatory impact**, and **revenue impact**. Mapped to both a P-tier and MoSCoW.

| Module | Priority | MoSCoW | Rationale |
|---|---|---|---|
| M1 Intake & EHR | **P1 — Critical** | Must | Foundation; drives billing, care, and payer classification |
| M3 eMAR | **P1 — Critical** | Must | Patient safety; 5 Rights; drug-interaction prevention |
| M7 Incident & Risk Mgmt | **P1 — Critical** | Must | Regulatory reporting ≤24–48h; chart lock for surveyors |
| M2 Care Planning | **P2 — High** | Must/Should | Translates assessment into CNA task checklists |
| M4 Staff Scheduling | **P2 — High** | Must/Should | Enforces mandated staffing ratios; avoids fines |
| M6 Billing & RCM | **P2 — High** | Should | Revenue cycle; denial management |
| M5 Dining & Dietary | **P3 — Medium** | Should | Physician-order diets; allergy blocking |
| M8 Family Portal | **P3 — Medium** | Could | Transparency; competitive differentiation |

---

## 15. Constraints

| ID | Constraint |
|---|---|
| C-01 | Federal + state law; rules vary by state. |
| C-02 | HIPAA data privacy. |
| C-03 | Anti-fraud: falsifying assessment data to inflate reimbursement is a federal offense. |
| C-04 | Mandatory standards: ICD-10, PDPM, RUGs, EDI 835/837. |

---

## 16. Assumptions & Dependencies

| Type | Item |
|---|---|
| Assumption | This is a BA simulation project; no production deployment. |
| Assumption | External integrations (pharmacy, clearinghouse) are simulated via assumed interfaces. |
| Assumption | Scope covers all 8 modules at summary level. |
| Dependency | Quantified KPIs and target state(s) required from sponsor before BRD elaboration. |

---

## 17. Risk Register

| Risk ID | Risk | Likelihood | Impact | Mitigation direction |
|---|---|---|---|---|
| R-01 | Compliance violation (staffing, reporting) | High | Severe (fine / license revocation) | Rule-based alerts; reporting workflow |
| R-02 | Data breach (HIPAA) | Medium | Severe | HIPAA-compliant storage; access control |
| R-03 | Billing fraud from incorrect assessment | Medium | Critical (criminal) | Immutable e-signed data; validation |
| R-04 | Staffing gap | High | Severe | Acuity-based scheduling; open-shift mgmt |

---

## 18. Open Items — Points to Clear

| OI ID | Item | Needed for | Owner |
|---|---|---|---|
| OI-01 | Quantified business goal (KPI + target + deadline) | BG-01..04 | Sponsor / BA Lead |
| OI-02 | MVP vs full scope decision | Scope §9 | BA Lead |
| OI-03 | Non-functional targets (uptime, concurrency, response time, retention) | NFR-07..09 | Architect |
| OI-04 | Transition requirements (migration, training, cutover) | To-Be §8 | BA Team |
| OI-05 | External integration specifics (which pharmacy / clearinghouse) | §13 | BA Team |
| OI-06 | Target U.S. state(s) for state-specific rules | BR-01, C-01 | BA Lead |

---

## Appendix A — Diagrams Roadmap

| Diagram | Purpose | Planned phase |
|---|---|---|
| Use Case Diagram | Actors + 8 modules + `<<include>>`/`<<extend>>` | Phase 2 |
| Activity / Flow | Intake Assessment: normal + alternative + exception | Phase 3 |
| Sequence Diagram | Centralized data flow EHR → Care → Scheduling → Billing | Phase 3 |
| BPMN (As-Is) | Current process mapping; identify bottlenecks | Phase 2 (M2) |
| ERD | Core entities → bridge to DB schema | Phase 3 → 4 |
| Data Dictionary | Entity / attribute definitions | Phase 4 |

---

## Appendix B — Requirements Traceability (seed)

| Req | Source pain/goal | Module | Forward link |
|---|---|---|---|
| M1 Intake & EHR | PP-07, BG-04 | M1 | → BRD FR-set, UC-INTAKE-* |
| M3 eMAR | PP-01, BG-04 | M3 | → BRD FR-set, UC-EMAR-* |
| M7 Incident & Risk | PP-05, BG-02 | M7 | → BRD FR-set, UC-INC-* |
| M4 Staff Scheduling | PP-02, BG-02 | M4 | → BRD FR-set, UC-SCHED-* |
| M6 Billing & RCM | PP-04, BG-03 | M6 | → BRD FR-set, UC-BILL-* |

*A full Requirements Traceability Matrix (RTM) will be produced as a separate deliverable in a later milestone.*

---

## Appendix C — Glossary

| Term | Definition |
|---|---|
| ADL / IADL | Activities of Daily Living / Instrumental ADLs — basis for LOC scoring |
| CNA | Certified Nursing Assistant |
| DON | Director of Nursing |
| eMAR | Electronic Medication Administration Record |
| EHR / EMR | Electronic Health / Medical Record |
| LOC | Level of Care — drives private-pay tiering |
| LTC | Long-Term Care |
| MDS | Minimum Data Set — federally mandated SNF assessment tool |
| NHA | Nursing Home Administrator |
| PDPM / RUGs | Patient-Driven Payment Model / Resource Utilization Groups — reimbursement classification |
| RCM | Revenue Cycle Management |
| SNF | Skilled Nursing Facility |
| 5 Rights | Right resident, medication, dose, route, time |

---

*End of document — NHMS-BAD-001 v1.0.*
