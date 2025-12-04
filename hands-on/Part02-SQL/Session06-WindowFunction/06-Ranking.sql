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

-- NTILE
SELECT 
	OrderID,
	Sales,
	NTILE(1) OVER(ORDER BY Sales DESC) OneBucket,
	NTILE(2) OVER(ORDER BY Sales DESC) TwoBucket,
	NTILE(3) OVER(ORDER BY Sales DESC) ThreeBucket,
	NTILE(4) OVER(ORDER BY Sales DESC) FourBucket
FROM Sales.Orders

-- Segment all orders into 3 categories: high, medium and low sales
SELECT
	*, 
	CASE WHEN Buckets = 1 THEN 'High'
		 WHEN Buckets = 2 THEN 'Medium'
		 WHEN Buckets = 3 THEN 'Low'
	END SaleSegementations
FROM(
SELECT
	OrderID, 
	Sales, 
	NTILE(3) OVER(ORDER BY Sales DESC) Buckets
FROM Sales.Orders
)t 

-- In order to export the data, divide the orders into 2 groups
SELECT
	NTILE(2) OVER(ORDER BY OrderID) Buckets, 
	*
FROM Sales.Orders

-- Find the products that fall within the highest 40% of the prices
SELECT 
	*, 
	CONCAT(diskRank * 100, '%') DistRankPerc
FROM (
SELECT
	ProductID, 
	Price, 
	CUME_DIST() OVER(ORDER BY Price DESC) diskRank
FROM Sales.Products
) t WHERE diskRank <= 0.4
