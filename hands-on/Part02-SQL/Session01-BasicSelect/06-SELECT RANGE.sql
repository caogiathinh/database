USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA LỆNH SELECT
-- HKI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >= ... AND <= ...., ta có thể 
-- BĂNG MỆNH ĐỀ BETWEEN IN 
-- * Cú pháp: CỘT BETWEEN VALUE-1 AND VALUE-2 
--						>>>> BETWEEN THAY THẾ CHO 2 MỆNH ĐỀ >= AND <= 
--
-- * Cú pháp IN (một tập hợp các giá trị được liệt kê cách nhau bằng dấu phẩy)
--						>>>> IN sẽ thay thế cho một loạt các mệnh đề OR

--------------------------------------------------------------
-- THỰC HÀNH
-- 1. Liệt kê danh sách nhân viên sinh trong đoạn [1960..1970]
SELECT * FROM Employees 
WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 
ORDER BY BirthDate DESC

SELECT * FROM Employees 
WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970
ORDER BY BirthDate DESC

-- 2. iệt kê các đơn hàng có trọng lượng từ 100 đến 500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500 -- 174
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 -- 174

-- 3. Liệt kê các đơn hàng gửi đến Anh Pháp Mĩ
SELECT * FROM Orders WHERE ShipCountry = 'UK' 
						OR ShipCountry = 'France' 
						OR ShipCountry = 'USA' --255

SELECT * FROM Orders WHERE ShipCountry IN('UK', 'USA', 'France') --255

-- .4. Đơn hàng nào không gửi đến Anh Pháp Mĩ 
SELECT * FROM Orders WHERE NOT(	ShipCountry = 'UK' 
								OR ShipCountry = 'USA' 
								OR ShipCountry = 'France') --575
SELECT * FROM Orders WHERE ShipCountry NOT IN('UK', 'USA', 'France')

-- 5. Liệt kê các đơn hàng trong năm 1996 loại trừ các tháng 6 7 8 9
SELECT * FROM Orders 
WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (6, 7, 8, 9)

-- LƯU Ý IN: CHỈ KHI TA LIỆT KÊ ĐC TẬP GIÁ TRỊ THÌ MỚI CHƠI ĐƯỢC IN 
-- KHOẢNG SỐ THỰC THÌ KHÔNG LÀM ĐƯỢC
-- 6. Liệt kê các đơn hàng có trọng lượng từ 100...110
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 110 ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 110 ORDER BY Freight DESC
-- SELECT * FROM Orders WHERE Freight IN () -- 100...110 VÔ SỐ GIÁ TRỊ THỰC
