# NHMS — MVP Screen Inventory
> Version: 1.1 · Date: 2026-06-29  
> Scope: P1 modules — M1 (Intake & EHR) · M2 (Care Planning) · M3 (eMAR) · M7 (Incident & Risk)  
> Actors in scope: Nurse (RN/LPN) · CNA · DON · Admission Staff · System Admin

---

## Cách Đọc tài liệu này

- **Góc nhìn User** = clinical & operational users (Nurse, CNA, DON, Admission Staff)
- **Góc nhìn Admin** = System Administrator (quản lý hệ thống, không thực hiện care workflow)
- **Screen ID** = `[Module]-[Role prefix]-[Seq]` (ví dụ: `M1-US-01`)
- **Core** = ★ màn hình trong critical path của Normal Course · ☆ = secondary (alternative/edge flow hoặc nice-to-have)

---

## ★ CORE SCREEN SUMMARY (27 màn hình)

> Đây là tập màn hình tối thiểu để demo end-to-end flow của 4 P1 modules.  
> Build core trước; secondary bổ sung khi thời gian cho phép.

### User (19 màn hình core)

| Screen ID | Screen Name | Module |
|---|---|---|
| M1-US-01 | Resident List | M1 |
| M1-US-02 | Resident Profile — Detail | M1 |
| M1-US-03 | Create / Edit Resident Profile | M1 |
| M1-US-04 | Pre-Admission Screening | M1 |
| M1-US-05 | Admission Form | M1 |
| M1-US-06 | Initial Assessment Form | M1 |
| M1-US-08 | LOC Classification Result | M1 |
| M2-US-01 | Care Plan — Create / Edit | M2 |
| M2-US-02 | Care Plan — Detail View | M2 |
| M2-US-05 | Daily Task List (CNA Dashboard) | M2 |
| M2-US-06 | Task Completion Log | M2 |
| M3-US-01 | Medication Administration Dashboard | M3 |
| M3-US-02 | Med-Pass — Barcode Scan | M3 |
| M3-US-03 | Verification Override | M3 |
| M3-US-04 | Medication Administration Record | M3 |
| M3-US-06 | Medication Order List | M3 |
| M7-US-01 | Report New Incident | M7 |
| M7-US-02 | Incident — Chart Lock Confirmation | M7 |
| M7-US-04 | Incident List | M7 |

### Admin (8 màn hình core)

| Screen ID | Screen Name | Section |
|---|---|---|
| AD-01 | User List | User Mgmt |
| AD-02 | Create / Edit User | User Mgmt |
| AD-05 | Facility Settings | Config |
| AD-06 | LOC Rate Table | Config |
| AD-07 | Staffing Ratio Configuration | Config |
| AD-08 | Incident Severity Levels | Config |
| AD-09 | SLA Configuration | Config |
| AD-10 | Demo Data Seeder | Data |

---

## 🔵 GÓC NHÌN USER (Clinical & Operational)

---

### MODULE M1 — Intake & EHR

#### Sub-module: Resident Profile

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M1-US-01 | Resident List | ★ | Admission Staff / Nurse / DON | Login → Home | Search, filter by status (Active/Discharged/Pending), click vào resident |
| M1-US-02 | Resident Profile — Detail | ★ | All clinical actors | Click resident từ M1-US-01 | Xem demographics, POA/DNR, diagnosis, allergy, payer source, LOC |
| M1-US-03 | Create / Edit Resident Profile | ★ | Admission Staff | "Add New Resident" button | Nhập họ tên, DOB, emergency contact, POA/DNR, payer source |

#### Sub-module: Admission & Initial Assessment

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M1-US-04 | Pre-Admission Screening | ★ | Admission Staff | "New Admission" flow | Nhập clinical needs, kiểm tra BR-06 → Pass/Flag |
| M1-US-05 | Admission Form | ★ | Admission Staff | Pass pre-admission screening | Nhập admission date, room, payer source, signed consents |
| M1-US-06 | Initial Assessment Form | ★ | Nurse (RN) | After admission confirmed | ADL/IADL scoring, diagnosis, allergies, vitals, cognitive status |
| M1-US-07 | Assessment History | ☆ | Nurse / DON | Profile → "Assessments" tab | Danh sách assessment lần trước, view version, so sánh |

#### Sub-module: Care Level Classification

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M1-US-08 | LOC Classification Result | ★ | Nurse / DON | After assessment saved | Suggested LOC (formula ADL score), Confirm / Override với lý do |
| M1-US-09 | LOC History | ☆ | DON | Profile → "LOC" tab | Timeline thay đổi LOC, actor + timestamp |

---

### MODULE M2 — Care Planning

#### Sub-module: Care Plan Management

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M2-US-01 | Care Plan — Create / Edit | ★ | Nurse / DON | After LOC confirmed | Thêm goals, interventions (free-text), assign care tasks |
| M2-US-02 | Care Plan — Detail View | ★ | Nurse / CNA / DON | Profile → "Care Plan" tab | Xem active care plan, trạng thái goals, ngày review tiếp |
| M2-US-03 | Care Plan — Reassessment Trigger | ☆ | DON / Nurse | Sau 90 ngày (BR-03) hoặc manual flag | Nhận alert, mở form reassessment → link sang M1-US-06 |
| M2-US-04 | Significant Change in Status Flag | ☆ | DON / Nurse | Button trong profile | Đặt flag SCS, nhập lý do, kích hoạt 90-day timer |

#### Sub-module: Daily Care Task Management

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M2-US-05 | Daily Task List (CNA Dashboard) | ★ | CNA | Login → Home / shift start | Tasks hôm nay theo resident (vitals, bathing, repositioning…) |
| M2-US-06 | Task Completion Log | ★ | CNA | Tap task trong M2-US-05 | Check done, nhập ghi chú, flag "abnormal condition" |
| M2-US-07 | Abnormal Condition Report | ☆ | CNA | Flag abnormal trong M2-US-06 | Nhập mô tả, severity, gửi alert lên Nurse/DON |
| M2-US-08 | Task Overview (Nurse/DON) | ☆ | Nurse / DON | Shift supervisor view | Completion rate theo resident, filter missed tasks, reassign |

---

### MODULE M3 — eMAR (Medication Management)

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M3-US-01 | Medication Administration Dashboard | ★ | Nurse (RN/LPN) | Login → eMAR section | Residents cần med-pass trong ca, color-coded urgency |
| M3-US-02 | Med-Pass — Barcode Scan | ★ | Nurse | Chọn resident từ M3-US-01 | Scan barcode (webcam), xác minh 5 Rights: Resident · Drug · Dose · Route · Time |
| M3-US-03 | Verification Override | ★ | Nurse | Barcode mismatch / out-of-window | Chọn override reason, xác nhận → ghi audit log (NFR-02) |
| M3-US-04 | Medication Administration Record | ★ | Nurse / DON | Profile → "eMAR" tab | Timeline: given / missed / refused / override mỗi dose |
| M3-US-05 | Missed / Refused Dose Log | ☆ | Nurse | Đánh dấu "missed" hoặc "refused" | Nhập lý do, ghi vào eMAR history |
| M3-US-06 | Medication Order List | ★ | Nurse / DON | Profile → "Medications" tab | Thuốc active, dosage, route, frequency, prescriber |
| M3-US-07 | Allergy Alert Banner | ☆ | Nurse | Auto khi mở med-pass | Known allergies của resident (persistent, color đỏ) — component trong M3-US-02 |

---

### MODULE M7 — Incident & Risk Management

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| M7-US-01 | Report New Incident | ★ | Nurse / CNA / DON | "Report Incident" button (global) | Nhập type, description, resident, severity, time |
| M7-US-02 | Incident — Chart Lock Confirmation | ★ | Nurse / DON | Auto-triggered on save (BR-07) | Thông báo "Chart locked at [timestamp]", confirm |
| M7-US-03 | Incident Detail & Timeline | ☆ | Nurse / DON | Click incident từ list | Full incident record, status, follow-up, attachments |
| M7-US-04 | Incident List | ★ | DON | "Incidents" nav section | Filter by status, date, severity |
| M7-US-05 | SLA Timer View | ☆ | DON | Incident open | Đếm ngược 24h/48h (NFR-06), color alert khi gần hạn — widget trong M7-US-04 |
| M7-US-06 | Submit External Report (Simulated) | ☆ | DON | "Mark as Reported" button | Đánh dấu đã báo cáo; trạng thái → "Submitted"; không gửi thực |
| M7-US-07 | Chart Unlock (Override) | ☆ | DON | Unlock button trong locked chart | Nhập lý do, xác nhận, ghi audit log |

---

### CROSS-MODULE — Shared Screens (User)

| Screen ID | Screen Name | Core | Primary Actor | Trigger | Key Actions |
|---|---|---|---|---|---|
| SH-US-01 | Home / Dashboard (Clinical) | ☆ | Nurse / CNA / DON | Login | Widget: tasks due, pending meds, open incidents, alerts |
| SH-US-02 | Notifications / Alert Center | ☆ | All users | Bell icon | Alerts: missed task, SLA approaching, LOC change, locked chart |
| SH-US-03 | Audit Log — View (read-only) | ☆ | DON | Profile → "Audit" tab | Timeline actions: who · what · when |
| SH-US-04 | Resident Search | ☆ | All users | Search bar | Full-text search theo tên, room, ID |

> **Note:** SH-US-01 không đánh Core vì mỗi actor có landing screen riêng (CNA → M2-US-05, Nurse → M3-US-01). Dashboard tổng hợp là secondary enhancement.

---

## 🟢 GÓC NHÌN ADMIN (System Administrator)

> System Admin không thực hiện clinical workflow. Scope: accounts, roles, configuration, audit access.

---

### SECTION A — User & Role Management

| Screen ID | Screen Name | Core | Trigger | Key Actions |
|---|---|---|---|---|
| AD-01 | User List | ★ | Admin → "Users" | Xem tất cả accounts, status, role, last login |
| AD-02 | Create / Edit User | ★ | "Add User" / click user | Nhập tên, email, assign role (CNA/Nurse/DON/NHA/Billing), set status |
| AD-03 | Role & Permission Matrix | ☆ | Admin → "Roles" | Xem bảng Role × Permission (read-only) |
| AD-04 | Deactivate / Reactivate User | ☆ | Actions menu trong AD-01 | Soft-delete account; không xóa lịch sử |

---

### SECTION B — Facility & Configuration

| Screen ID | Screen Name | Core | Trigger | Key Actions |
|---|---|---|---|---|
| AD-05 | Facility Settings | ★ | Admin → "Facility" | Tên facility, `facility_id`, timezone, target state (California) |
| AD-06 | LOC Rate Table | ★ | Admin → "LOC Rates" | CRUD bảng LOC → daily rate; seed sample values |
| AD-07 | Staffing Ratio Configuration | ★ | Admin → "Compliance Config" | Nhập threshold BR-01 (CA: 3.5 hrs/resident/day) |
| AD-08 | Incident Severity Levels | ★ | Admin → "Incident Config" | Severity levels + ngưỡng kích hoạt chart-lock (NFR-03) |
| AD-09 | SLA Configuration | ★ | Admin → "SLA Config" | Deadline incident reporting: 24h / 48h (NFR-06) |

---

### SECTION C — Data & Seeding

| Screen ID | Screen Name | Core | Trigger | Key Actions |
|---|---|---|---|---|
| AD-10 | Demo Data Seeder | ★ | Admin → "Dev Tools" | Load fixture CSV/JSON (~20 residents, sample meds, incidents) |
| AD-11 | Export Data | ☆ | Admin → "Export" | Xuất CSV/PDF: Resident List, Incident Log |

---

### SECTION D — Audit & Security

| Screen ID | Screen Name | Core | Trigger | Key Actions |
|---|---|---|---|---|
| AD-12 | Audit Log — Full View | ☆ | Admin → "Audit" | Filter by user, action, date range; append-only |
| AD-13 | Active Sessions | ☆ | Admin → "Security" | Sessions đang active, force-logout |
| AD-14 | Password Reset | ☆ | User management | Reset password; send temp link (simulated) |

---

## Tổng kết Screen Count

| Góc nhìn | Module / Section | Core | Secondary | Tổng |
|---|---|---|---|---|
| **User** | M1 — Intake & EHR | 6 | 3 | 9 |
| **User** | M2 — Care Planning | 4 | 4 | 8 |
| **User** | M3 — eMAR | 5 | 2 | 7 |
| **User** | M7 — Incident & Risk | 3 | 4 | 7 |
| **User** | Cross-module Shared | 0 | 4 | 4 |
| **Admin** | User & Role Management | 2 | 2 | 4 |
| **Admin** | Facility & Configuration | 5 | 0 | 5 |
| **Admin** | Data & Seeding | 1 | 1 | 2 |
| **Admin** | Audit & Security | 0 | 3 | 3 |
| | **Tổng** | **26** | **23** | **49** |

---

## Notes cho Phase 2

- **Build order gợi ý:** Core screens trước → secondary bổ sung theo sprint capacity.
- "UC đầu tiên viết spec: **Admit Resident**" → critical path: M1-US-04 → M1-US-05 → M1-US-06 → M1-US-08 → M2-US-01.
- Screen có `BR-xx` / `NFR-xx` tag → ghi rõ trong **Preconditions / Special Requirements** của UC spec.
- M3-US-07 và M7-US-05 là **components/widgets** nằm trong màn hình cha — không cần route riêng.

---

*NHMS MVP Screen Inventory v1.1 · 49 screens (26 core · 23 secondary) · 2 perspectives (User / Admin)*
