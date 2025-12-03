-- Find the total sales across all orders 
--and the total sales for each product
SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales, 
	SUM(Sales) OVER() TotalSales, 
	SUM(Sales) OVER(PARTITION BY ProductID) SalesByProduct
FROM Sales.Orders

-- Find the percentage contribution of each product's sales
-- to the total sales
SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales, 
	SUM(Sales) OVER() TotalSales,
	ROUND(CAST(Sales AS Float) / SUM(Sales) OVER() * 100, 2) AS PercentageOfTotal 
FROM Sales.Orders
