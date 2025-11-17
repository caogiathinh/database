USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- MỘT DB là nơi chứa data (bán hàng, thư viện, qlsv, ... ) 
-- DATA được lưu dưới dạng table, tách thành nhiều TABLE (nghệ thuật design database)
-- DÙNG LỆNH SELECT để in dữ liệu từ table, hiển thị dươi dạng table 
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						 * đại diện cho việc tui muốn lấy all of column

-- CÚ PHÁP MỞ RỘNG:
--					SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁCH-NHAU-DẤU-PHẨY FROM <TABLE>
--					SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT DỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--					FROM <TÊN-TABLE>

-- Khi ta SELECT một vài cột từ table thì có nguy cơ dữ liệu sẽ bị trùng lại 
-- không phải ta bị sai, không phải người thiết kế table và người nhập liệu bị sai
-- do chúng ta có nhiều info đặc diểm trùng nhau/đặc điểm trùng nhau, nếu chỉ tập trung vào data này 
-- trùng nhau chắc chắn xảy ra
-- 100 triệu người dân VN được quản lí info bao gồm: ID, tên, Dob, ... tinh thành sinh sống
--													<>                     63 tỉnh
-- LỆNH SELECT HỖ TRỢ LOẠI BỎ CÁC DÒNG TRÙNG NHAU/ TRÙNG 100%
-- SELECT DISTINCT <TÊN-CÁC-CỘT> FROM <TÊN-TABLE>
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. Liệt kê danh sách nhân viên
SELECT * FROM Employees

--Phân tích: 9 người nhưng chỉ có 4 title <------. 100 triệu dân Việt Nam chỉ có 63 tỉnh
SELECT TitleOfCourtesy FROM Employees            --9 DANH XƯNG
SELECT DISTINCT TitleOfCourtesy FROM Employees   --CHỈ LÀ 4

SELECT DISTINCT EmployeeID, TitleOfCourtesy FROM Employees 
-- NẾU DISTINCT ĐI KÈM VỚI KEY/ID, NÓ VÔ DỤNG, KEY SAO TRÙNG MÀ LOẠI TRỪ

-- 2. In ra thông tin khách hàng
SELECT * FROM Customers --92 rows

-- 3. Có bao nhiêu quốc gia xuất hiện trong thông tin k/h, in ra
SELECT Country FROM Customers --92 rows

SELECT DISTINCT Country FROM Customers --21 rows
