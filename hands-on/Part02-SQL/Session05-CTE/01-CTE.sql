USE Northwind
WITH short_e AS (
	SELECT
		EmployeeID, 
		LastName, 
		FirstName
	FROM Employees
)
SELECT * FROM short_e

--Lấy thông tin các sản phẩm (Products) có cùng thể loại với sản phẩm cụ thể
SELECT * FROM Products
SELECT * FROM Categories

--sử dụng Sub Query
SELECT 
	ProductName, 
	CategoryID
FROM Products 
WHERE CategoryID = (
	SELECT CategoryID
	FROM Products
	WHERE ProductName = 'Chai'
)


WITH ProductCategory AS(
	SELECT CategoryID
	FROM Products
	WHERE ProductName = 'Chai'
)
SELECT P.ProductName, P.CategoryID
FROM Products AS P
JOIN ProductCategory AS PC ON P.CategoryID = PC.CategoryID
--sử dụng một lần truy vấn con

--Lấy thông tin về đơn hàng (Orders) cùng 
--với tổng giá trị đơn hàng 
--tỉ lệ giữa tổng giá trị và phí giao hàng
--cách 1: SUB QUERY
SELECT
	OrderID,
	OrderDate, 
	Freight, 
	(SELECT SUM(od.Quantity * od.UnitPrice)
		FROM [Order Details] AS od
		WHERE od.OrderID = o.OrderID
	) AS TotalPrice, 
	((SELECT SUM(od.Quantity * od.UnitPrice)
		FROM [Order Details] AS od
		WHERE od.OrderID = o.OrderID
	)/Freight) AS Ratio
FROM Orders AS o;

--Dùng CTE
--ngoài ra có thể dùng nhiều bảng tạm thời
WITH OrderTotals AS(
	SELECT od.OrderID, SUM(od.Quantity * od.UnitPrice) AS [TotalPrice]
	FROM [Order Details] od
	GROUP BY OrderID
), otx AS (
	SELECT od.OrderID, SUM(od.Quantity * od.UnitPrice) AS [TotalPrice]
	FROM [Order Details] od
	GROUP BY OrderID
), otx2 AS (
	SELECT od.OrderID, SUM(od.Quantity * od.UnitPrice) AS [TotalPrice]
	FROM [Order Details] od
	GROUP BY OrderID
)


SELECT
	o.OrderID,
	o.OrderDate, 
	o.Freight,
	ot.TotalPrice, 
	ot.TotalPrice / o.Freight AS Ratio
FROM Orders o
JOIN OrderTotals ot ON o.OrderID = ot.OrderID




