# NHMS — Phase 1 Discovery Findings (Final)
> Version: 1.0 · Date: 2026-06-29 · Status: **CONFIRMED — Ready for Phase 2**

---

## 1. Business Problem

A multi-facility U.S. nursing-home operator lacks a centralized system.  
Clinical care, compliance, and billing are **fragmented** — driving medication errors, missed tasks, staffing-ratio violations, claim denials, and regulatory penalties.

**Root cause (5-Whys):**  
Absence of **Centralized Data Integration** + manual processes + missing automated alerts + a broken **Assessment → Care → Staffing → Billing chain**.

---

## 2. Business Goals & KPIs

| ID | Goal | Qualitative KPI |
|---|---|---|
| BG-01 | One integrated platform / single source of truth | Zero duplicate data entry across modules |
| BG-02 | Compliance by design | 100% incidents reported within deadline; zero staffing-ratio violations |
| BG-03 | Care-driven revenue accuracy | Invoice always reflects current LOC |
| BG-04 | Patient safety | Reduced medication-error and fall incidents |

> **Decision (2026-06-29):** KPIs remain qualitative for the 1-month simulation. No numeric targets required at this stage.

---

## 3. Stakeholders

### Internal Actors (MVP core — Phase 2 scope)

| Actor | Core interaction |
|---|---|
| Nurse (LPN/RN) | Assessments, vitals, care plans, eMAR |
| CNA (Caregiver) | Daily care tasks, logging, abnormal-condition reports |
| DON (Director of Nursing) | Care-plan governance, acuity decisions, incident oversight |
| Admission Staff | Resident profile creation, intake coordination |
| System Administrator | Accounts, roles, permissions, configuration |

### Internal Actors (P2/P3 scope — deferred)

| Actor | Core interaction |
|---|---|
| Facility Manager | Census, staffing, compliance, billing oversight |
| Doctor / Clinical Specialist | Medication orders, high-acuity sign-off |
| HR / Shift Coordinator | Schedules, staffing ratios |
| Nutritionist / Kitchen Staff | Menus, diets, allergens |
| Accountant / Billing Staff | Invoices, payments |
| Infection Preventionist | Infection-control protocols |

### External Actors (out of scope for simulation)

| Actor | Interaction |
|---|---|
| Family / Guardian | Health updates, invoices, requests |
| Resident | Subject of care; indirect |
| State / Federal Surveyor | Audits; system produces reports |
| External Partners | LTC pharmacy, insurance clearinghouse — simulated/deferred |

---

## 4. Pain Points

| ID | Pain Point | Impact |
|---|---|---|
| PP-01 | Fragmented resident data | Duplicate, stale, missing data |
| PP-02 | Complex intake assessment | Can't quickly compute clinical risk / care level / fee tier |
| PP-03 | Lack of care personalization | Individual needs missed without automated triggers |
| PP-04 | Missed daily care tasks | Vitals/bathing/feeding skipped (verbal/paper-based) |
| PP-05 | High-risk medication administration | Wrong dose / missed window / interactions |
| PP-06 | Acuity-blind staff scheduling | Understaffing, burnout, ratio violations |
| PP-07 | Disconnected billing | LOC increases not reflected in invoices — revenue leakage |
| PP-08 | Lack of family transparency | High manual inquiry volume |

---

## 5. Functional Requirements — MVP Scope (P1)

**Decision (2026-06-29):** Phase 2 covers **all P1 sub-modules** (not just M1+M3+M7).

| Module | Sub-modules | Analysis depth |
|---|---|---|
| M1 — Intake & EHR | Resident Profile · Admission & Initial Assessment · Care Level Classification | Deep — full UC spec |
| M2 — Care Planning | Care Plan Management · Daily Care Task Management | Deep — full UC spec |
| M3 — eMAR | Medication Management / eMAR | Deep — full UC spec |
| M7 — Incident & Risk | Incident & Risk Management | Deep — full UC spec |

**Deferred (P2/P3):**

| Module | Status |
|---|---|
| M4 Staff Scheduling | Thin-slice demo if time allows |
| M5 Dining & Dietary | Deferred |
| M6 Billing & RCM | Deferred |
| M8 Family Portal | Deferred |

---

## 6. Non-Functional Requirements

| ID | Requirement | Status |
|---|---|---|
| NFR-01 | HIPAA-aligned storage, encryption, RBAC | Confirmed (simulate) |
| NFR-02 | Immutable audit trail; e-signed data not alterable | Confirmed |
| NFR-03 | Chart auto-lock at incident timestamp | Confirmed |
| NFR-04 | Mobile/tablet-friendly, minimal typing, color-coded alerts | Confirmed |
| NFR-05 | Standards alignment: ICD-10, MDS/PDPM, EDI 837/835 — simulated | Simulated |
| NFR-06 | Regulatory incident reporting within 24–48h | Confirmed |
| NFR-07 | Response time < 2s on demo dataset (~20 residents) | **Confirmed (2026-06-29)** |
| NFR-08 | ≤ 10 concurrent demo users | Confirmed |
| NFR-09 | 5-year federal minimum data retention (production target, not enforced in sim) | Documented |

---

## 7. Business Rules

| ID | Rule |
|---|---|
| BR-01 | Staffing ratio must not exceed state-mandated maximum (CA: 3.5 nursing hrs/resident/day) |
| BR-02 | MDS assessment completed within 14 days of admission (SNF) |
| BR-03 | Reassessment every 90 days or on Significant Change in Status (manual flag by DON/RN) |
| BR-04 | Medicare SNF coverage capped at 100 days; alert at day 90, lock at day 100 |
| BR-05 | Assessment data, once e-signed, cannot be altered — correction via addendum only |
| BR-06 | Pre-admission denied if facility cannot meet applicant's clinical needs (checklist + acuity threshold) |
| BR-07 | On incident entry, resident chart auto-locked at that timestamp |
| BR-08 | Meal orders blocked if they violate documented allergy/diet restriction |

---

## 8. Constraints

| Type | Detail |
|---|---|
| Time | 1-month simulation; demo-ready by end of sprint |
| Budget | Free / open-source stack only (no paid APIs or hardware) |
| Integrations | All external integrations simulated/stubbed (pharmacy, clearinghouse, CMS) |
| Geography | California regulations only (single-state assumption) |
| Scale | 1 facility, ~20 seeded demo residents |
| Delivery | Internal demo — no production deployment |

---

## 9. Risk Register

| ID | Risk | L | I | Mitigation |
|---|---|---|---|---|
| R-01 | Domain misunderstanding — system becomes data-entry only | Med | High | Anchor on active daily workflows |
| R-02 | Scope creep (too many shallow modules) | High | High | Enforce MVP boundary; confirm with mentor |
| R-03 | Sensitive-data exposure (HIPAA) | Med | Severe | RBAC, view limits, immutable audit logs |
| R-04 | Medication-safety errors | Med | Severe | Clear process states, missed/refused-dose logs, allergy checks |
| R-05 | Low CNA adoption | Med | High | Simple mobile UI, minimal typing, color alerts |
| R-06 | Integration complexity (pharmacy/insurance/IoT) | Med | High | Defer all external integrations |
| R-07 | Compliance/legal variance by market | Med | Severe | Fixed to California; parameterized for future states |
| R-08 | Acuity-blind staffing | High | Severe | Tie scheduling to care level / acuity |

---

## 10. Key Assumptions (condensed from 39 Q&A decisions)

| ID | Decision |
|---|---|
| A-01 | MVP = M1 + M2 (P1 sub-modules) + M3 + M7; M4/M5/M6/M8 deferred |
| A-02 | Single California facility; multi-facility design via `facility_id` row isolation |
| A-03 | No production go-live; target = internal demo at end of month |
| A-04 | LOC classification: formula-suggested (ADL/IADL score) + clinician confirmation |
| A-05 | MDS replaced by simplified assessment form; mapped to MDS 3.0 in documentation |
| A-06 | eMAR barcode via webcam + free JS library (no dedicated hardware) |
| A-07 | eMAR verification failure = soft-lock with mandatory override reason + audit log |
| A-08 | Significant Status Change = manual flag by DON or RN + 90-day timer |
| A-09 | Incident reporting = internal SLA timer only; external submission simulated ("marked as sent") |
| A-10 | Auth = username/password + hashed; MFA/SSO deferred |
| A-11 | RBAC: 5 roles (CNA, Nurse/RN, DON, NHA/Admin, Billing) — designed by team |
| A-12 | Audit log in dedicated `audit_log` table (append-only); read access = NHA/Admin only |
| A-13 | Record correction via addendum/new version only — original immutable |
| A-14 | Single shared DB + `facility_id` row isolation |
| A-15 | No data migration; demo seeded with ~20 fictional residents |
| A-16 | Stack: free/OSS (React or Vue + Node/Spring/Django + PostgreSQL or SQLite) |

---

## 11. Confirmed Decisions — Phase 1 Exit (2026-06-29)

| # | Decision |
|---|---|
| D-01 | Business goal KPIs stay **qualitative** — no numeric targets for simulation |
| D-02 | NFR-07 baked: **response time < 2s** on demo dataset |
| D-03 | Phase 2 scope = **all P1 sub-modules** (M1 full + M2 full + M3 + M7) |
| D-04 | MVP core actors = Nurse, CNA, DON, Admission Staff, System Admin |
| D-05 | **First UC spec: "Admit Resident"** (M1 entry point — full cascade) |

---

*NHMS Phase 1 Decisions Final · Ready for Phase 2 — Use Case + Decomposition*
