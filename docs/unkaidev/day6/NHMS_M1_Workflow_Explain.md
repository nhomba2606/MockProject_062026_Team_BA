# Diễn giải luồng nghiệp vụ — Module M1 (Tiếp nhận & Hồ sơ điện tử): Luồng nhập viện và đánh giá
(NHMS — M1 Intake & EHR: Admission & Assessment Workflow)

Sơ đồ (`NHMS_M1_Workflow.svg`) chia thành 3 làn (swimlane) theo vai trò: **Nhân viên tiếp nhận** (Admission Staff, bên trái), **Điều dưỡng** (Nurse/RN, ở giữa), **Trưởng điều dưỡng** (DON – Director of Nursing, bên phải). Mỗi khối trên sơ đồ thể hiện một màn hình hoặc hành động, gắn mã câu chuyện người dùng (user story) dạng M1-US-xx và vai trò thực hiện; hình thoi là điểm quyết định nghiệp vụ (business rule); hình bo tròn màu xanh là điểm bắt đầu/kết thúc luồng.

## 1. Điểm vào chung
Đăng nhập → Danh sách cư dân → Hồ sơ chi tiết cư dân
(Login → Resident List → Resident Profile Detail)

Luồng bắt đầu tại khối **Bắt đầu: Đăng nhập → Trang chủ** (Start: Login → Home), nằm ở làn Nhân viên tiếp nhận. Từ đó hệ thống chuyển ngay tới **Danh sách cư dân** (View Resident List, mã M1-US-01) — màn hình dùng chung cho cả ba vai trò, hiển thị tên, phòng, trạng thái, ngày sinh và nguồn chi trả (payer source) của từng cư dân. Về bố cục, màn hình này được đặt cố định trong làn Nhân viên tiếp nhận dù cả ba vai trò đều truy cập — đây là điểm cần lưu ý khi đọc sơ đồ theo làn (swimlane) thuần túy.

Nhấn vào một dòng (row click) sẽ mở **Hồ sơ chi tiết cư dân** (Resident Profile — Detail, mã M1-US-02) — cũng là màn hình dùng chung cho mọi vai trò lâm sàng, hiển thị thông tin nhân khẩu học, chẩn đoán, dị ứng và cấp độ chăm sóc LOC (Level of Care). Màn hình này được đặt trong làn Điều dưỡng trên sơ đồ, tương tự Danh sách cư dân, dù không thuộc riêng vai trò nào.

Từ hai màn hình dùng chung này, luồng rẽ theo 3 lối ra riêng biệt, mô tả ở các mục 2–4.

## 2. Lối ra 1 — Tiếp nhận cư dân mới
Danh sách cư dân → (nút "Thêm cư dân mới") → Tạo/Sửa hồ sơ cư dân
(Resident List → "Add New Resident" → Create/Edit Resident)

Từ Danh sách cư dân, Nhân viên tiếp nhận chọn nút **"Thêm cư dân mới"** (Add New Resident) để mở **Tạo/Sửa hồ sơ cư dân** (Create/Edit Resident, mã M1-US-03): nhập thông tin cá nhân, người liên hệ khẩn cấp, cờ không hồi sức (DNR – Do Not Resuscitate), và nguồn chi trả.

## 3. Lối ra 2 — Chỉnh sửa hồ sơ đã có
Hồ sơ chi tiết cư dân → (nút "Chỉnh sửa hồ sơ") → Tạo/Sửa hồ sơ cư dân
(Resident Profile Detail → "Edit Profile" → Create/Edit Resident)

Từ Hồ sơ chi tiết cư dân, nút **"Chỉnh sửa hồ sơ"** (Edit Profile — mũi tên nét đứt trên sơ đồ) cũng dẫn về cùng màn hình Tạo/Sửa hồ sơ cư dân — xác nhận màn hình này phục vụ cả hai tình huống: tạo mới và chỉnh sửa một cư dân đã tồn tại (kể cả cư dân đang ở trạng thái "Chờ duyệt", xem mục 5).

Dù vào từ lối 2 hay lối 3, **Tạo/Sửa hồ sơ cư dân chỉ có một lối ra duy nhất trên sơ đồ**: mũi tên **"Bắt đầu nhập viện mới"** (Start New Admission) dẫn xuống Sàng lọc trước nhập viện (Pre-Admission Screening). Nói cách khác, sơ đồ không vẽ một nhánh xử lý riêng cho trường hợp sửa hồ sơ đang Chờ duyệt — mọi lượt lưu ở màn hình này đều tiếp tục qua đúng một cửa ngõ sàng lọc đó.

## 4. Lối ra 3 — Tái đánh giá nhanh
Hồ sơ chi tiết cư dân → (nút "Đánh giá mới") → Form đánh giá ban đầu
(Resident Profile Detail → "New Assessment" → Initial Assessment Form)

Từ Hồ sơ chi tiết cư dân, nút **"Đánh giá mới"** (New Assessment) đi thẳng (mũi tên nét đứt) xuống **Form đánh giá ban đầu** (Initial Assessment Form, mã M1-US-06), bỏ qua toàn bộ nhánh tiếp nhận (Sàng lọc trước nhập viện, quyết định BR-06, Form nhập viện). Đây là lối tái đánh giá cho một cư dân **đã có hồ sơ sẵn** (ví dụ định kỳ hoặc sau thay đổi tình trạng lâm sàng) — không phải luồng nhập viện mới, nên không lặp lại các bước sàng lọc/nhập viện đã hoàn tất trước đó.

## 5. Sàng lọc trước nhập viện và quyết định BR-06
Tạo/Sửa hồ sơ cư dân → Sàng lọc trước nhập viện → BR-06?
(Create/Edit Resident → Pre-Admission Screening → BR-06?)

**Sàng lọc trước nhập viện** (Pre-Admission Screening, mã M1-US-04 · bước 1/3) là bảng câu hỏi nhu cầu chăm sóc lâm sàng, dẫn tới điểm quyết định **BR-06: "Cơ sở có đáp ứng được nhu cầu lâm sàng của cư dân không?"** (Facility can meet clinical needs?)

- **KHÔNG** → Nhập lý do gắn cờ, gửi để xem xét → Kết thúc: Chờ duyệt
  (Enter Flag Reason, Submit for Review → End: Pending Review)

  Nhân viên tiếp nhận nhập lý do gắn cờ (flag reason) rồi gửi để xem xét (submit for review) → kết thúc tại **Kết thúc: Chờ duyệt** (End: Pending Review). Đây là điểm kết thúc thật sự của lượt xử lý trên sơ đồ (khối kết thúc hình bo tròn, cùng kiểu với khối bắt đầu) — cư dân chưa được nhận vào cơ sở. Muốn xử lý lại, người dùng quay lại qua **Hồ sơ chi tiết cư dân → "Chỉnh sửa hồ sơ"** (mục 3) để sửa thông tin/nhu cầu chăm sóc trong Tạo/Sửa hồ sơ cư dân, rồi đi tiếp qua đúng mũi tên "Bắt đầu nhập viện mới" hiện có để BR-06 được đánh giá lại — không có đường vẽ lặp riêng nào khác ngoài lối này.

- **CÓ** → Form nhập viện
  (Complete Admission Form)

  **Form nhập viện** (Complete Admission Form, mã M1-US-05 · bước 2/3): xác nhận ngày nhập viện, phân phòng, nguồn chi trả và các văn bản đồng thuận (consents).

## 6. Bàn giao sang Điều dưỡng và đánh giá lâm sàng ban đầu
Form nhập viện → (Xác nhận nhập viện) → Form đánh giá ban đầu → Kết quả phân loại LOC
(Complete Admission Form → "Confirm Admission" → Initial Assessment Form → LOC Classification Result)

Khi Nhân viên tiếp nhận nhấn **"Xác nhận nhập viện"** (Confirm Admission), hồ sơ được chuyển giao sang **Form đánh giá ban đầu** (Initial Assessment Form, mã M1-US-06 · bước 3/3) — cùng màn hình đích với lối tắt "Đánh giá mới" ở mục 4. Điều dưỡng thực hiện chấm điểm hoạt động sinh hoạt hàng ngày (ADL – Activities of Daily Living), chẩn đoán, dị ứng, sinh hiệu (vitals) và trạng thái nhận thức.

Khi nhấn **"Lưu"** (Save), hệ thống tự động tính toán và đưa ra **Kết quả phân loại LOC** (LOC Classification Result, mã M1-US-08) dựa trên điểm ADL.

## 7. Quyết định chấp nhận LOC và xác nhận/ghi đè có kiểm toán
Kết quả phân loại LOC → Có chấp nhận mức LOC đề xuất không?
(LOC Classification Result → Accept suggested LOC?)

- **KHÔNG** → Nhập lý do ghi đè (bắt buộc) → Xác nhận ghi đè
  (Enter Override Reason, Required → Confirm Override)

  Chỉ **Trưởng điều dưỡng** mới có quyền nhập lý do ghi đè bắt buộc (Enter Override Reason) rồi xác nhận ghi đè (Confirm Override) — hành động được ghi log kiểm toán (audit logged). Đây là ràng buộc nghiệp vụ chặt hơn so với mô tả chung "Điều dưỡng/Trưởng điều dưỡng" (Nurse/DON): phần ghi đè do Trưởng điều dưỡng đảm nhiệm riêng, không chia sẻ với Điều dưỡng.

- **CÓ** → Xác nhận LOC
  (Confirm LOC)

  Điều dưỡng hoặc Trưởng điều dưỡng xác nhận (Confirm LOC) — cũng được ghi log kiểm toán (audit logged).

Cả hai nhánh đều hội tụ về:
Kết thúc: Hồ sơ cư dân sẵn sàng cho Lập kế hoạch chăm sóc (M2)
(End: Resident Profile Ready for Care Plan, M2)

— hồ sơ cư dân đã đủ điều kiện (LOC đã được xác nhận hoặc ghi đè) để chuyển sang module M2 — Lập kế hoạch chăm sóc (Care Planning).

## 8. Tóm tắt

Luồng mô tả một chu trình khép kín:
Tiếp nhận → Sàng lọc tuân thủ quy định → Đánh giá lâm sàng → Phân loại mức chăm sóc → Xác nhận/ghi đè có kiểm toán
(Admission → Compliance Screening → Clinical Assessment → LOC Classification → Audited Confirm/Override)

Việc chuyển giao trách nhiệm theo làn (swimlane) rõ ràng ở phần tiếp nhận/đánh giá/xác nhận (Nhân viên tiếp nhận → Điều dưỡng → Trưởng điều dưỡng), ngoại trừ hai màn hình dùng chung đầu luồng (Danh sách cư dân, Hồ sơ chi tiết cư dân) được đặt cố định trong một làn duy nhất dù không thuộc riêng vai trò nào (mục 1).
