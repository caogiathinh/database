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

