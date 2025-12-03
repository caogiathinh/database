-- Find the total number of Order for each Product
SELECT
	ProductID, 
	COUNT(*) OVER(PARTITION BY ProductID) as [No Products Sales]
FROM Sales.Orders

--tương đương count(*) và count(1)
SELECT
	ProductID, 
	COUNT(1) OVER(PARTITION BY ProductID) as [No Products Sales]
FROM Sales.Orders

SELECT
	ProductID, 
	COUNT(Sales) OVER(PARTITION BY ProductID) as [No Products Sales]
FROM Sales.Orders

--Find total number of Orders
SELECT
	COUNT(*) TotalOrders
FROM Sales.Orders
--Find total number of Orders
--provide details OrderId, Order Date
SELECT
	OrderID,
	OrderDate,
	COUNT(*) OVER() TotalOrders
FROM Sales.Orders

--Find the total order for each customers
SELECT
	CustomerID, 
	OrderID,
	OrderDate,
	COUNT(*) OVER() TotalOrders,
	COUNT(*) OVER(PARTITION BY CustomerID) OrdersByCustomers
FROM Sales.Orders

--Find the total number of customers, 
--provide all customer's details
SELECT 
	*, 
	COUNT(*) OVER() TotalCustomers
FROM Sales.Customers

--Find the total number of scores for the customers
SELECT 
	*, 
	COUNT(*) OVER() TotalCustomersStar, 
	COUNT(1) OVER() TotalCustomersOne, 
	COUNT(Score) OVER() TotalOfScore, 
	COUNT(Country) OVER() TotalCountry
FROM Sales.Customers

--Check whether the table 'Orders' contains any duplicate rows
-- expectation: max is 1
SELECT 
	OrderID,
	COUNT(*) OVER (PARTITION BY OrderID) CheckPK
FROM Sales.Orders

SELECT 
	OrderID,
	COUNT(*) OVER (PARTITION BY OrderID) CheckPK
FROM Sales.OrdersArchive

