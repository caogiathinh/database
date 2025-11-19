USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG CỦA LỆNH SELECT
-- Trong thực tế có những lúc dữ liệu/info chưa xác định được nó là gì ?
-- kí tên danh sách, danh sách kí tên có cột điểm, diểm ngay lúc kí tên chưa xác định được 
-- từ từ sẽ có, sẽ update sau
-- hiện tượng dữ liệu chưa xác định, chưa biết, từ từ đưa vào sau, hiện nhìn vào 
-- chưa thấy có data, thì ta gọi giá trị chưa xác định này là NULL 
-- NULL đại diện cho thứ chưa xác định, chưa xác định tức là không có giá trị, không giá trị 
-- THÌ KHÔNG THỂ SO SÁNH > < >= <= != 
-- CÂM TUYỆT ĐỐI XÀI CÁC TOÁN TỬ SO SÁNH ĐỂ KÈM VỚI GIÁ TRỊ NULL 
-- TA DÙNG TOÁN TỬ, IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ FILLTER CELL CÓ
-- GIÁ TRỊ NULL 
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách nhân viên 
SELECT * FROM Employees

-- 2. Ai chưa xác định khu vực, region null
SELECT * FROM Employees WHERE Region = 'NULL' --0, vì không ai ở khu vực tên là NULL 
SELECT * FROM Employees WHERE Region = NULL   --0, vì NULL không thể dùng > < = 
SELECT * FROM Employees WHERE Region IS NULL  --4

-- 3. Những ai đã xác định được khu vực cư trú
SELECT * FROM Employees WHERE REGION IS NOT NULL  --4
SELECT * FROM Employees WHERE NOT(Region IS NULL) --5

-- 4. Những nhân viên đại diện kinh doanh và xác định đc nơi cư trú
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND Region IS NOT NULL
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND NOT(Region IS NULL)

-- 5. Liệt kê danh sách khách hàng đến từ Anh Pháp Mĩ, có cả thông tin số fax và region
SELECT * FROM Customers WHERE Country IN('UK', 'USA', 'France') 
								AND (Fax IS NOT NULL)
								AND (Region IS NOT NULL) 


