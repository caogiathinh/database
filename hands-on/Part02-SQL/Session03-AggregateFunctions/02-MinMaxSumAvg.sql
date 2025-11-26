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