USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA LỆNH SELECT
-- Trong thực tế có những lúc ta muốn tìm dữ liệu/filter theo kiểu gần đúng
-- gần đúng trên kiểu chuỗi, ví dụ, liệt kê ai đó có tên là AN, khác câu
-- liệt kê ai đó bắt đầu bằng chữ A
-- tìm đúng, TOÁN TỪ = 'AN'
-- Tìm gần đúng tìm có sự xuất hiện, không dùng =, dùng toán tử LIKE
--					LIKE 'A...' 
-- ĐỂ SỬ DỤNG TOÁN TỬ LIKE, TA CẦN 2 THỨ TRỢ GIÚP, DẤU % VÀ DẤU _
-- % đại diện cho một chuỗi bất kì nào đó
-- _ đại diện cho 1 kí tự bất kì nào đó
-- VÍ DỤ: Name LIKE 'A%', bất kì ai có tẽn xuất hiện bằng chữ A, phần còn lại là gì không care 
--		  Name LIKE 'A_', người nào trong tên có 2 chữ cái, trong đó kí tự đầu phải là A
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách nhân viên 
SELECT * FROM Employees

-- 2. Nhân viên nào có tên bắt đầu bằng chữ A
SELECT * FROM Employees WHERE FirstName = 'A%' --0 vì toán tử so sánh = A%, có ai tên A% không
SELECT * FROM Employees WHERE FirstName LIKE 'A%' --2. 

-- 2.1. Nhân viên nào có tên bắt đầu bằng chữ A, in ra cả full name được ghép vào đầy đủ
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], Title 
FROM Employees WHERE FirstName LIKE 'A%'

SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [Full Name], Title 
FROM Employees WHERE FirstName LIKE 'A%'

-- 3. Nhân viên nào tên có chữ a cuối cùng
SELECT * FROM Employees WHERE FirstName LIKE '%a' -- 1

-- 4. Nhân viên nào tên có 4 kí tự 
-- Dùng hàm kiểm tra độ dài của tên = 4 hay không - Homework
SELECT * FROM Employees WHERE FirstName LIKE '____' --1 

-- 5. Xem danh sách các sản phẩm /món đồ đang có - Product
SELECT * FROM Products  --77

-- 6. Những sản phẩm nào tên bắt đầu bằng Ch
SELECT * FROM Products WHERE ProductName LIKE 'Ch%' --6

-- Những sản phẩm có cụm Ch trong tên sản phẩm
SELECT * FROM Products WHERE ProductName LIKE '%Ch%'  --14
-- trong tên có từ Ch, không quan tâm vị trí 

-- 7. Những sản phẩm tên có 5 kí tự 
SELECT * FROM Products WHERE ProductName LIKE '_____' --2

-- 8. Những sản phẩm trong tên sp từ cuối cùng là 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '%_____' --tên có từ 5 kí tự trở lên

SELECT * FROM Products WHERE ProductName LIKE '% _____' --tên có ít nhất 2 từ
														--từ cuối cùng có 5 kí tự
														--VÔ TÌNH LOẠI ĐI THẰNG
														--TÊN CHỈ CÓ ĐÚNG 5 KÍ TỰ
														--12
SELECT * FROM Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '_____' --14

