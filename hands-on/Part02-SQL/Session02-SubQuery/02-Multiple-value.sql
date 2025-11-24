USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- Cú pháp chuẩn của câu lệnh SELECT
-- SELECT * FROM <TABLE> WHERE.... 

-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT IN (MỘT TẬP HỢP NÀO ĐÓ)
-- Ví dụ: City IN('London', 'Berlin', 'NewYork') -- thay bằng OR OR OR
--													City = 'London' OR City = 'Berlin'
-- NẾU CÓ 1 CÂU SQL TRẢ VỀ 1 CỘT, NHIỀU DÒNG 
-- MỘT CỘT VÀO NHIỀU DÒNG THÌ TA CÓ THỂ XEM NÓ TƯƠNG ĐƯƠNG MỘT TẬP HỢP
-- SELECT CITY FROM EMPLOYEES, BẠN ĐƯỢC MỘT LOẠT CÁC THÀNH PHỐ
-- TA CÓ THỂ NHÉT/LỒNG CÂU 1 CỘT NHIỀU DÒNG VÀO TRONG MỆNH ĐỀ IN CỦA CÂU SQL BÊN NGOÀI
-- * CÚ PHÁP
-- WHERE CỘT IN (MỘT CÂU SELECT TRẢ VỀ MỘT CỘT NHIỀU DÒNG - NHIỀU VALUE CÙNG KIỂU - TẬP HỢP)
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. Liệt kê các nhóm hàng 
SELECT * FROM Categories

-- 2. In ra các món hàng/mặt hàng thuộc nhóm 1, 6, 8. 
SELECT * FROM Products WHERE CategoryID IN (1, 6, 8) --30
SELECT * FROM Products WHERE CategoryID = 1 OR CategoryID = 6 OR CategoryID = 8 --30

SELECT * FROM Products WHERE CategoryID BETWEEN 1 AND 8 -- 77 TOANG

-- 3. In ra các món hàng thuộc nhóm bia/rượu, thịt và hải sản
SELECT * FROM Products 
		 WHERE CategoryID IN (
								SELECT CategoryID FROM Categories 
												  WHERE CategoryName IN('Beverages', 'Meat/Poultry', 'Seafood')
							 )

-- 4. Nhân viên quê London phụ trách những đơn hàng nào ?
SELECT * FROM Orders 
		 WHERE EmployeeID IN (
								SELECT EmployeeID FROM Employees 
												  WHERE City = 'London'
							 ) --224

-- 1. Các nhà cung cấp đến từ Mĩ cung cấp những mặt hàng nào ? 

-- 2. Các nhà cung cấp đến từ Mĩ cung cấp những nhóm hàng ? 

-- 3. Các đơn hàng vận chuyển tới thành phố Sao Paulo được vận chuyển bởi những hãng nào 
-- công ty nào đã vận chuyển hàng tới Sao Paulo

-- 4. Khách hàng đến từ thành phố Berline, London, Madrid có những đơn hàng nào 
-- Liệt kê các đơn hàng của khách hàng đén từ Berlin, London, Marid