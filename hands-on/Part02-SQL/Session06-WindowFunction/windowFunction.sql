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