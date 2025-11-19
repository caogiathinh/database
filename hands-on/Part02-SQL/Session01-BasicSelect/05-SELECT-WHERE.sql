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
SELECT * FROM Customers WHERE Country = 'Italy'; --3/92

-- 3. In ra danh sách khách hàng đến từ Mĩ
SELECT * FROM Customers WHERE Country = 'USA' --13 

-- 4. In ra những khách hàng đến từ Mĩ và Ý
-- đời thường có thể nói: những k/h đến từ Ý và Mĩ, Ý hoặc Mĩ 

-- SELECT * FROM Customers WHERE Country = 'USA' AND 'Italy'-- thiếu toán tử so sánh

SELECT * FROM Customers WHERE Country = 'USA' AND Country = 'Italy'    -- 0
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy'     --16, hiểu logic hơn là hiểu tiếng Việt

--sort theo Ý, Mĩ, đê gom cùng cụm cho dễ theo dõi

SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' ORDER BY Country

-- 5. In ra k/h đến từ thủ đô nước Đức
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' -- 1

-- 6. In ra các thông tin của nhân viên
SELECT * FROM Employees

-- 7. In ra thông tin của nhân viên từ năm 1950 trở lại gần đây/đổ lại
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960

-- 8. 