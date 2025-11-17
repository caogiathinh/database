USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- MỘT DB là nơi chứa data (bán hàng, thư viện, qlsv, ... ) 
-- DATA được lưu dưới dạng table, tách thành nhiều TABLE (nghệ thuật design database)
-- DÙNG LỆNH SELECT để in dữ liệu từ table, hiển thị dươi dạng table 
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						 * đại diện cho việc tui muốn lấy all of column

-- CÚ PHÁP MỞ RỘNG:
--					SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁCH-NHAU-DẤU-PHẨY FROM <TABLE>
--					SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT DỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--					FROM <TÊN-TABLE>


-- Data trả về có cell/ô có từ NULL, hiểu rằng chưa xác định value/giá trị, chưa có, chưa biết
-- từ từ cập nhật sau. Ví dụ sinh viên kí tên vào danh sách thi, cột điểm ngay lúc kí tên 
-- gọi là NULL, mang trạng thái chưa xác định 

--------------------------------------------------------------
-- THỰC HÀNH

-- 1. Xem thông tin của tất cả các k/h đang giao dịch với mình
SELECT * FROM Customers

-- 2. Xem thông tin nhân viên, xem hết các cột
SELECT * FROM Employees

-- 3. Xem các sản phẩm bán đang có trong kho
SELECT * FROM Products

-- 4. Mua hàng, thông tin sẽ nằm ở table Orders và OrderDetails
SELECT * FROM Orders --830 đơn hàng - bill 

-- 5. Xem thông tin công ty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers VALUES(1, 'Fedex Vietnam', '(084)90.....')

-- 6. Xem chi tiết mua hàng 
SELECT * FROM Orders			 -- phần trên của hóa đơn siêu thị 
SELECT * FROM [Order Details]	 -- phần table kẻ gióng những món hàng đã mua
								 -- phần đáy dưới build siêu thị

-- 7.In ra thông tin khách hàng, chỉ gồm cột Id, ContactName, Country
SELECT CustomerID, CompanyName, Country FROM Customers

-- 8. In ra thông tin nhân viên, chỉ cần Id, Last, Title, DOB,..
-- Tên người tách thành Last và First: dành cho mục tiêu sort theo tiêu chí nào đó: tên hay họ 
-- In ra theo phong cách, quy ước của từng quốc gia
SELECT * FROM Employees
SELECT EmployeeID, LastName, FirstName, Title, BirthDate FROM Employees

-- 9. Ghép tên in ra thông tin nhân viên, gộp cột, tính luôn tuổi giùm tui
SELECT 
	EmployeeID, 
	LastName + ' ' + FirstName AS [FullName], 
	Title,
	BirthDate
FROM Employees

SELECT 
	EmployeeID, 
	LastName + ' ' + FirstName AS [FullName], 
	Title,
	BirthDate,
	YEAR(BirthDate)
FROM Employees

SELECT 
	EmployeeID, 
	LastName + ' ' + FirstName AS [FullName], 
	Title,
	BirthDate,
	YEAR(GETDATE()) - YEAR(BirthDate) AS Age
FROM Employees

-- 10. In ra thông tin chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity AS [Total] FROM [Order Details]

--CÔNG THỨC TÍNH TỔNG TIỀN TỬNG MÓN CÓ TRỪ ĐI GIẢM GIÁ, PHẦN TRĂM 
--SL * ĐG - (TIỀN GIÀM GIÁ) -> PHẢI TRẢ
--SL * ĐG - SL * ĐG * DISCOUNT (%) ===> PHẢI TRẢ
--SL * ĐG * (1 - DISCOUNT (%)) => TIỀN PHẢI TRẢ
SELECT *, UnitPrice * Quantity * (1 -Discount) AS [SubTotal] FROM [Order Details]

