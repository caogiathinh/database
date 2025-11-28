USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 

-- DB ENGINE hỗ trợ 1 loạt các nhóm hàm dùng thao tác trên dòng/cột, gom data tính toán
-- trên đám data gom này  -- AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT() SUM() MIN() MAX() AVG()
-- * CÚ PHÁP
-- SELECT CỘT ..., HÀM GOM NHÓM(), ... FROM <TABLE>
-- SELECT CỘT ..., HÀM GOM NHÓM(), ... FROM <TABLE> WHERE .. GROUP BY .. HAVING (WHERE SAU KHI GOM NHÓM - WHERE THỨ 2)
--------------------------------------------------------------
-- THỰC HÀNH: 
-- 1. Liệt kê danh sách nhân viên 
SELECT
	* 
FROM Employees

-- 2. Năm sinh nào là bé nhất (tuổi max)
SELECT 
	MIN(BirthDate) 
FROM Employees

SELECT 
	MAX(BirthDate) 
FROM Employees

-- 3. Ai sinh năm bé nhất, ai lớn tuổi nhất, in ra info 
SELECT 
	*
FROM Employees 
WHERE BirthDate = (
						SELECT 
							MIN(BirthDate) 
						FROM Employees
					)

SELECT 
	*
FROM Employees 
WHERE BirthDate <= ALL (
						SELECT 
							BirthDate 
						FROM Employees
					)
-- 4.1. Trọng lượng nào là lớn nhất trong các đơn hàng đã bán
-- 4.2. Trong các đơn hàng, đơn hàng nào có trọng lượng nặng nhất/nhỏ nhất
SELECT 
	MAX(Freight) 
FROM Orders

SELECT 
	* 
FROM Orders 
WHERE Freight = (SELECT MAX(Freight) FROM Orders)

SELECT *
FROM Orders 
WHERE Freight >= ALL(SELECT Freight FROM Orders)

-- 5. Tính tổng khối lượng của các đơn hàng đã vận chuyển
SELECT 
	* 
FROM Orders 
SELECT 
	SUM(Freight) AS [Freight in Total]
FROM Orders

-- 6. Tính xem trung bình các đơn hàng nặng bao nhiêu ?
SELECT 
	AVG(Freight) AS [AVG Freight] 
FROM Orders --78.2442

-- 7. Liệt kê các đơn hàng có trọng lượng nặng hơn trọng lượng trung bình tất cả
SELECT 
	* 
FROM Orders 
WHERE Freight >= (SELECT AVG(Freight) AS [AVG Freight] FROM Orders)

-- 8. Có bao nhiêu đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả
SELECT 
	COUNT(*) 
FROM Orders 
WHERE Freight >= (SELECT AVG(Freight) AS [AVG Freight] FROM Orders) 
-- chỉ những thằng lớn hơn trung bình thì mới đếm, không chia nhóm 
SELECT
	COUNT(*)
FROM (
		SELECT 
			* 
		FROM Orders 
		WHERE Freight >= (SELECT AVG(Freight) AS [AVG Freight] FROM Orders)	
	 ) AS AVG --coi câu sql là 1 table


--NHẮC LẠI
--CỘT XUẤT HIỆN TRONG SELECT HÀM Ý ĐẾM THEO CỘT NÀY, CỘT PHẢI XUẤT HIỆN TRONG GROUP BY
--TỈNH <ĐẾM CÁI GÌ ĐÓ CỦA TỈNH> -> CHIA THEO TỈNH MÀ ĐẾM
--								-- GROUP BY TỈNH
-- CHUYÊN NGÀNH, <ĐẾM CỦA CHUYÊN NGÀNH> -> CHIA THEO CHUYÊN NGÀNH MÀ ĐẾM
									    -- GROUP BY CHUYÊN NGÀNH
-- CÓ QUYỀN GROUP BY TRÊN NHIỀU CỘT
-- MÃ CHUYÊN NGÀNH, TÊN CHUYÊN NGÀNH <SL SV> -> GROUP BY MÃ CN, TÊN CN

-- ÔN TẬP THÊM 
-- 1. In danh sách nhân viên 
SELECT * FROM Employees

-- 2. Đếm xem mỗi khu vực có bao nhiêu nhân viên
SELECT 
	COUNT(*) AS [No Regions]
FROM Employees
GROUP BY Region --4 (null), 5 (WA)
-- 2 nhóm region, 2 cụm region: WA, NULL

SELECT 
	COUNT(Region) AS [No Regions]
FROM Employees
GROUP BY Region -- 2 cụm Region NULL WA
-- 0 VÀ 5, DO NULL KHÔNG DC XEM LÀ VALUE ĐỂ ĐẾM, NHƯNG VẪN LÀ MỘT VALUE ĐỂ ĐƯỢC CHIA NHÓM
--												NHÓM KHÔNG GIÁ TRỊ
SELECT 
	Region, COUNT(Region) AS [No Regions]
FROM Employees
GROUP BY Region --sai do đếm trên null

SELECT 
	Region, COUNT(*) AS [No Regions]
FROM Employees
GROUP BY Region --đúng do đếm trên dòng

-- 3. Khảo sát đơn hàng
SELECT * FROM Orders

-- Mỗi quốc gia có bao nhiêu đơn hàng
SELECT
	ShipCountry, 
	COUNT(*) AS [No Orders]
FROM Orders 
GROUP BY ShipCountry

-- 4. Quốc gia nào có từ 50 đơn hàng trở lên
SELECT
	ShipCountry, 
	COUNT(*) AS [No Orders]
FROM Orders 
GROUP BY ShipCountry
HAVING COUNT(*) >= 50

-- 5. Quốc gia nào có nhiều đơn hàng nhất
SELECT MAX([No Orders]) FROM
(SELECT
	ShipCountry, 
	COUNT(*) AS [No Orders]
FROM Orders 
GROUP BY ShipCountry
) AS [CTry]
-- lấy được max rồi
SELECT
	ShipCountry, 
	COUNT(*) AS [No Orders]
FROM Orders 
GROUP BY ShipCountry
HAVING COUNT(*) = (
					SELECT MAX([No Orders]) 
					FROM
						(
							SELECT
								ShipCountry, 
								COUNT(*) AS [No Orders]
							FROM Orders 
							GROUP BY ShipCountry
						) AS [CTry]
					)

-- 6. Liệt kê các đơn hàng của khách hàng có mã số VINET
SELECT
	* 
FROM Orders 
WHERE CustomerID = 'VINET'

-- 7. Khách hàng VINET đã mua bao nhiêu lần

SELECT CustomerID, COUNT(*) 
FROM Orders
WHERE CustomerID = 'VINET' --ERROR

SELECT CustomerID, COUNT(*)
FROM Orders
WHERE CustomerID = 'VINET' --CHIA THEO MÃ KH MÀ ĐẾM
GROUP BY CustomerID

-- ĐẾM XONG LOẠI ĐI CÁI THẰNG KHÔNG PHẢI LÀ VINET
SELECT CustomerID, COUNT(*)
FROM Orders
GROUP BY CustomerID
HAVING CustomerID = 'VINET'
