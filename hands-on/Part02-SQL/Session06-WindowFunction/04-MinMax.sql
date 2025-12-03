-- Find the highest and lowest sales of all orders
-- Find the highest and lowest sales for each product
SELECT
	OrderID, 
	OrderDate,
	ProductID, 
	Sales,
	MAX(Sales) OVER() HighestSales, 
	MIN(Sales) OVER() LowestSales,
	MAX(Sales) OVER(PARTITION BY ProductID) HighestSales, 
	MIN(Sales) OVER(PARTITION BY ProductID) LowestSales
FROM Sales.Orders

-- Show the employees who have the highest salaries
SELECT 
	* 
FROM (SELECT 
	*,
	MAX(Salary) OVER() HighestSalary
FROM Sales.Employees
) t WHERE Salary = HighestSalary
--trước tiên tìm highest salary trước sau so sánh tìm ra nhân viên
--có lương cao nhất

-- Find the deviation of each sales from the minimum and maximum sales amounts
SELECT
	OrderID, 
	OrderDate,
	ProductID, 
	Sales,
	MAX(Sales) OVER() HighestSales, 
	MIN(Sales) OVER() LowestSales,
	Sales - MIN(Sales) OVER() DeviationFromMin, 
	MAX(Sales) OVER() - Sales  DeviationFromMax
FROM Sales.Orders