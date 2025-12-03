--Find the tota Sale Across all orders
SELECT 
	SUM(Sales) TotalSales
FROM Sales.Orders

--Find the total sales for each product
SELECT 
	ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID

----Find the total sales for each product
-- provides detail OrderId, OrderDate
SELECT 
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID, OrderID, OrderDate

--window function trả về kết quả sau mỗi dòng
SELECT 
	OrderID,
	OrderDate,
	ProductID, 
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProducts
FROM Sales.Orders

-- FRAME CLAUSE ----------------------------------------------
SELECT 
	OrderID,
	OrderDate,
	OrderStatus, 
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS TotalSales
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	OrderStatus, 
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TotalSales
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	OrderStatus, 
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS 2 PRECEDING) AS TotalSales
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	OrderStatus, 
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS UNBOUNDED PRECEDING) AS TotalSales
FROM Sales.Orders

-- DEFAULT FRAME
SELECT 
	OrderID,
	OrderDate,
	OrderStatus, 
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS TotalSales
FROM Sales.Orders

-- Order By always uses a FRAME

-- Find the total sales for each order status 
-- only for two products 101 and 102
SELECT 
	OrderID,
	OrderDate,
	OrderStatus, 
	ProductID,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus) AS [Total Sales]
FROM Sales.Orders
WHERE ProductID IN(101, 102)

-- Rank customer based on their total sales
-- use GROUP BY for simple Aggregations
-- Step 1: Add GROUP By to query
SELECT 
	CustomerID, 
	SUM(Sales) AS TotalSales, 
	RANK() OVER(ORDER BY SUM(Sales) DESC) AS RankCustomer
FROM Sales.Orders
GROUP BY CustomerID



