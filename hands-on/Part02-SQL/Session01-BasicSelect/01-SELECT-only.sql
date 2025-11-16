USE Northwind --Chọn để chơi với thùng chứa data nào đó 
			  --tại 1 thời điểm chơi với 1 thùng chứa data

SELECT * FROM Customers
SELECT * FROM Employees

--------------------------------------------------------------
-- LÍ THUYẾT 
-- 1. DBE cung cấp câu lệnh SELECT dùng để
--	  in ra màn hình một cái gì đó ~ printf() sout()
--	  in ra dữ liệu có trong table (hàng/cột)
--    dùng cho mục đích nào thì kết quả hiển thị luôn là 1 table
-- 
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. Hôm nay là ngày bao nhiêu ?? 
SELECT GETDATE() 
SELECT GETDATE() AS [Hôm nay là ngày]

-- 2. Bây giờ tháng mấy hỡi em?
SELECT MONTH(GETDATE()) AS [Bây giờ tháng mấy?]
SELECT YEAR(GETDATE()) AS [Bây giờ năm nào?]

-- 3. Trị tuyệt đối của -5 là mấy ?
SELECT ABS(-5) AS [Trị tuyệt đối của -5 là mấy?]

-- 4. 5 + 5 là mấy??
SELECT 5 + 5 AS [5 + 5 là mấy??]

-- 5. In ra tên của mình ?
SELECT N'Cao Gia Thinh' AS [My fullname is]
SELECT 'Cao' + N' Gia Thinh' AS [My fullname is]

-- 6. Tính tuổi
SELECT YEAR(GETDATE()) - 2003 AS [Age]

SELECT N'Cao ' + N'Gia Thịnh ' + CAST((YEAR(GETDATE()) - 2003) AS varchar)  + ' year old'
SELECT N'Cao ' + N'Gia Thịnh ' + CONVERT(varchar, (YEAR(GETDATE() - 2003))) + ' year old'

