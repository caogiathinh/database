USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- Cú pháp chuẩn của câu lệnh SELECT
-- SELECT * FROM <TABLE> WHERE.... 
-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT LIKE PATTERN NÀO ĐÓ e.g. '____'
-- WHERE CỘT BETWEEN RANGE
-- WHERE CỘT IN (TẬP HỢP GIÁ TRỊ ĐƯỢC LIỆT KÊ)

-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 VALUE/CELL 
-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ 1 TẬP GIÁ TRỊ/CELL 
-- TẬP KẾT QUẢ NÀY RẤT ĐỒNG NHẤT (CÁC GIÁ TRỊ KHÁC NHAU CỦA 1 BIẾN)

-- ****************
-- WHERE CỘT = VALUE NÀO ĐÓ - e.g YEAR(DOB) = 2003
--           = THAY VALUE NÀY = 1 CÂU SQL KHÁC MIỄN TRẢ VỀ 1 CELL 
-- KĨ THUẬT VIẾT CÂU SQL THEO KIỂU HỎI GIÁN TIẾP, LỒNG NHAU, TRONG CÂU\
-- SQL CHỨA CÂU SQL KHÁC
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách nhân viên
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID = 1 --1 cell
SELECT FirstName FROM Employees --1 tập giá trị/1 cột/phép chiếu 

-- 2. Liệt kê các nhân viên ở London
SELECT * FROM Employees WHERE City = 'London' --4

-- 3. Liệt kê các nhân viên cùng quê với King Robert
SELECT * FROM Employees WHERE FirstName = 'Robert'

SELECT City FROM Employees WHERE FirstName = 'Robert' 

-- đáp án cho câu 3 bắt đầu
-- SELECT * FROM Employees WHERE City = City quê của Robert
SELECT * FROM Employees 
		 WHERE City = (
						SELECT City FROM Employees 
									WHERE FirstName = 'Robert'
					  )
-- câu này 9.9, vì cùng quê không cần nói lại Robert

SELECT * FROM Employees 
		 WHERE City = (
						SELECT City FROM Employees 
									WHERE FirstName = 'Robert'
					  ) AND FirstName != 'Robert' 

-- 4. Liệt kê các đơn hàng 
SELECT * FROM Orders ORDER BY Freight DESC
							
-- 4.1. Liệt kê tất cả các đơn hàng trọng lượng lớn hơn 252kg
SELECT * FROM Orders WHERE Freight >= 252 ORDER BY Freight DESC --47

-- 4.2. Liệt kê tất cả các đơn hàng trọng lượng lớn hơn trọng lượng 
-- đơn hàng 10555
SELECT * FROM Orders 
		 WHERE Freight >= (
							SELECT Freight FROM Orders 
											WHERE OrderID = 10555
						  ) --47
						  -- xuất hiện luôn cả 10555

SELECT * FROM Orders 
		 WHERE Freight >= (
							SELECT Freight FROM Orders 
										   WHERE OrderID = 10555
						   ) AND OrderID != 10555 --46

--BTVN
-- 1. Liệt kê danh sách các công ty vận chuyển hàng

-- 2. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận 
--	  có mã số 1
-- 3. Liệt kê danh sách các đơn hàng dc vận chuyển bởi công ty giao vận
-- có tên Speedy Express
-- 4. Liệt kê danh sách các đơn hàng dc vận chuyển bởi công ty giao vận
-- có tên Speedy Express và trọng lượng từ 50 - 100 
-- 5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
-- 6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet