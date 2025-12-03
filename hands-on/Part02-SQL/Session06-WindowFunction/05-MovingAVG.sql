USE SalesDB
-- Calculate the moving average of sales for each product overtime, 
SELECT 
	OrderID, 
	OrderDate,
	ProductID, 
	Sales, 
	AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct, 
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) MovingAvg
FROM Sales.Orders

-- Calculate the moving average of sales for each product overtime, 
-- including only the next order
SELECT 
	OrderID, 
	OrderDate,
	ProductID, 
	Sales, 
	AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct, 
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) RollingAvg
FROM Sales.Orders
