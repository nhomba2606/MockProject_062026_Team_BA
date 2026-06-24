# MockProject_062026_Team_BA

> **Nursing Home Management System (NHMS)**
> A full-cycle Business Analysis simulation project modeled after real enterprise engagements in the U.S. healthcare domain.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Team](#team)
- [Deliverables](#deliverables)
- [Repository Structure](#repository-structure)
- [Sprint & Milestone Plan](#sprint--milestone-plan)
- [GitHub Workflow](#github-workflow)
- [Branch Naming Convention](#branch-naming-convention)
- [Commit Convention](#commit-convention)
- [Labels Reference](#labels-reference)
- [Getting Started](#getting-started)
- [Environment Setup](#environment-setup)

---

## Project Overview

| Field | Detail |
|---|---|
| **Project Name** | Nursing Home Management System (NHMS) |
| **Project Code** | MockProject_062026_Team_BA |
| **Domain** | Healthcare — Long-Term Care (U.S. Market) |
| **Type** | Simulation (based on 20+ years real-world IT experience) |
| **Start Date** | June 2026 |
| **Language** | English (all documentation) |
| **Methodology** | Agile BA — Scrum-aligned |

### Business Context

The NHMS project simulates a business analysis engagement for a mid-size nursing home facility operator in the United States. The operator manages multiple care facilities and requires a centralized system to handle resident intake, care planning, staff scheduling, billing, compliance reporting, and family communication.

This simulation covers the full BA lifecycle — from initial stakeholder discovery through final sign-off — producing artifacts that mirror what would be delivered to a real client.

---

## Team

| Name | Role | GitHub Handle |
|---|---|---|
| Kiều Quang Vân | BA Lead | `@unkaidev` |
| Phan Thành Lộc | Fresher BA | `@phan-thanh-loc` |
| Huỳnh Ngọc Thiện | Fresher BA | `@huynh-ngoc-thien` |
| Nguyễn Đức Phương | Fresher BA | `@nguyen-duc-phuong` |
| Tô Duy Bắc | Fresher BA | `@to-duy-bac` |
| Nguyễn Thị Phương Thảo | Fresher BA | `@nguyen-thi-phuong-thao` |

**BA Lead responsibilities:** PR approval, milestone sign-off, quality gate enforcement.
**Fresher BA responsibilities:** artifact drafting, peer review, issue tracking.

---

## Deliverables

The following artifacts will be produced across all sprints:

| # | Artifact | Abbreviation | Owner |
|---|---|---|---|
| 1 | Business Requirements Document | BRD | BA Lead |
| 2 | Software Requirements Specification | SRS | Team |
| 3 | User Stories with Acceptance Criteria | US | Team |
| 4 | Wireframes & UI Flows | WF | Team |
| 5 | Data Dictionary | DD | Team |
| 6 | Use Case Diagrams & Descriptions | UC | Team |
| 7 | Business Process Diagrams (BPMN) | BPD | Team |
| 8 | Test Cases | TC | Team |
| 9 | Requirements Traceability Matrix | RTM | BA Lead |
| 10 | Stakeholder Register | SR | BA Lead |

---

## Repository Structure

```
MockProject_062026_Team_BA/
├── .github/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── ISSUE_TEMPLATE/
│       ├── brd-task.md
│       ├── srs-task.md
│       ├── user-story.md
│       └── review-request.md
├── docs/
│   ├── 01-project-charter/
│   ├── 02-stakeholder-register/
│   ├── 03-brd/
│   ├── 04-srs/
│   ├── 05-user-stories/
│   ├── 06-use-cases/
│   ├── 07-process-diagrams/
│   ├── 08-wireframes/
│   ├── 09-data-dictionary/
│   └── 10-test-cases/
├── rtm/
│   └── requirements-traceability-matrix.xlsx
├── scripts/
│   └── setup_github.ps1
├── .env                   ← local only, git-ignored
├── .env.example           ← commit this
├── .gitignore
└── README.md
```

---

## Sprint & Milestone Plan

> 5 Milestones · 10 Sprints · 2 weeks per sprint · ~5 months total

### Milestone 1 — Project Foundation `M1`
**Duration:** Sprint 1–2 | **Goal:** Establish project base, understand business context

| Sprint | Key Activities | Deliverables |
|---|---|---|
| S1 | Kickoff, stakeholder identification, domain research | Project Charter, Stakeholder Register |
| S2 | Business process mapping, glossary creation | Business Glossary, As-Is Process Diagrams |

### Milestone 2 — Requirements Gathering `M2`
**Duration:** Sprint 3–4 | **Goal:** Elicit and document business requirements

| Sprint | Key Activities | Deliverables |
|---|---|---|
| S3 | Requirements elicitation (interviews, workshops) | Meeting Notes, Elicitation Report |
| S4 | BRD drafting, stakeholder review | BRD v1.0 (Final) |

### Milestone 3 — Requirements Analysis `M3`
**Duration:** Sprint 5–6 | **Goal:** Break down requirements into actionable specifications

| Sprint | Key Activities | Deliverables |
|---|---|---|
| S5 | Use case modeling, user story writing | Use Case Diagrams, User Stories (backlog) |
| S6 | SRS drafting, acceptance criteria definition | SRS v1.0, Acceptance Criteria |

### Milestone 4 — Design Specification `M4`
**Duration:** Sprint 7–8 | **Goal:** Produce UI specs and data models

| Sprint | Key Activities | Deliverables |
|---|---|---|
| S7 | Wireframe creation, UI flow documentation | Wireframes, Navigation Flows |
| S8 | Data dictionary, non-functional requirements | Data Dictionary, NFR Specification |

### Milestone 5 — Review & Sign-off `M5`
**Duration:** Sprint 9–10 | **Goal:** QA, traceability, final package

| Sprint | Key Activities | Deliverables |
|---|---|---|
| S9 | Test case writing, RTM creation | Test Cases, RTM v1.0 |
| S10 | Final review, document packaging, retrospective | Final Document Package, Retrospective Report |

---

## GitHub Workflow

### Golden Rule

> **No document merges to `main` without BA Lead approval.**
> Branch protection is enforced: minimum 1 approving review required from BA Lead.

### Workflow Steps

```
1. Pick an issue from the board
2. Create a branch from `develop` (see naming convention below)
3. Write / update the document
4. Open a Pull Request → fill out the PR template
5. Request review from BA Lead
6. Address review comments
7. BA Lead approves → merge to develop
8. At milestone end → BA Lead merges develop → main
```

### Branch Strategy

```
main          ← production-ready, signed-off documents only
  └── develop ← integration branch, always ahead of main
        └── feature/... ← individual work branches
```

---

## Branch Naming Convention

```
<type>/<sprint>/<short-description>

Types:
  feat     → new document or major section
  update   → revision to existing document
  review   → review cycle changes
  fix      → correction after feedback
  chore    → repo maintenance (templates, scripts)

Examples:
  feat/s1-stakeholder-register
  update/s4-brd-section-3
  review/s6-srs-peer-review
  fix/s5-use-case-UC-004
```

---

## Commit Convention

```
<type>(<scope>): <short description>

Types:   feat | update | review | fix | chore | docs
Scope:   brd | srs | us | wf | dd | uc | bpd | tc | rtm | charter

Examples:
  feat(brd): add Section 4 - Functional Requirements
  update(srs): revise NFR-007 based on BA Lead feedback
  fix(us): correct acceptance criteria for US-012
  chore: update PR template with new checklist item
```

---

## Labels Reference

### Priority
| Label | Color | Meaning |
|---|---|---|
| `P1-Critical` | `#B60205` | Blocks milestone delivery |
| `P2-High` | `#E4E669` | Must complete this sprint |
| `P3-Medium` | `#0075CA` | Important, not blocking |
| `P4-Low` | `#CFD3D7` | Nice to have |

### Document Type
| Label | Color | Meaning |
|---|---|---|
| `type:BRD` | `#D4C5F9` | Business Requirements Document |
| `type:SRS` | `#C2E0C6` | Software Requirements Spec |
| `type:User-Story` | `#FEF2C0` | User Story + Acceptance Criteria |
| `type:Wireframe` | `#F9D0C4` | UI wireframe or flow |
| `type:Test-Case` | `#BFD4F2` | Test case document |
| `type:Process-Diagram` | `#E6E6E6` | BPMN or process flow |
| `type:Data-Dictionary` | `#FBCA04` | Data model or DD entry |
| `type:Use-Case` | `#B4A8D1` | Use case diagram or description |

### Status
| Label | Color | Meaning |
|---|---|---|
| `status:Draft` | `#EDEDED` | Work in progress |
| `status:In-Review` | `#FFD700` | Awaiting peer or lead review |
| `status:Needs-Revision` | `#E99695` | Review comments require changes |
| `status:Approved` | `#0E8A16` | Signed off by BA Lead |

### Sprint
| Label | Color | Meaning |
|---|---|---|
| `sprint:1` through `sprint:10` | `#1D76DB` | Sprint assignment |

### Area
| Label | Color | Meaning |
|---|---|---|
| `area:Functional` | `#5319E7` | Functional requirement |
| `area:Non-Functional` | `#006B75` | NFR (performance, security, etc.) |
| `area:UI-UX` | `#F1A340` | Interface or UX concern |
| `area:Data` | `#84B6EB` | Data modeling or flow |
| `area:Compliance` | `#CC317C` | Regulatory or legal requirement |

---

## Getting Started

### Prerequisites

- Git installed ([git-scm.com](https://git-scm.com))
- GitHub account with access to this repository
- Access granted by BA Lead (`@unkaidev`)

### Clone the Repository

```bash
git clone https://github.com/nhomba2606/MockProject_062026_Team_BA.git
cd MockProject_062026_Team_BA
```

### Set Up Environment

```bash
cp .env.example .env
# Open .env and fill in your GITHUB_TOKEN
```

---

## Environment Setup

The `.env` file stores credentials used by automation scripts (label/milestone setup). It is **never committed** — `.gitignore` enforces this.

```env
GITHUB_TOKEN=ghp_xxxx...   ← your personal access token
GITHUB_OWNER=nhomba2606
GITHUB_REPO=MockProject_062026_Team_BA
```

Required token scopes: `repo`, `write:org`

To run the GitHub setup script (creates labels + milestones automatically):

```powershell
# Windows PowerShell
.\scripts\setup_github.ps1
```

---

*Maintained by BA Lead — Kiều Quang Vân | Team MockProject_062026*
