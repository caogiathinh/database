USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA LỆNH SELECT
-- Ta muốn săp xép dữ liệu sort theo tiêu chí nào đó, thường là tăng dần - ASCENDING/ASC
--																giảm dần - DESCENDING/DESC
-- mặc định không nói gì cả là sort tăng dần
-- A < B < C
-- 1 < 2 < 3 
-- ta có thể sắp xêp trên nhiều cột, logic này từ từ tính
-- SELECT ... FROM <TÊN-TABLE> ORDER BY <TÊN-CỘT-MUỐN-SORT> <KIỂU SORT>

--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra  danh sách nhân viên
SELECT * FROM Employees

-- 2. In ra danh sách nhân viên tăng dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate ASC
SELECT * FROM Employees ORDER BY BirthDate ASC --mặc định là tăng dần

-- 3. In ra ds nhân viên GIẢM DẦN theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate DESC

-- 4. Tính tiền chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, Quantity * UnitPrice * (1 - Discount) AS SubTotal FROM [Order Details]

-- 5. Tính tiền chi tiết mua hàng, giảm dần theo số tiền
SELECT *, Quantity * UnitPrice * (1 - Discount) AS SubTotal FROM [Order Details] 
ORDER BY SubTotal DESC

-- 6. In ra danh sách nhân viên giảm dần theo tuổi
SELECT *, YEAR(GETDATE()) - YEAR(BirthDate) AS Age FROM Employees  
ORDER BY Age DESC

SELECT EmployeeID, FirstName, BirthDate, YEAR(GETDATE()) - YEAR(BirthDate) AS [Age]
FROM Employees
ORDER BY Age DESC