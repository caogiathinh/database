-- Rank the order based on their sales from highest to lowest
SELECT 
	OrderID, 
	ProductID,
	Sales, 
	ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank, 
	DENSE_RANK() OVER(ORDER BY Sales DESC) SalesRank_Dense_Rank
FROM Sales.Orders

-- Find the top highest sales for each product
-- 1. TOP N analysis
SELECT
	* 
FROM (
SELECT
	OrderID, 
	ProductID,
	Sales, 
	ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) RankByProduct
FROM Sales.Orders
) t WHERE RankByProduct = 1

-- Find the lowest 2 customers based on their total sales
-- 2. Bottom-N analysis
SELECT 
	*
FROM (
SELECT
	CustomerID, 
	SUM(Sales) AS TotalSales, 
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) RankingCustomers
FROM Sales.Orders
GROUP BY CustomerID
) t WHERE RankingCustomers IN (1, 2)

-- Assign unique IDs to the rows of the 'Orders Archive' table
-- 3. Assign unique IDS
SELECT 
	ROW_NUMBER() OVER(ORDER BY OrderID, OrderDate) UniqueID,
	*
FROM Sales.OrdersArchive

-- Identify duplicate rows in the table 'Orders Archive' table
-- and return a clean result without any duplicates
SELECT * 
FROM( 
	SELECT 
		ROW_NUMBER() OVER(PARTITION BY OrderID ORDER BY CreationTime DESC) rn,
		*
	FROM Sales.OrdersArchive
)t WHERE rn = 1
-- partition by orderId, tức là partition theo khóa chính
-- sau đó, dùng hàm row_number() để đếm kết quả thằng nào >1 là bị trùng
