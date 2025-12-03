-- Find the average sales across all orders and the average sales for each product
-- provide details orderID, OrderDate

SELECT
	OrderID,
	OrderDate,
	Sales, 
	AVG(Sales) OVER () AvgSales
FROM Sales.Orders

-- Find the average sales across all orders and the average sales for each product
-- adn find the average for each product
-- provide details orderID, OrderDate
SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales, 
	AVG(Sales) OVER () AvgSales,
	AVG(Sales) OVER (PARTITION BY ProductID) AvgSalesByProducts
FROM Sales.Orders

-- Find the average scores of customers
-- provide CustomerID, LastName
SELECT
	CustomerID,
	LastName, 
	FirstName, 
	Score, 
	COALESCE(Score, 0) CustomerScore,
	AVG(Score) OVER() AvgScore, --có NULL sẽ bị sai
	AVG(COALESCE(Score, 0)) OVER() AvgScoreWithoutNull
FROM Sales.Customers

--Find all orders where sales are higher than the averages sales across all orders
SELECT 
*
FROM (
SELECT
	OrderID, 
	ProductID, 
	Sales, 
	AVG(Sales) OVER() AvgSales
FROM Sales.Orders
) t WHERE Sales > AvgSales