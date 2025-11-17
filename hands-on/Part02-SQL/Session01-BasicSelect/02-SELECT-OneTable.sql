USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- MỘT DB là nơi chứa data (bán hàng, thư viện, qlsv, ... ) 
-- DATA được lưu dưới dạng table, tách thành nhiều TABLE (nghệ thuật design database)
-- DÙNG LỆNH SELECT để in dữ liệu từ table, hiển thị dươi dạng table 
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						 * đại diện cho việc tui muốn lấy all of column
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

-- 6. Xem chi tiết mua hàng 
SELECT * FROM Orders			 -- phần trên của hóa đơn siêu thị 
SELECT * FROM [Order Details]	 -- phần table kẻ gióng những món hàng đã mua
								 -- phần đáy dưới build siêu thị

