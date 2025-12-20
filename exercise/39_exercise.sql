
--39 EXERCISES ON NORTHWIND DATABASE 
 
--1. In ra thông tin các sản phẩm (nhãn hàng/mặt hàng) có trong hệ thống
--- Output 1: mã sản phẩm, tên sản phẩm, mã nhà cung cấp, mã chủng loại, đơn giá, số lượng trong kho 
SELECT 
    ProductID, 
    ProductName, 
    SupplierID, 
    CategoryID, 
    UnitPrice, 
    UnitsInStock 
FROM Products

--- Output 2: mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, xuất xứ nhà cung cấp (quốc gia)
SELECT 
    p.ProductID, 
    p.ProductName, 
    s.SupplierID,  
    s.CompanyName, 
    s.Country
FROM Products p JOIN Suppliers s
    ON p.SupplierID = s.SupplierID

--- Output 3: mã sản phẩm, tên sản phẩm, mã chủng loại, tên chủng loại
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryID,
    c.CategoryName
FROM Products p JOIN Categories c
    ON p.CategoryID = c.CategoryID

--- Output 4: mã sản phẩm, tên sản phẩm, mã chủng loại, tên chủng loại, mã nhà cung cấp, tên nhà cung cấp, xuất xứ nhà cung cấp
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryID,
    c.CategoryName,
    s.SupplierID,
    s.CompanyName
FROM Categories c JOIN Products p 
    ON c.CategoryID = P.CategoryID
    JOIN Suppliers s ON s.SupplierID = p.SupplierID
    
--2. In ra thông tin các sản phẩm được cung cấp bởi nhà cung cấp đến từ Mỹ
--- Output 1: mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, quốc gia, đơn giá, số lượng trong kho 
SELECT p.ProductID, 
       p.ProductName, 
       s.SupplierID, 
       s.CompanyName, 
       s.Country, 
       p.UnitPrice, 
       p.UnitsInStock
FROM Products p JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID

--- Output 2: mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, đơn giá, số lượng trong kho, mã chủng loại, tên chủng loại 
SELECT p.ProductID, 
       p.ProductName, 
       s.SupplierID, 
       s.CompanyName, 
       p.UnitPrice, 
       p.UnitsInStock, 
       c.CategoryID,
       c.CategoryName
FROM Categories c JOIN Products p
    ON c.CategoryID = p.CategoryID
    JOIN Suppliers s ON p.SupplierID = s.SupplierID

--3. In ra thông tin các sản phẩm được cung cấp bởi nhà cung cấp đến từ Anh, Pháp, Mỹ
--- Output: mã sản phẩm, tên sản phẩm, mã nhà cung cấp, tên nhà cung cấp, quốc gia, đơn giá, số lượng trong kho 
SELECT p.ProductID, 
       p.ProductName, 
       s.SupplierID, 
       s.CompanyName, 
       p.UnitPrice, 
       p.UnitsInStock
FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.Country IN('France', 'USA', 'UK')

--4. Có bao nhiêu nhà cung cấp?
SELECT COUNT(*) AS [No Supliers] FROM Suppliers

--5. Có bao nhiêu nhà cung cấp đến từ Mỹ ? 
SELECT COUNT(*) AS [No Supliers] FROM Suppliers s
WHERE s.Country = 'USA'

--6. Nhà cung cấp Exotic Liquids cung cấp những sản phẩm nào
--- Output 1: mã sản phẩm, tên sản phẩm, đơn giá, số lượng trong kho
-- sử dụng join
SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock
FROM Suppliers s JOIN Products p 
    ON s.SupplierID = p.SupplierID
WHERE s.CompanyName = 'Exotic Liquids'

--- Output 2: mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
SELECT p.ProductID, p.ProductName, c.CategoryID, c.CategoryName
FROM Suppliers s JOIN Products p 
    ON s.SupplierID = p.SupplierID JOIN 
    Categories c ON P.CategoryID = c.CategoryID
WHERE s.CompanyName = 'Exotic Liquids'

--- Output 3: mã nhà cung cấp, tên nhà cung cấp, mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
SELECT s.SupplierID, s.CompanyName, p.ProductID, p.ProductName, c.CategoryID, c.CategoryName
FROM Suppliers s JOIN Products p 
    ON s.SupplierID = p.SupplierID JOIN 
    Categories c ON P.CategoryID = c.CategoryID
WHERE s.CompanyName = 'Exotic Liquids' 

--7. Mỗi nhà cung cấp cung cấp bao nhiêu mặt hàng (nhãn hàng)
--- Output 1: mã nhà cung cấp, số lượng mặt hàng
SELECT SupplierID, COUNT(*) AS [No Products]
FROM Products 
GROUP BY SupplierID
--- Output 2: mã nhà cung cấp, tên nhà cung cấp, số lượng mặt hàng
SELECT s.SupplierID,  s.CompanyName, COUNT(*) AS [No Products]
FROM Suppliers s JOIN Products p
    ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID,  s.CompanyName

--8. Nhà cung cấp Exotic Liquids cung cấp bao nhiêu nhãn hàng?
--- Output: mã nhà cung cấp, tên nhà cung cấp, số lượng mặt hàng
SELECT s.SupplierID, s.CompanyName, COUNT(*) AS [No ]
FROM Suppliers s JOIN Products p
    ON s.SupplierID = p.SupplierID
    JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE s.CompanyName = 'Exotic Liquids'
GROUP BY s.SupplierID, s.CompanyName

--9. Nhà cung cấp nào cung cấp nhiều nhãn hàng nhất?
--- Output: mã nhà cung cấp, tên nhà cung cấp, số lượng nhãn hàng
SELECT s.SupplierID,  s.CompanyName, COUNT(*) AS [No Products]
FROM Suppliers s JOIN Products p
    ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID,  s.CompanyName
HAVING COUNT(*) >= ALL(
                        SELECT COUNT(*) AS [No Products]
                        FROM Suppliers s JOIN Products p
                            ON s.SupplierID = p.SupplierID
                        GROUP BY s.SupplierID,  s.CompanyName
                        
                        ) 

--10. Liệt kê các nhà cung cấp cung cấp từ 3 nhãn hàng trở lên
--- Output: mã nhà cung cấp, tên nhà cung cấp, số lượng nhãn hàng
SELECT s.SupplierID,  s.CompanyName, COUNT(*) AS [No Products]
FROM Suppliers s JOIN Products p
    ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID,  s.CompanyName
HAVING COUNT(*) >= 3

--11. Có bao nhiêu nhóm hàng/chủng loại hàng
SELECT COUNT(*) AS [No categories] FROM Categories

--12. In ra thông tin các sản phẩm (mặt hàng) kèm thông tin nhóm hàng
--- Output: mã nhóm hàng, tên nhóm hàng, mã sản phẩm, tên sản phẩm
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
FROM Categories c JOIN Products p
    ON c.CategoryID = p.CategoryID

--13. Liệt kê các sản phẩm thuộc nhóm hàng Seafood
--- Output 1: mã sản phẩm, tên sản phẩm
SELECT p.ProductID, p.ProductName
FROM Products p JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Seafood'

--- Output 2: mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
SELECT p.ProductID, p.ProductName, c.CategoryID, c.CategoryName
FROM Products p JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Seafood'

--14. Liệt kê các sản phẩm thuộc nhóm hàng Seafood và Beverages, sắp xếp theo nhóm hàng
--- Output 1: mã sản phẩm, tên sản phẩm
SELECT p.ProductID, p.ProductName
FROM Products p JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN('Seafood', 'Beverages')
ORDER BY c.CategoryName
--- Output 2: mã sản phẩm, tên sản phẩm, mã nhóm hàng, tên nhóm hàng
SELECT p.ProductID, p.ProductName, c.CategoryID, c.CategoryName
FROM Products p JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN('Seafood', 'Beverages')
ORDER BY c.CategoryName

--15. Mỗi nhóm hàng có bao nhiêu nhãn hàng/mặt hàng
--- Output 1: mã nhóm hàng, số lượng nhãn hàng 
SELECT c.CategoryID, COUNT(*) AS [No products]
FROM Categories c JOIN Products p 
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID

--- Output 2: mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng 
SELECT c.CategoryID, c.CategoryName, COUNT(*) AS [No products]
FROM Categories c JOIN Products p 
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName

--16. Nhóm hàng nào có nhiều nhãn hàng/mặt hàng nhất
--- Output: mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng 
SELECT c.CategoryID, c.CategoryName, COUNT(*) AS [No products]
FROM Categories c JOIN Products p 
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING COUNT(*) >= ALL(
                        SELECT COUNT(*) AS [No products]
                        FROM Categories c JOIN Products p 
                            ON c.CategoryID = p.CategoryID
                        GROUP BY c.CategoryID, c.CategoryName
                      )

--17. Nhóm hàng nào có từ 10 nhãn hàng/mặt trở lên
--- Output: mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng 
SELECT c.CategoryID, c.CategoryName, COUNT(*) AS [No products]
FROM Categories c JOIN Products p 
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING COUNT(*) >= 10

--18. In ra số lượng nhãn hàng/mặt hàng của 2 nhóm hàng Seafood và Beverages 
--- Output: mã nhóm hàng, tên nhóm hàng, số lượng nhãn hàng
SELECT c.CategoryID, c.CategoryName, COUNT(*) AS [No products]
FROM Categories c JOIN Products p 
    ON c.CategoryID = p.CategoryID
WHERE c.CategoryName IN('Seafood', 'Beverages')
GROUP BY c.CategoryID, c.CategoryName

--19. In ra tất cả các đơn hàng
--- Output 1: Mã đơn hàng, mã khách hàng, mã nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
SELECT o.OrderID, o.CustomerID, o.EmployeeID, o.OrderDate, o.ShipCountry
FROM Orders o JOIN Employees e 
    ON o.EmployeeID = e.EmployeeID

SELECT * FROM Customers
SELECT * FROM Orders
--- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, tên nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
SELECT o.OrderID, o.CustomerID, c.ContactName, o.EmployeeID, o.OrderDate, o.ShipCountry
FROM Employees e JOIN Orders o 
    ON o.EmployeeID = e.EmployeeID 
    JOIN Customers c ON o.CustomerID = c.CustomerID
--- Output 3: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, tên nhân viên bán hàng, ngày đặt hàng, mã công ty vận chuyển, tên công ty vận chuyển, gửi tới quốc gia nào
SELECT o.OrderID, o.CustomerID, c.ContactName, o.EmployeeID, o.OrderDate, o.ShipVia, o.ShipCountry
FROM Employees e JOIN Orders o 
    ON o.EmployeeID = e.EmployeeID 
    JOIN Customers c ON o.CustomerID = c.CustomerID
   
--20. In ra các đơn hàng gửi tới Mỹ
--- Output 1: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
SELECT o.OrderID, o.CustomerID, o.EmployeeID, o.OrderDate, o.ShipCountry
FROM Customers c JOIN Orders o 
    ON  c.CustomerID = o.CustomerID
WHERE ShipCountry = 'USA'

--- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, tên nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
SELECT o.OrderID, c.CustomerID, c.ContactName, e.EmployeeID, e.FirstName ,o.OrderDate, o.ShipCountry
FROM Customers c JOIN Orders o 
    ON c.CustomerID = o.CustomerID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID

--21. In ra các đơn hàng gửi tới Anh, Pháp, Mỹ
--- Output 1: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
SELECT o.OrderID, o.CustomerID, o.EmployeeID, o.OrderDate, o.ShipCountry
FROM Customers c JOIN Orders o 
    ON  c.CustomerID = o.CustomerID
WHERE ShipCountry IN('USA', 'France', 'UK')

--- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, mã nhân viên bán hàng, tên nhân viên bán hàng, ngày đặt hàng, gửi tới quốc gia nào
SELECT o.OrderID, c.CustomerID, c.ContactName, e.EmployeeID, e.FirstName ,o.OrderDate, o.ShipCountry
FROM Customers c JOIN Orders o 
    ON  c.CustomerID = o.CustomerID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE ShipCountry IN('USA', 'France', 'UK')

--22. Có tổng cộng bao nhiêu đơn hàng?
 SELECT COUNT(*) AS [No orders] FROM Orders

SELECT * FROM Orders
--23. In ra tổng số chi tiết của mỗi đơn hàng (mỗi đơn hàng có bao nhiêu dòng chi tiết)
--- Output 1: Mã đơn hàng, số lượng chi tiết đơn hàng
SELECT o.OrderID, COUNT(*) AS [No items]
FROM Orders o JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY o.OrderID
--- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, số lượng chi tiết đơn hàng
SELECT o.OrderID, c.CustomerID, c.CompanyName, COUNT(*) AS [No items]
FROM [Order Details] od JOIN Orders o
    ON o.OrderID = od.OrderID JOIN Customers c
        ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CustomerID, c.CompanyName

--24. HẮC NÃO!!!!! - Tính tổng tiền của mỗi đơn hàng (nhớ trừ tiền giảm giá tùy theo từng đơn)
--- Output 1: mã đơn hàng, tổng tiền (830 dòng) 
SELECT oD.OrderID, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Sum sale by group]
FROM [Order Details] od 
GROUP BY od.OrderID

--- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, tổng tiền
SELECT 
    o.OrderID, 
    c.CustomerID, 
    c.ContactName, 
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Sum sale by group]
FROM [Order Details] od JOIN Orders o
    ON od.OrderID = o.OrderID JOIN Customers c 
        ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CustomerID, c.ContactName

--25. In ra các đơn hàng có tổng tiền từ 1000$ trở lên
--- Output 1: mã đơn hàng, tổng tiền
SELECT od.OrderID, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Sum sale by group]
FROM [Order Details] od
GROUP BY od.OrderID
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) >= 1000

--- Output 2: Mã đơn hàng, mã khách hàng, tên khách hàng, tổng tiền
SELECT o.OrderID, c.CustomerID, c.ContactName, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Sum sale by group]
FROM [Order Details] od JOIN Orders o
    ON od.OrderID = o.OrderID JOIN Customers c 
        ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CustomerID, c.ContactName
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) >= 1000

--26. Tính tiền của các đơn hàng gửi tới Mỹ (tính riêng cho từng đơn hàng)
--- Output: mã đơn hàng, quốc gia, tổng tiền
SELECT o.OrderID, o.ShipCountry, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Sum sale by group]
FROM [Order Details] od JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.ShipCountry = 'USA'
GROUP BY o.OrderID, o.ShipCountry

--27. Tính tổng tiền của tất cả các đơn hàng gửi tới Mỹ (gom tổng)
--- Output: quốc gia, tổng tiền
SELECT 
    o.ShipCountry, 
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Total Sales]
FROM Orders o 
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.ShipCountry = 'USA'
GROUP BY o.ShipCountry

--28. Tính tiền của các đơn hàng gửi tới Anh, Pháp, Mỹ (tính riêng cho từng đơn hàng)
--- Output: quốc gia, mã đơn hàng, tổng tiền
SELECT 
    o.ShipCountry, od.OrderID, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Total Sales]
FROM [Order Details] od JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.ShipCountry IN('USA', 'UK', 'France')
GROUP BY o.ShipCountry, od.OrderID

--29. Tổng số tiền thu được từ tất cả các đơn hàng là bao nhiêu?
SELECT SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS [Total sales]
FROM Orders o JOIN [Order Details] od
    ON o.OrderID = od.OrderID

--30. In ra số lượng đơn hàng của mỗi khách hàng
--- Output: Mã khách hàng, tên khách hàng, số lượng đơn hàng đã mua
SELECT c.CustomerID, c.CompanyName, COUNT(*) AS [No orders]
FROM Customers c JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName

--31. Khách hàng nào có nhiều đơn hàng nhất?
--- Output: Mã khách hàng, tên khách hàng, số lượng đơn hàng đã mua
SELECT c.CustomerID, c.CompanyName, COUNT(*) AS [No orders]
FROM Customers c JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(*) >= ALL
                    (
                        SELECT COUNT(*) AS [No orders]
                        FROM Customers c JOIN Orders o 
                            ON c.CustomerID = o.CustomerID
                        GROUP BY c.CustomerID, c.CompanyName
                    )

--32. Có bao nhiêu công ty giao hàng?
SELECT COUNT(*) AS [No ShipCompany] FROM Shippers

--33. In ra số lượng đơn hàng mỗi công ty đã vận chuyển
--- Output: Mã công ty giao hàng, tên công ty giao hàng, số lượng đơn đã vận chuyển
SELECT s.ShipperID, s.CompanyName, COUNT(*) AS [No orders]
FROM Orders o JOIN Shippers s
    ON o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName

--34. Công ty nào vận chuyển nhiều đơn hàng nhất?
--- Output: Mã công ty giao hàng, tên công ty giao hàng, số lượng đơn đã vận chuyển
SELECT s.ShipperID, s.CompanyName, COUNT(*) AS [No orders]
FROM Orders o JOIN Shippers s
    ON o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName
HAVING COUNT(*) >= ALL 
                       (
                            SELECT COUNT(*) AS [No orders]
                            FROM Orders o JOIN Shippers s
                                ON o.ShipVia = s.ShipperID
                            GROUP BY s.ShipperID, s.CompanyName
                        )

--35. In ra các đơn hàng vận chuyển bởi công ty Speedy Express
--- Output 1: Mã đơn hàng, ngày đặt hàng, mã công ty giao hàng
SELECT o.OrderID, o.OrderDate, s.ShipperID
FROM Orders o JOIN Shippers s
    ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express' 
--- Output 2: Mã đơn hàng, ngày đặt hàng, gửi tới quốc gia nào, mã công ty giao hàng, tên công ty giao hàng
SELECT o.OrderID, o.OrderDate, o.ShipCountry, s.ShipperID, s.CompanyName
FROM Orders o JOIN Shippers s
    ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express' 

--36. Công ty Speedy Express đã vận chuyển bao nhiêu đơn hàng 
--- Output: Mã công ty giao hàng, tên công ty, số lượng đơn đã vận chuyển
SELECT s.ShipperID, s.CompanyName, COUNT(*) AS [No orders]
FROM Orders o JOIN Shippers s
    ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'Speedy Express'
GROUP BY s.ShipperID, s.CompanyName
SELECT * FROM Shippers
--37. Thêm công ty giao hàng sau vào database bằng cách chạy lệnh sau
INSERT INTO Shippers VALUES('UPS Vietnam', '(+84) 909...')
--    sau đó in ra số lượng đơn hàng mỗi công ty đã vận chuyển
--- Output: Mã công ty giao hàng, tên công ty giao hàng, số lượng đơn đã vận chuyển
SELECT s.ShipperID, s.CompanyName, COUNT(o.OrderID) AS [No orders]
FROM Shippers s LEFT JOIN Orders o
    ON o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName

--38. Tiếp nối câu trên, in ra thông tin vận chuyển hàng của các công ty giao vận, sắp xếp theo mã số công ty giao vận
--- Output: Mã công ty giao hàng, tên công ty giao hàng, mã đơn hàng, ngày đặt hàng
SELECT s.ShipperID, s.CompanyName, o.OrderID, o.OrderDate
FROM Shippers s LEFT JOIN Orders o
    ON o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName, o.OrderID, o.OrderDate

--39. Tiếp nối câu trên, công ty UPS Vietnam vận chuyển những đơn hàng nào?
--- Output: Mã công ty giao hàng, tên công ty giao hàng, mã đơn hàng, ngày đặt hàng
SELECT s.ShipperID, s.CompanyName, o.OrderID, o.OrderDate
FROM Shippers s LEFT JOIN Orders o
    ON o.ShipVia = s.ShipperID
WHERE s.CompanyName = 'UPS Vietnam'
GROUP BY s.ShipperID, s.CompanyName, o.OrderID, o.OrderDate
-- không vận chuyển đơn hàng nào cả
