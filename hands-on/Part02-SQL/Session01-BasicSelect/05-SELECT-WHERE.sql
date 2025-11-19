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

-- 8. In ra thông tin nhân viên có tuổi từ 60 trở lên
SELECT * FROM Employees WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) >= 60
SELECT (YEAR(GETDATE()) - YEAR(BirthDate)) AS Age, *
FROM Employees WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) >= 60

-- 9. Những nhân viên nào ở London 
SELECT * FROM Employees WHERE City = 'London'

-- 10. Những ai không ở London
SELECT * FROM Employees WHERE City <> 'London'
SELECT * FROM Employees WHERE City != 'London'

-- vi diệu, đảo mệnh đề
SELECT * FROM Employees WHERE NOT(City = 'London') -- 4/9
--SELECT * FROM Employees WHERE !(City = 'London') -- sai cú pháp, đảo mệnh đề, phép so sánh thì dùng

-- 11. In ra hồ sơ nhân viên có mã số là 1
-- đi vào ngân hàng để giao dịch, hoặc đưa số tài khoản, kèm cccd, filter theo cmnd
SELECT * FROM Employees WHERE EmployeeID = 1 --kiểu số, hong có ' ', chơi như lập trình
-- WHERE TRÊN KEY CHỈ RA MỘT MÀ THÔI 
-- SELECT MÀ CÓ WHERE KEY CHỈ CÓ 1 DÒNG TRẢ VỀ, DISTINCT LÀ VÔ NGHĨA
SELECT DISTINCT EmployeeID, City FROM Employees WHERE EmployeeID = 1 ORDER BY EmployeeID

-- CÔNG THỨC FULL KHÔNG CHE CỦA SELECT
-- SELECT ...........        FROM .....           WHERE ... GROUP BY..... HAVING ..... ORDER BY
--       DISTINCT          1, N TABLE
--        HÀM()
--        NESTED QUERY/SUB QUERY

-- 12. Xem thông tin bên đơn hàng 
SELECT * FROM Orders --830

-- 13. Sắp xếp giảm dần theo trọng lượng đơn
SELECT * FROM Orders ORDER BY Freight DESC

-- 14. In ra thông tin đơn hàng trọng lượng >= 500 kg
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC

-- 15. In ra thông tin Đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng nằm trong khoảng từ
-- 100 đến 500
SELECT * FROM Orders WHERE (Freight >= 100 AND Freight <= 500) ORDER BY Freight DESC --174

-- 16. In ra thông tin Đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng nằm trong khoảng từ
-- 100 đến 500 và ship bởi công ty giao vận số 1
SELECT * FROM Orders WHERE (Freight >= 100 AND Freight <= 500) AND ShipVia = 1 --52/174/830

-- 17. và không ship tới London
-- RẤT CẨN THẬN KHI TRONG MỆNH ĐỀ WHERE LẠI CÓ AND VÀ OR TRỘN VỚI NHAU, TA PHẢI XÀI THÊM () 
-- ĐỂ PHÂN TÁCH THỨ TỰ FILTER.. (SO SÁNH ANH OR KHÁC NỮA) AND (SO SÁNH KHÁC)


