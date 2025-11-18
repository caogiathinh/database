USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA LỆNH SELECT
-- MỆNH ĐỀ WHERE DÙNG LÀM BỘ LỌC/FILTER/NHẶT RA NHỮNG DỮ LIỆU TA CẦN THEO 1 TIÊU CHÍ NÀO ĐÓ 
-- Ví dụ: Lọc ra những sinh viên có quê ở Bình Dương
--		  Lọc ra những sv quê ở Tiền Giang và có điểm trung bình >= 8 

-- CÚ PHÁP DÙNG BỘ LỌC
-- SELECT * (cột bạn muốn in ra) FROM <TÊN-TABLE> WHERE <ĐIỀU KIỆN LỌC>
-- * ĐIỀU KIỆN LỌC: TÌM TỪNG DÒNG, VỚI CÁI CỘT CÓ GIÁ TRỊ CẦN LỌC
--					 LỌC THEO TÊN CỘT VỚI VALUE THẾ NÀO, LẤY TÊN CỘT, XEM VALUE TRONG CELL
--					 CÓ THỎA ĐIỀU KIỆN LỌC HAY KHÔNG ? 
-- ĐỂ VIẾT ĐƯỢC ĐIỀU KIỆN LỌC TA CẦN:
-- > tên cột
-- > value của cột (cell)
-- > toán tử (operator) >= > < <= = (1 dấu =, không giống như C hay Java), != (hoặc <> cùng ý nghĩa)
-- > nhiều điều kiện lọc đi kèm nhau dùng thêm toán tử logic operators, AND, OR, NOT
-- Ví dụ: WHERE City = N'Binh Dương'
--        WHERE City = N'Tiền Giang' AND Gpa >= 8

-- LỌC LIÊN QUAN TỚI GIÁ TRỊ/VALUE/CELL CHỨA GÌ, TA PHẢI QUAN TÂM ĐẾN DATA TYPES
-- Số: nguyên/thực, ghi số ra như truyền thống 5, 10, 3.14, 9.8
-- Chuỗi/kí tự: 'A', 'Ahihi'
-- Ngày tháng: '2003-01-01....'

--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách các khách hàng
SELECT * FROM Customers --92

-- 2. In ra danh sách khách hàng đến từ Ý
SELECT * FROM Customers WHERE Country = 'Italy';

-- 3. 