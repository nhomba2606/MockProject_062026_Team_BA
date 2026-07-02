# NHMS – FLOW ANALYSIS DOCUMENT



## MODULE: ADMIN CONFIG \& DATA FLOW



# 1\. MODULE OVERVIEW

## 1.1 Business Purpose

Admin module trong NHMS là lớp cấu hình hệ thống trung tâm (system control layer), chịu trách nhiệm định nghĩa toàn bộ business rules, pricing rules, compliance rules và operational constraints.

Các cấu hình trong Admin ảnh hưởng trực tiếp đến:

* M1: Intake, assessment, LOC classification
* M2: Care planning và task generation
* M6: Billing và revenue calculation
* M7: Incident management, SLA và compliance

Admin không tham gia vào nghiệp vụ chăm sóc, nhưng quyết định cách toàn bộ hệ thống vận hành.



## 1.2 Actors

|Actor|Mô tả|
|-|-|
|System Administrator|Quản trị hệ thống|
|Facility Manager|Quản lý cơ sở|
|Compliance Officer|Giám sát quy định|
|Billing Admin|Quản lý giá và LOC|



## 1.3 Cross-module Impact Summary

|Admin Configuration|Ảnh hưởng|
|-|-|
|User \& Role|RBAC toàn hệ thống|
|LOC Rate Table|M1 LOC + Billing|
|Staffing Ratio|M2 task workload + compliance|
|Incident Severity|M7 escalation + chart lock|
|SLA Configuration|M7 deadline xử lý|
|Facility Settings|Admission, timezone, capacity, audit|



# 2\. SCREEN FLOW ANALYSIS



# 2.1 AD-01 – User Management

## Business Purpose

Quản lý toàn bộ tài khoản người dùng trong hệ thống, đảm bảo phân quyền truy cập theo vai trò và tuân thủ HIPAA.

## Actors

* System Administrator

## Trigger

Admin truy cập màn hình quản lý người dùng

## Preconditions

* Admin đã đăng nhập
* Có quyền USER\_MANAGEMENT

## Main Flow

1. Hệ thống hiển thị danh sách user theo facility
2. Admin tìm kiếm hoặc lọc theo role/status
3. Admin chọn tạo mới, chỉnh sửa hoặc vô hiệu hóa user
4. Hệ thống cập nhật trạng thái user
5. Ghi nhận audit log

## Decision Points

* User có đang tham gia care plan không
* Role có hợp lệ không
* User có bị ràng buộc bởi active assignment không

## Input Data

* Tên
* Email
* Role
* Trạng thái
* Thông tin chứng chỉ (nếu có)

## Output Data

* User record được tạo hoặc cập nhật
* Role mapping được lưu
* Audit log được ghi

## System Updates

* Cập nhật RBAC engine
* Cập nhật permission token
* Áp dụng quyền mới toàn hệ thống

## Edge Cases

* Email trùng
* Vô hiệu hóa user đang có task active
* Role không hợp lệ
* Session chưa bị revoke sau khi disable user

## Cross-module Dependencies

* M2: phân công CNA task
* M3: quyền thực hiện medication
* M7: quyền báo cáo incident
* Billing: phân bổ chi phí nhân sự



# 2.2 AD-02 – Create/Edit User

## Business Purpose

Tạo hoặc cập nhật tài khoản người dùng và gán quyền truy cập hệ thống.

## Actors

* System Administrator

## Trigger

Admin chọn tạo mới hoặc chỉnh sửa user

## Preconditions

* Có quyền USER\_WRITE
* Email chưa tồn tại (trường hợp tạo mới)

## Main Flow

1. Admin nhập thông tin user
2. Hệ thống kiểm tra email trùng
3. Hệ thống kiểm tra role hợp lệ
4. Gán role và thông tin chứng chỉ
5. Lưu user vào hệ thống
6. Gửi email kích hoạt tài khoản

## Decision Points

* Role có yêu cầu license không
* User thuộc clinical hay non-clinical
* Có cần xác thực bổ sung không

## Input Data

* Họ tên
* Email
* Số điện thoại
* Role
* License (nếu có)

## Output Data

* User profile được tạo hoặc cập nhật
* Token kích hoạt được sinh ra
* Email notification được gửi

## System Updates

* RBAC table cập nhật
* Audit log ghi nhận thay đổi
* Notification service kích hoạt

## Edge Cases

* Email không gửi được
* Thiếu license cho role clinical
* Role không được phép gán
* Partial save failure

## Cross-module Dependencies

* M1: assignment nurse/caregiver
* M2: task assignment
* M7: incident authority
* Billing: cost allocation



# 2.3 AD-05 – Facility Settings

## Business Purpose

Cấu hình thông tin facility ảnh hưởng toàn bộ vận hành hệ thống như admission, billing, SLA và compliance.

## Actors

* System Admin
* Facility Manager

## Trigger

Admin mở cấu hình facility

## Preconditions

* Facility đã tồn tại trong hệ thống

## Main Flow

1. Hệ thống tải thông tin facility
2. Admin chỉnh sửa thông tin (name, address, timezone, capacity)
3. Hệ thống kiểm tra ràng buộc dữ liệu
4. Lưu cấu hình mới
5. Phát sự kiện cập nhật toàn hệ thống

## Decision Points

* Capacity nhỏ hơn số resident hiện tại
* Thay đổi timezone có ảnh hưởng dữ liệu lịch sử không
* State compliance có thay đổi không

## Input Data

* Facility name
* Address
* State
* Timezone
* Bed capacity

## Output Data

* Facility configuration được cập nhật
* System configuration event được phát

## System Updates

* Cập nhật logic timestamp toàn hệ thống
* Điều chỉnh rule admission (M1)
* Điều chỉnh staffing baseline (M2)
* Điều chỉnh SLA calculation (M7)

## Edge Cases

* Giảm capacity dưới census hiện tại
* Sai timezone gây sai SLA
* State không hợp lệ
* Data inconsistency sau update

## Cross-module Dependencies

* M1: admission validation
* M2: staffing calculation
* M7: incident timestamp và SLA
* Billing: cost baseline



# 2.4 AD-06 – LOC Rate Table

## Business Purpose

Định nghĩa Level of Care (LOC) và giá tương ứng phục vụ billing và phân loại mức độ chăm sóc.

## Actors

* Billing Admin
* System Admin

## Main Flow

1. Hệ thống hiển thị danh sách LOC
2. Admin cập nhật rate theo từng level
3. Hệ thống kiểm tra effective date
4. Lưu cấu hình pricing
5. Cập nhật billing engine

## Decision Points

* Có overlap effective date không
* Rate có hợp lệ không
* Có ảnh hưởng billing hiện tại không

## Input Data

* LOC level
* Daily rate
* Effective date
* Expiry date

## Output Data

* LOC pricing updated
* Billing mapping updated

## System Updates

* M1 LOC classification mapping cập nhật
* Billing engine recalculation

## Edge Cases

* Rate âm hoặc bằng 0
* Overlapping LOC configuration
* Retroactive pricing change

## Cross-module Dependencies

* M1: LOC classification
* M6: billing calculation
* M2: care workload estimation



# 2.5 AD-07 – Staffing Ratio Configuration

## Business Purpose

Xác định tỷ lệ nhân sự trên số resident để đảm bảo an toàn và compliance.

## System Impact

* M2 task distribution
* M7 risk scoring (thiếu nhân sự tăng nguy cơ incident)
* Billing cost model

## Edge Cases

* Ratio vượt quy định state
* Census vượt khả năng staffing
* Rule thay đổi trong ca đang chạy



# 2.6 AD-08 – Incident Severity Configuration

## Business Purpose

Định nghĩa mức độ nghiêm trọng của incident và cách hệ thống xử lý.

## System Impact

* Chart lock behavior (M7)
* SLA escalation
* Notification priority

## Edge Cases

* Xóa severity đang được sử dụng
* Severity không có SLA mapping
* Mismatch giữa severity và clinical reality



# 2.7 AD-09 – SLA Configuration

## Business Purpose

Định nghĩa thời gian xử lý và báo cáo incident theo quy định (24–48h).

## System Impact

* SLA countdown M7
* Escalation logic
* Compliance reporting

## Edge Cases

* SLA thay đổi sau khi incident tạo
* Sai timezone làm sai countdown
* Incident đã overdue khi config thay đổi



# 2.8 AD-10 – Data Seeder

## Business Purpose

Tạo dữ liệu mẫu cho môi trường test/demo hệ thống.

## System Behavior

* Tạo resident giả lập
* Tạo incident mẫu
* Tạo care plan mẫu

## Edge Cases

* Seed trùng dữ liệu
* Chạy nhiều lần gây duplicate
* Không cho chạy trong production
* Thiếu dependency dữ liệu (foreign key mismatch)



# 3\. CROSS-MODULE DEPENDENCIES

|Admin Component|Ảnh hưởng|
|-|-|
|User Management|RBAC toàn hệ thống|
|Facility Settings|Admission, SLA, Billing base|
|LOC Rate Table|M1 + Billing engine|
|Staffing Ratio|M2 workload + compliance|
|Severity Config|M7 escalation logic|
|SLA Config|Incident deadline system|



# 4\. SYSTEM STATE IMPACT

Admin configuration ảnh hưởng trực tiếp đến:

* Resident admission eligibility
* Care plan workload distribution
* Incident lifecycle timing
* Billing accuracy
* Compliance reporting deadlines







## MODULE: M1 – TIẾP NHẬN \& HỒ SƠ SỨC KHỎE (INTAKE \& EHR)



# 1\. TỔNG QUAN MODULE

## 1.1 Mục đích nghiệp vụ

Module M1 chịu trách nhiệm chuyển đổi một người đăng ký (applicant) thành **resident hợp lệ trong hệ thống NHMS**.

Đây là module nền tảng vì nó tạo ra:

* Hồ sơ nhân khẩu học (Demographic Data)
* Hồ sơ pháp lý (Legal Record)
* Hồ sơ y tế ban đầu (Clinical Baseline)
* Dữ liệu đầu vào cho LOC, Care Plan, Billing và Staffing



## 1.2 Mục tiêu chính của module

* Quản lý toàn bộ vòng đời nhập viện (Admission lifecycle)
* Thu thập dữ liệu y tế ban đầu (EHR Intake)
* Thực hiện đánh giá lâm sàng (Clinical Assessment)
* Xác định mức chăm sóc (Level of Care – LOC)
* Kiểm soát khả năng tiếp nhận của cơ sở



## 1.3 Vai trò (Actors)

|Vai trò|Mô tả|
|-|-|
|Nhân viên tiếp nhận (Admission Staff)|Tạo hồ sơ, xử lý admission|
|Điều dưỡng (Nurse RN/LVN)|Thực hiện đánh giá lâm sàng|
|Giám đốc điều dưỡng (DON)|Duyệt và xác nhận dữ liệu lâm sàng|
|Quản trị hệ thống|Cấu hình quy tắc|
|Hệ thống|Tự động xử lý logic, tính toán LOC|



## 1.4 Mô hình trạng thái Resident (Lifecycle)

Resident trong M1 đi qua các trạng thái:

* Ứng viên (Candidate)
* Đang sàng lọc (Pre-Admission Screening)
* Được chấp nhận (Accepted)
* Bị từ chối (Rejected)
* Đã nhập viện (Active Resident)
* Đang đánh giá (Under Assessment)
* Chờ xác định LOC (LOC Pending)



# 2\. LUỒNG NGHIỆP VỤ TỔNG THỂ (END-TO-END)

## 2.1 Luồng nhập viện chuẩn

1. Tạo hồ sơ resident (Candidate)
2. Sàng lọc trước nhập viện (Pre-Admission Screening)
3. Quyết định nhập viện (Chấp nhận / Từ chối)
4. Tạo hồ sơ nhập viện chính thức (Admission Form)
5. Thực hiện đánh giá lâm sàng ban đầu (Initial Assessment)
6. Tính toán LOC
7. Kích hoạt resident chính thức trong hệ thống



## 2.2 Luồng thất bại (Failure Flow)

* Không đạt điều kiện lâm sàng → từ chối nhập viện
* Không đủ giường → đưa vào trạng thái chờ
* Bảo hiểm không hợp lệ → từ chối
* Rủi ro cao → chuyển DON review



# 3\. PHÂN TÍCH LUỒNG THEO MÀN HÌNH



# 3.1 M1-US-01 – Danh sách Resident

## Mục đích nghiệp vụ

Hiển thị toàn bộ danh sách người đang là ứng viên hoặc resident trong hệ thống.

## Vai trò sử dụng

* Nhân viên tiếp nhận
* Điều dưỡng
* Giám đốc điều dưỡng

## Trigger

Người dùng truy cập module M1

## Điều kiện trước

* Người dùng đã đăng nhập
* Có quyền truy cập module M1

## Luồng chính

1. Hệ thống tải danh sách resident theo facility
2. Lọc theo trạng thái (Candidate / Active / Discharged)
3. Người dùng tìm kiếm theo tên hoặc mã
4. Chọn resident để xem chi tiết
5. Hệ thống hiển thị hồ sơ tương ứng

## Điểm quyết định

* Người dùng có quyền xem thông tin nhạy cảm không
* Resident có bị khóa do sự cố không

## Dữ liệu đầu vào

* Bộ lọc tìm kiếm
* Trạng thái
* Loại bảo hiểm

## Dữ liệu đầu ra

* Danh sách resident
* Thông tin hồ sơ hiển thị theo quyền

## Hành vi hệ thống

* Áp dụng phân quyền (RBAC)
* Ẩn dữ liệu nhạy cảm theo vai trò

## Trường hợp ngoại lệ

* Không tìm thấy dữ liệu
* Không có quyền truy cập
* Dữ liệu trùng lặp

## Ảnh hưởng module khác

* M2: phân công care plan
* M7: truy xuất lịch sử sự cố
* Billing: xác định payer



# 3.2 M1-US-03 – Tạo / Chỉnh sửa Resident

## Mục đích nghiệp vụ

Tạo hồ sơ pháp lý và thông tin cơ bản cho người được tiếp nhận.

## Vai trò sử dụng

* Nhân viên tiếp nhận

## Trigger

Tạo resident mới

## Điều kiện trước

* Có quyền tạo hồ sơ
* Cơ sở còn khả năng tiếp nhận

## Luồng chính

1. Nhập thông tin cá nhân
2. Kiểm tra trùng lặp (tên + DOB + SSN)
3. Tạo hồ sơ candidate
4. Kích hoạt luồng sàng lọc trước nhập viện

## Điểm quyết định

* Có trùng hồ sơ không
* Thiếu thông tin pháp lý không

## Dữ liệu đầu vào

* Họ tên
* Ngày sinh
* SSN/MRN
* Người liên hệ
* Bảo hiểm
* Nguồn giới thiệu

## Dữ liệu đầu ra

* Hồ sơ candidate
* Trạng thái Pre-Admission

## Hành vi hệ thống

* Sinh mã resident ID
* Tạo audit log
* Kích hoạt workflow sàng lọc

## Ngoại lệ

* Trùng hồ sơ
* Thiếu POA
* Sai định dạng dữ liệu

## Ảnh hưởng module khác

* M7: audit
* M2: chuẩn bị care plan
* Billing: payer setup



# 3.3 M1-US-04 – Sàng lọc trước nhập viện

## Mục đích nghiệp vụ

Đánh giá khả năng cơ sở có thể tiếp nhận bệnh nhân hay không.

## Vai trò

* Nhân viên tiếp nhận
* Điều dưỡng
* DON (khi cần review)

## Trigger

Sau khi tạo hồ sơ candidate

## Điều kiện trước

* Resident ở trạng thái Candidate

## Luồng chính

1. Đánh giá tình trạng lâm sàng
2. Kiểm tra khả năng cơ sở
3. Kiểm tra bảo hiểm
4. Ra quyết định: Chấp nhận / Từ chối / Cần review
5. Cập nhật trạng thái resident

## Điểm quyết định

* Có đủ năng lực chăm sóc không
* Có giường trống không
* Bảo hiểm có hợp lệ không

## Dữ liệu đầu vào

* Thông tin lâm sàng
* Tình trạng giường
* Bảo hiểm

## Dữ liệu đầu ra

* Quyết định sàng lọc
* Trạng thái resident cập nhật

## Hành vi hệ thống

* Tự động chấm điểm mức độ phù hợp
* Gửi cảnh báo DON nếu rủi ro cao

## Ngoại lệ

* Thiếu dữ liệu bệnh viện
* Trùng hồ sơ
* Thay đổi capacity trong lúc xử lý

## Ảnh hưởng module khác

* M2: chỉ resident được chấp nhận mới vào care plan
* Billing: kiểm tra payer



# 3.4 M1-US-05 – Phiếu nhập viện

## Mục đích nghiệp vụ

Xác nhận chính thức việc nhập viện và tạo resident chính thức.

## Vai trò

* Nhân viên tiếp nhận
* DON

## Trigger

Sau khi sàng lọc thành công

## Điều kiện trước

* Screening = Accepted

## Luồng chính

1. Gán phòng
2. Gán ngày nhập viện
3. Thu thập chữ ký điện tử
4. Xác nhận thông tin cuối cùng
5. Kích hoạt resident

## Điểm quyết định

* Phòng còn trống không
* Đã ký e-sign chưa
* Ngày nhập viện hợp lệ không

## Dữ liệu đầu vào

* Phòng
* Ngày nhập viện
* Chữ ký điện tử
* Payer

## Dữ liệu đầu ra

* Resident chính thức
* Hợp đồng nhập viện

## Hành vi hệ thống

* Khóa hồ sơ sau ký
* Tạo audit trail

## Ngoại lệ

* Thiếu chữ ký
* Trùng phòng
* Hủy nhập viện giữa chừng

## Ảnh hưởng module khác

* M2: khởi tạo care plan
* M7: audit compliance
* Billing: ngày bắt đầu tính phí



# 3.5 M1-US-06 – Đánh giá lâm sàng ban đầu

## Mục đích nghiệp vụ

Thu thập dữ liệu y tế nền để xác định nhu cầu chăm sóc và LOC.

## Vai trò

* Điều dưỡng (RN)
* DON

## Trigger

Sau khi nhập viện

## Điều kiện trước

* Resident đang ở trạng thái Active

## Luồng chính

1. Thu thập ADL/IADL
2. Đánh giá nguy cơ (té ngã, loét, nhận thức)
3. Nhập dữ liệu y tế
4. Hệ thống tính điểm rủi ro
5. Điều dưỡng submit
6. DON duyệt

## Điểm quyết định

* Đủ dữ liệu hay chưa
* Rủi ro cao có cần escalation không
* Có cần đánh giá lại không

## Dữ liệu đầu vào

* ADL score
* Tình trạng y tế
* Nhận thức
* Rủi ro lâm sàng

## Dữ liệu đầu ra

* Hồ sơ đánh giá
* Risk score
* Dữ liệu đầu vào LOC

## Hành vi hệ thống

* Tự động tính risk score
* Kiểm soát deadline 14 ngày (MDS)

## Ngoại lệ

* Trễ quá 14 ngày
* Thiếu dữ liệu
* Mâu thuẫn dữ liệu nurse vs DON

## Ảnh hưởng module khác

* M2: tạo care plan
* M7: cảnh báo an toàn
* Billing: input LOC



# 3.6 M1-US-08 – Xác định mức chăm sóc (LOC)

## Mục đích nghiệp vụ

Xác định mức chăm sóc (Level of Care) dựa trên dữ liệu đánh giá.

## Vai trò

* Hệ thống (tự động)
* DON (duyệt hoặc ghi đè)

## Trigger

Sau khi hoàn tất assessment

## Điều kiện trước

* Có assessment hoàn chỉnh

## Luồng chính

1. Tổng hợp điểm đánh giá
2. Áp dụng rule LOC
3. Đề xuất mức LOC
4. DON xác nhận hoặc chỉnh sửa
5. Lưu LOC chính thức

## Điểm quyết định

* Có override không
* Rule có khớp dữ liệu không

## Dữ liệu đầu vào

* ADL score
* Risk score
* Clinical indicators

## Dữ liệu đầu ra

* LOC level
* Mapping sang rate billing

## Hành vi hệ thống

* Chạy engine tính toán LOC
* Kích hoạt cập nhật billing

## Ngoại lệ

* Không xác định được LOC
* Override không có lý do
* Thiếu rule cấu hình

## Ảnh hưởng module khác

* M2: mức độ care plan
* M6: billing
* Staffing: workload



# 4\. LUỒNG DỮ LIỆU LIÊN MODULE

|Nguồn|Đích|Tác động|
|-|-|-|
|Admission|Resident state|Kích hoạt lifecycle|
|Assessment|LOC|Quyết định billing|
|LOC|Billing|Tính giá|
|Assessment|Care Plan|Sinh task|
|Risk score|M7|Cảnh báo sự cố|



# 5\. THAY ĐỔI TRẠNG THÁI HỆ THỐNG

## Resident

Candidate → Screening → Accepted → Active

## Assessment

Draft → Submitted → Approved

## LOC

Pending → Suggested → Confirmed



# 6\. QUY TẮC NGHIỆP VỤ CHÍNH

* Không thể tạo care plan nếu chưa Active
* Bắt buộc e-sign trước khi activate resident
* Assessment phải hoàn thành trong 14 ngày
* LOC ảnh hưởng trực tiếp billing và staffing
* Tất cả thay đổi phải có audit log



# 7\. KẾT LUẬN MODULE M1

Module M1 là nền tảng trung tâm của hệ thống NHMS, quyết định toàn bộ các luồng phía sau gồm chăm sóc (M2), thanh toán (M6) và sự cố (M7).



## MODULE: M2 – CARE PLANNING FLOW ANALYSIS



# 1\. TỔNG QUAN MODULE

## 1.1 Mục đích nghiệp vụ

Module M2 Care Planning chịu trách nhiệm chuyển đổi dữ liệu lâm sàng từ M1 (Assessment + LOC) thành **kế hoạch chăm sóc có thể thực thi (Actionable Care Plan)**.

Đây là module trung tâm của vận hành chăm sóc, vì nó quyết định:

* CNA làm gì mỗi ngày
* Điều dưỡng theo dõi gì
* Tần suất chăm sóc
* Mức độ can thiệp y tế
* Và gián tiếp ảnh hưởng đến staffing và billing



## 1.2 Mục tiêu chính

* Tạo và quản lý Care Plan
* Phân công nhiệm vụ (CNA Tasks)
* Theo dõi thực thi chăm sóc
* Xử lý bất thường trong chăm sóc
* Đồng bộ với M1, M3, M7 và Billing



## 1.3 Vai trò hệ thống

|Vai trò|Mô tả|
|-|-|
|DON|Duyệt và kiểm soát care plan|
|Nurse|Theo dõi và điều chỉnh|
|CNA|Thực thi nhiệm vụ chăm sóc|
|System|Sinh task tự động, giám sát trạng thái|
|M1 System|Cung cấp assessment \& LOC|
|M7 System|Ghi nhận sự cố và override|



# 2\. MÔ HÌNH TRẠNG THÁI CARE PLAN

Care Plan lifecycle:

* Draft (Bản nháp)
* Pending Review (Chờ DON duyệt)
* Approved (Đã duyệt)
* Active (Đang thực thi)
* On Hold (Tạm dừng do sự cố hoặc thay đổi lâm sàng)
* Reassessment Required (Cần đánh giá lại)
* Archived (Kết thúc)



# 3\. END-TO-END CARE PLANNING FLOW

## 3.1 Luồng tạo care plan

1. Nhận dữ liệu từ M1 Assessment + LOC
2. System tạo care plan draft
3. Gán intervention theo risk score + ADL
4. Sinh task CNA tự động
5. Chuyển DON review
6. DON approve hoặc reject
7. Active care plan



## 3.2 Luồng vận hành hàng ngày

* CNA nhận task theo ca trực
* Thực hiện chăm sóc
* Ghi nhận completion log
* System theo dõi compliance
* Trigger alert nếu bất thường



## 3.3 Luồng bất thường

* CNA bỏ sót task
* Patient refuse care
* Abnormal condition detected
* Trigger M7 Incident
* Care plan chuyển trạng thái On Hold



# 4\. PHÂN TÍCH LUỒNG THEO CHỨC NĂNG



# 4.1 CARE PLAN CREATE / EDIT

## Mục đích nghiệp vụ

Tạo kế hoạch chăm sóc dựa trên dữ liệu lâm sàng từ M1.

## Actors

* System
* DON
* Nurse

## Trigger

* Sau khi LOC được xác nhận
* Hoặc khi reassessment

## Preconditions

* Resident phải ở trạng thái Active
* Có LOC hợp lệ

## Main Flow

1. System lấy dữ liệu M1 (ADL, risk score, diagnosis)
2. Map dữ liệu sang care template
3. Sinh draft care plan
4. Gán intervention (nutrition, mobility, medication support)
5. Tạo danh sách task CNA
6. Chuyển trạng thái Pending Review

## Decision Points

* LOC level cao → tăng tần suất task
* Risk score cao → thêm safety protocol
* Missing data → reject generation

## Input Data

* Assessment data
* LOC level
* Clinical diagnosis
* Risk score

## Output Data

* Care plan draft
* Task list CNA
* Care plan version

## System Behavior

* Auto-generate task engine
* Rule-based mapping từ LOC → care intensity
* Versioning care plan

## Edge Cases

* LOC chưa confirm
* Assessment thiếu dữ liệu
* Duplicate care plan creation

## Cross-module Impact

* M1: nguồn dữ liệu đầu vào
* M3: medication integration
* M7: risk escalation trigger
* Billing: care intensity multiplier



# 4.2 CARE PLAN DETAIL

## Mục đích nghiệp vụ

Hiển thị toàn bộ kế hoạch chăm sóc và trạng thái thực thi.

## Actors

* DON
* Nurse
* CNA

## Trigger

User mở resident care plan

## Preconditions

* Care plan tồn tại

## Main Flow

1. Load care plan version active
2. Hiển thị interventions
3. Hiển thị task status
4. Hiển thị lịch sử chỉnh sửa
5. Theo dõi completion progress

## Decision Points

* Care plan bị On Hold không
* Có reassessment request không

## Input Data

* Resident ID

## Output Data

* Care plan detail view

## System Behavior

* Merge data từ M2 + M3 + M7
* Realtime task status update

## Edge Cases

* Care plan archived
* Missing task data
* Version conflict

## Cross-module Impact

* M7: incident override
* Staffing: workload tracking
* Billing: care level reporting



# 4.3 CNA DAILY TASK LIST

## Mục đích nghiệp vụ

Hiển thị danh sách nhiệm vụ chăm sóc theo ca trực cho CNA.

## Actors

* CNA

## Trigger

Start shift hoặc login CNA

## Preconditions

* Care plan active
* CNA được assign shift

## Main Flow

1. System load tasks theo shift
2. Group task theo resident
3. Sort theo priority
4. CNA thực hiện task
5. Mark complete hoặc skip

## Decision Points

* Task overdue
* Patient refuse care
* Task critical priority

## Input Data

* Shift schedule
* Task assignment

## Output Data

* Task list
* Completion status

## System Behavior

* Real-time task assignment
* Priority engine based on risk

## Edge Cases

* CNA không check-in đúng ca
* Task bị duplicate
* Missing assignment

## Cross-module Impact

* M7: missed care → incident
* Staffing: workload balancing
* Billing: care hours tracking



# 4.4 TASK COMPLETION LOG

## Mục đích nghiệp vụ

Ghi nhận toàn bộ trạng thái hoàn thành nhiệm vụ chăm sóc.

## Actors

* CNA
* Nurse (review)

## Trigger

CNA hoàn thành task

## Preconditions

* Task tồn tại

## Main Flow

1. CNA mark task complete
2. System timestamp tự động
3. Validate required fields
4. Save completion log
5. Update care plan progress

## Decision Points

* Task complete hay partial
* Task refused hay completed
* Late completion

## Input Data

* Task ID
* Completion status
* Notes
* Timestamp

## Output Data

* Task log record
* Updated care plan status

## System Behavior

* Immutable audit log
* No edit after submit
* Trigger compliance check

## Edge Cases

* Offline entry sync failure
* Duplicate submission
* Backdated entry attempt

## Cross-module Impact

* M7: missed care trigger
* Billing: care hour calculation
* M3: medication adherence tracking



# 4.5 ABNORMAL CONDITION ESCALATION

## Trigger Events

* Fall detected
* Vital sign abnormal
* Missed critical task
* Patient distress

## System Behavior

1. Flag abnormal event
2. Freeze affected care plan section
3. Notify Nurse + DON
4. Trigger M7 Incident flow



# 4.6 MISSED / REFUSED TASK HANDLING

## Scenarios

* CNA bỏ sót task
* Patient từ chối chăm sóc

## System Handling

* Mark task “Missed” hoặc “Refused”
* Require reason code
* Trigger escalation nếu critical task
* Update risk score



# 5\. CROSS-MODULE DEPENDENCIES

|Source|Target|Impact|
|-|-|-|
|M1 Assessment|Care Plan|Generate intervention logic|
|LOC|Care Plan|Determine intensity|
|Care Plan|CNA Tasks|Daily execution|
|Task Log|M7|Incident trigger|
|M3 Medication|Care Plan|Medication schedule sync|



# 6\. STAFFING \& BILLING IMPACT

## Staffing Impact

* Task volume determines CNA workload
* High LOC → tăng staffing requirement
* Missed tasks → alert under-staffing risk

## Billing Impact

* Care intensity = billing multiplier
* Completed tasks = billable care hours
* Missed care → adjustment hoặc penalty logic



# 7\. SYSTEM RULES

* Care plan phải được DON approve trước khi active
* Không tạo task nếu care plan chưa active
* Mọi task completion là immutable (audit-safe)
* Abnormal event phải trigger M7
* Care plan luôn versioned



# 8\. KẾT LUẬN MODULE M2

Module M2 là trung tâm vận hành chăm sóc thực tế, chuyển dữ liệu lâm sàng từ M1 thành hành động hàng ngày của CNA, đồng thời tạo ra dữ liệu cho Billing, Staffing và Incident Management.



## MODULE: M7 – INCIDENT \& RISK MANAGEMENT



# 1\. TỔNG QUAN MODULE

## 1.1 Mục đích nghiệp vụ

Module M7 Incident \& Risk chịu trách nhiệm ghi nhận, quản lý và xử lý toàn bộ sự cố phát sinh trong quá trình chăm sóc tại nursing home.

Đây là module mang tính **compliance-critical (bắt buộc tuân thủ pháp lý)**, đảm bảo:

* An toàn bệnh nhân (patient safety)
* Tuân thủ quy định liên bang và bang (HIPAA, HHS reporting)
* Ghi nhận sự kiện y tế có tính pháp lý
* Kích hoạt cơ chế bảo vệ hệ thống (system override)



## 1.2 Vai trò hệ thống

|Vai trò|Mô tả|
|-|-|
|CNA|Ghi nhận sự cố ban đầu|
|Nurse|Xác minh và bổ sung thông tin|
|DON|Phê duyệt và báo cáo chính thức|
|Compliance Officer|Theo dõi báo cáo pháp lý|
|System|Tự động khóa hồ sơ, SLA tracking, escalation|



## 1.3 Mô hình trạng thái Incident (State Machine)

Incident lifecycle:

* Draft (tạo mới)
* Reported (đã ghi nhận)
* Chart Locked (hồ sơ bị khóa)
* Under Review (đang xử lý)
* Pending DON Approval
* Submitted to Authority (nếu cần)
* Resolved (đã xử lý)
* Closed (kết thúc)



# 2\. LUỒNG NGHIỆP VỤ TỔNG THỂ

## 2.1 Incident Flow End-to-End

1. Ghi nhận sự cố (Report Incident)
2. Hệ thống tự động khóa hồ sơ (Chart Lock)
3. Tính SLA (24–48h countdown)
4. Nurse review và bổ sung
5. DON review và phê duyệt
6. Escalation nếu quá hạn
7. Báo cáo cơ quan quản lý (nếu cần)
8. Đóng sự cố



## 2.2 Luồng escalation

* Severity càng cao → SLA càng ngắn
* Critical incident → auto escalate DON + Compliance Officer
* Overdue SLA → system escalation event



# 3\. PHÂN TÍCH LUỒNG THEO CHỨC NĂNG



# 3.1 M7-US-01 – Report New Incident

## Mục đích nghiệp vụ

Ghi nhận sự cố y tế hoặc chăm sóc xảy ra với resident trong thời gian thực.

## Vai trò

* CNA (primary reporter)
* Nurse
* System

## Trigger

* CNA phát hiện sự cố (fall, injury, medication error)
* Hoặc abnormal condition từ M2

## Điều kiện trước

* Resident tồn tại
* CNA có quyền report incident

## Luồng chính

1. CNA chọn resident
2. Nhập loại incident
3. Nhập mức độ severity
4. Nhập mô tả sự cố
5. Hệ thống validate dữ liệu
6. Lưu incident
7. Tự động kích hoạt chart lock
8. Tạo SLA timer



## Điểm quyết định

* Severity level hợp lệ không
* Incident có thuộc nhóm critical không
* Có cần escalation ngay không



## Dữ liệu đầu vào

* Resident ID
* Incident type
* Severity (Low/Medium/High/Critical)
* Description
* Time of incident



## Dữ liệu đầu ra

* Incident record
* Chart lock event
* SLA timer object
* Audit log entry



## Hành vi hệ thống

* Tự động khóa toàn bộ EHR của resident (BR-07)
* Sinh SLA countdown (24–48h)
* Gửi notification đến Nurse + DON
* Ghi immutable audit log



## Ngoại lệ

* Incident trùng lặp
* Thiếu mô tả bắt buộc
* Time incident nằm trong tương lai
* CNA không có quyền report severity cao



## Ảnh hưởng module khác

* M1: khóa hồ sơ resident
* M2: tạm dừng care plan
* Billing: đóng băng một số tính phí
* Compliance: kích hoạt báo cáo pháp lý



# 3.2 M7-US-02 – Chart Lock Confirmation

## Mục đích nghiệp vụ

Xác nhận và thực thi việc khóa hồ sơ bệnh nhân để đảm bảo dữ liệu không bị chỉnh sửa sau incident.

## Vai trò

* System
* Nurse
* DON

## Trigger

Ngay sau khi incident được lưu

## Điều kiện trước

* Incident đã được tạo thành công

## Luồng chính

1. System kích hoạt lock event
2. Hiển thị confirmation state
3. Khóa toàn bộ EHR sections
4. Ghi timestamp lock
5. Gửi cảnh báo hệ thống



## Điểm quyết định

* Lock toàn bộ hay partial lock
* Override bởi DON (nếu có quyền)



## Dữ liệu đầu vào

* Incident ID
* Resident ID



## Dữ liệu đầu ra

* Locked chart state
* Audit trail entry



## Hành vi hệ thống

* EHR chuyển sang read-only
* Block edit từ M1/M2/M3
* Enable emergency override mode (DON only)



## Ngoại lệ

* Lock failure do concurrency
* Timezone mismatch
* Incident duplicate lock



## Ảnh hưởng module khác

* M1: disable editing profile
* M2: freeze care plan modification
* M3: medication log read-only
* Billing: pause billing updates



# 3.3 M7-US-04 – Incident List

## Mục đích nghiệp vụ

Hiển thị toàn bộ incident theo trạng thái để DON và compliance team theo dõi.

## Vai trò

* DON
* Nurse
* Compliance Officer

## Trigger

User truy cập module Incident

## Luồng chính

1. Load incident list theo facility
2. Filter theo status, severity, SLA
3. Hiển thị SLA countdown
4. Highlight overdue incidents
5. Cho phép drill-down detail



## Điểm quyết định

* Filter theo role (CNA không thấy full data)
* SLA overdue highlight logic



## Dữ liệu đầu vào

* Filter criteria
* Facility ID



## Dữ liệu đầu ra

* Incident list view
* SLA status indicators



## Hành vi hệ thống

* Real-time SLA computation
* Severity-based sorting
* Role-based masking



## Ngoại lệ

* Không có incident
* SLA calculation error
* Missing timestamp



## Ảnh hưởng module khác

* M1: view restricted profile
* M2: review missed care tasks
* Compliance: audit reporting



# 3.4 M7-US-05 – Incident Detail Flow

## Mục đích nghiệp vụ

Cung cấp chi tiết toàn bộ lifecycle của một incident để xử lý và báo cáo.

## Vai trò

* DON
* Nurse
* Compliance Officer

## Trigger

Click vào incident từ danh sách

## Luồng chính

1. Load incident detail
2. Hiển thị timeline sự kiện
3. Hiển thị audit log
4. Nurse bổ sung thông tin
5. DON review và quyết định
6. Submit report nếu required



## Điểm quyết định

* Escalation required hay không
* Submit authority report hay internal resolve
* Incident reopen hay close



## Dữ liệu đầu vào

* Incident ID
* Review notes
* Attachments



## Dữ liệu đầu ra

* Updated incident state
* Regulatory report (if required)
* Audit log update



## Hành vi hệ thống

* Timeline reconstruction
* Compliance validation
* Versioned incident history



## Ngoại lệ

* Missing evidence
* Conflicting nurse vs DON notes
* Late submission beyond SLA



## Ảnh hưởng module khác

* M1: chart remains locked/unlocked
* M2: care plan reassessment trigger
* Staffing: workload adjustment
* Billing: incident-related adjustments



# 4\. SLA TIMER LOGIC (24–48H)

## Quy tắc hệ thống

* Low severity: 48h
* Medium severity: 48h
* High severity: 24h
* Critical: immediate escalation

## Behavior

* Countdown bắt đầu khi incident tạo
* Warning 75% SLA
* Escalation at 100%



# 5\. SEVERITY IMPACT MATRIX

|Severity|System Impact|
|-|-|
|Low|Logging only|
|Medium|Nurse review required|
|High|DON escalation|
|Critical|Auto escalation + authority report|



# 6\. CROSS-MODULE IMPACT

|Module|Impact|
|-|-|
|M1|Lock/unlock hồ sơ resident|
|M2|Pause/adjust care plan|
|M3|Medication review trigger|
|Billing|Freeze hoặc adjust billing|
|Staffing|Reallocation workload|



# 7\. AUDIT \& HIPAA COMPLIANCE

* Tất cả incident là immutable (không sửa trực tiếp)
* Mọi thay đổi phải append log
* Ai truy cập dữ liệu phải có RBAC hợp lệ
* Tất cả action được timestamp + user trace
* Dữ liệu PHI phải được mask theo role



# 8\. KẾT LUẬN MODULE M7

Module M7 là lớp bảo vệ cao nhất của hệ thống NHMS, đảm bảo:

* An toàn bệnh nhân
* Tuân thủ pháp lý
* Kiểm soát toàn bộ hệ thống khi xảy ra sự cố

