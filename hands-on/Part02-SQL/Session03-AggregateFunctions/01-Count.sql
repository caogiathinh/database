USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 

-- DB ENGINE hỗ trợ 1 loạt các nhóm hàm dùng thao tác trên dòng/cột, gom data tính toán
-- trên đám data gom này  -- AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT() SUM() MIN() MAX() AVG()
-- * CÚ PHÁP
-- SELECT CỘT ..., HÀM GOM NHÓM(), ... FROM <TABLE>

-- * CÚ PHÁP MỞ RỘNG
-- SELECT CỘT ..., HÀM GOM NHÓM(), ... FROM <TABLE> ... WHERE ... GROUP BY (GOM THEO CỤM CỘT NÀO)
-- SELECT CỘT ..., HÀM GOM NHÓM(), ... FROM <TABLE> ... WHERE ... GROUP BY (GOM THEO CỤM CỘT NÀO) HAVING .. 

-- * HÀM COUNT() DÙNG ĐỂ ĐẾM SỐ LẦN XUẤT HIỆN CỦA 1 CÁI GÌ ĐÓ ?? 
--		 COUNT(*) ĐẾM SỐ DÒNG TRONG TABLE, ĐẾM TẤT CẢ KHÔNG THEO TIÊU CHUẨN NÀO KHÁC
--		 COUNT(*) FROM ... WHERE... 
--					CHỌN RA NHỮNG DÒNG THỎA MÃN TIÊU CHÍ WHERE NÀO ĐÓ TRƯỚC ĐÃ, RỒI MỚI ĐẾM
--					FILTER RỒI ĐẾM
-- 
--		 COUNT(CỘT NÀO ĐÓ):
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. In ra danh sách các nhân viên 
SELECT * FROM Employees

-- 2. Đếm xem có bao nhiêu nhân viên 
SELECT COUNT(*) FROM Employees
SELECT COUNT(*) AS [Number of employees] FROM Employees

-- 3. Có bao nhiêu nhân viên ở London
SELECT COUNT(*) FROM Employees WHERE City = 'London'
SELECT COUNT(*) AS [No emps in London] FROM Employees WHERE City = 'London'

-- 4. Có bao nhiêu lượt thành phố xuất hiện -- cứ xuất hiện tên thành phố là đếm - ko care lặp lại hay không 
SELECT COUNT(City) FROM Employees --9

-- 5. Đếm xem có bao nhiêu Region
SELECT COUNT(Region) FROM Employees 
-- PHÁT HIỆN HÀM COUNT(CỘT), NẾU CELL CỦA CỘT CHỨA NULL, KO TÍNH KHÔNG ĐẾM

-- 6. Đếm xem có bao nhiêu dòng có khu vực null, có bao nhiêu dòng region null 
SELECT COUNT(*) FROM Employees WHERE Region IS NULL --đếm sự xuất hiện của dòng chứa Region null 

SELECT COUNT(Region) FROM Employees WHERE Region IS NULL --0 null không đếm được, không value

-- 7. Có bao nhiêu thành phố 
SELECT * FROM Employees

SELECT City FROM Employees -- 9
SELECT DISTINCT City FROM Employees --5
-- tui coi kết quả này là 1 table, mất quá trời công sức lọc ra 5 tp

-- SUB QUERY MỚI, COI 1 CÂU SELECT LÀ 1 TABLE, BIẾN TALBE NÀY VÀO TRONG MỆNH ĐỀ FROM 
SELECT * FROM  
			(SELECT DISTINCT City FROM Employees) AS [CITIES]
SELECT COUNT(*) FROM  
			(SELECT DISTINCT City FROM Employees) AS [CITIES] --5

SELECT COUNT(City) FROM Employees --9 City
SELECT COUNT(DISTINCT City) FROM Employees --5

-- 8. Đếm xem MỖI thành phố có bao nhiêu nhân viên
-- KHI CÂU HỎI CÓ TÍNH TOÁN GOM DATA (HÀM AGGREGATE) MÀ LẠI CHỨA TỪ KHÓA MỖI..
-- GẶP TỪ "MỖI", CHÍNH LÀ CHIA ĐỂ ĐẾM, CHIA ĐỂ TRỊ, CHIA CỤM ĐỂ GOM NHÓM
SELECT * FROM Employees

-- Seatle 2 | Tacoma 1 | Kirkland 1 | Redmond 1 | London 4
-- Sự xuất hiện của nhóm 
-- đếm theo sử xuất hiện của nhóm, count++ trong nhóm thôi, sau đó reset ở nhóm mới
SELECT COUNT(City) FROM Employees GROUP BY City --ĐẾM VALUE CỦA CITY, NHƯNG ĐẾM THEO NHÓM
												--CHIA CITY THÀNH NHÓM, RỒI ĐẾN TRONG NHÓM

SELECT City, COUNT(City) AS [No employees] FROM Employees GROUP BY City
SELECT EmployeeID ,City, COUNT(City) AS [No employees] FROM Employees GROUP BY EmployeeID, City
-- vô nghĩa, chia nhóm theo key, mssv

--CHỐT HẠ KHI XÀI HÀM GOM NHÓM, BẠN CÓ QUYỀN LIỆT KÊ TÊN CỘT LẺ Ở SELECT
--		  NHƯNG TÊN CỘT ĐÓ BẮT BUỘC PHẢI XUẤT HIỆN TRONG MỆNH ĐỀ GROUP BY
--        ĐỂ ĐẢM BẢO LOGIC: CỘT HIỂN THỊ | SỐ LƯỢNG ĐI KÈM, ĐẾM GOM THEO CỘT HIỂN THỊ MỚI LOGIC

-- CỨ THEO CỘT CITY MÀ GOM, CỘT CITY NẰM Ở SELECT LÀ HỢP LÝ 
-- MUỐN HIỂN THỊ SỐ LƯỢNG CỦA AI ĐÓ, GÌ ĐÓ, GOM NHÓM THEO CÁI GÌ ĐÓ 
-- NẾU BẠN GOM THEO KEY/PK, VÔ NGHĨA HEN, VÌ KEY HÔNG TRÙNG, MỖI THẰNG 1 NHÓM, ĐẾM CÁI GÌ ?? 

-- MÃ SỐ SV --- ĐẾM CÁI GÌ ? VÔ NGHĨA 
-- MÃ CHUYÊN NGÀNH -- ĐẾM SỐ SINH VIÊN CỦA CHUYÊN NGÀNH 
-- MÃ QUỐC GIA -- ĐẾM SỐ CHUYÊN NGÀNH
-- ĐIỂM THI -- ĐẾM SỐ LƯỢNG SINH VIÊN ĐẠT ĐƯỢC ĐIỂM ĐÓ
-- CÓ CỘT ĐỂ GOM NHÓM, CỘT ĐÓ DÙNG ĐỂ HIỂN THỊ SỐ LƯỢNG KẾT QUẢ
-- 

-- In ra mã nv
-- 1 London 1
-- 2 Seatle 1
-- 3        1
-- 4        1
-- 5        1

SELECT City, COUNT(*) AS [No employees] FROM Employees GROUP BY City

-- 9. Hãy cho tôi biết thành phố nào có từ 2 nv trở lên
-- 2 chặng làm 
-- 9.1. Các thành phố có bao nhiêu nhân viên
-- 9.2. Đếm xong mỗi thành phố ta bắt đầu lọc lại kết quả sau đếm
-- FILTER SAU ĐẾM, WHERE SAU ĐẾM, WHERE SAU KHI ĐÃ GOM NHÓM, AGGRATE THÌ GỌI LÀ HAVING
SELECT 
	City, COUNT(City) AS [No employees] 
FROM Employees 
GROUP BY City

SELECT 
	City, COUNT(*) AS [No employees] 
FROM Employees 
GROUP BY City

SELECT 
	City, COUNT(*) AS [No employees] 
FROM Employees 
GROUP BY City 	
HAVING COUNT(*) >= 2

-- 10. Đếm số nhân viên của 2 thành phố Seattle và London
SELECT 
	COUNT(*) AS [No Employees] 
FROM Employees 
WHERE City IN ('Seattle', 'London') --6

SELECT 
	City, COUNT(*) AS [No Employees] 
FROM Employees 
WHERE City IN ('Seattle', 'London') 
GROUP BY City

-- 11. Trong 2 tp, London Seattle, tp nào có nhiều hơn 3 nhân viên
SELECT 
	City, COUNT(*) AS [No Employees] 
FROM Employees
WHERE City IN ('Seattle', 'London') 
GROUP BY City 
HAVING COUNT(*) >= 3

-- 12. Đếm xem có bao nhiêu mặt hàng đã bán ra
SELECT COUNT(*) AS [No Orders] FROM Orders --830
SELECT COUNT(OrderID) AS [No Orders] FROM Orders --830
-- 830 mã đơn khác nhau, đếm mã đơn, hay đếm cả cái đơn là như nhau
-- nếu cột có value null là ăn hành
-- 12.1. Nước Mĩ có bao nhiêu đơn hàng
-- đi tìm Mĩ mà đếm, lọc Mĩ rồi tính tiếp, WHERE MĨ
-- KHÔNG PHẢI LÀ CÂU GOM CHIA NHÓM, HONG CÓ MỖI QUỐC GIA BAO NHIÊU ĐƠN
-- MỖI QUỐC GIA CÓ BAO NHIÊU ĐƠN, COUNT THEO QUỐC GIA, GROUP BY THEO QUỐC GIA
SELECT 
	COUNT(*) AS [No USA Orders]  
FROM Orders 
WHERE ShipCountry = 'USA'

-- 12.2. Mĩ Anh Pháp chiếm tổng cộng bao nhiêu đơn hàng
SELECT 
	COUNT(*) AS [No Orders]
FROM Orders 
WHERE ShipCountry IN('USA', 'France', 'UK') --255

-- 12.3. Mĩ Anh Pháp mỗi quốc gia có bao nhiêu đơn hàng 
SELECT 
	ShipCountry, 
	COUNT(*) AS [No orders]
FROM Orders 
WHERE ShipCountry IN('USA', 'UK', 'France') --225 cho cả 3
GROUP BY ShipCountry
-- hoặc có thể () OR () OR ()

-- 12.4. Trong 3 quốc gia Anh Pháp Mĩ quốc gia nào có từ 100 đơn hàng trở lên
SELECT 
	ShipCountry, 
	COUNT(*) AS [No Orders]
FROM Orders 
WHERE ShipCountry IN('USA', 'UK', 'France')
GROUP BY ShipCountry
HAVING COUNT(*) >= 100

-- 13. Đếm xem có bao nhiêu mặt hàng có trong kho
-- 14. Đếm xem có bao nhiêu lượt quốc gia đã mua hàng
-- 15. Đếm xem có bao nhiêu quốc gia đã mua hàng (mỗi quốc gia đếm một lần)
-- 16. Đếm số lượng đơn hàng của mỗi quốc gia
-- 17. Quốc gia nào có từ 10 đơn hàng trở lên 
-- 18. Đếm xem mỗi chủng loại hàng có bao nhiêu mặt hàng (bia rượu có 5 sản phẩm, thủy sản có 10 sản phẩm)
-- 19. Trong 3 quốc gia A P M, quốc gia nào có nhiều đơn hàng nhất
-- 20. Quốc gia nào có nhiều đơn hàng nhất 
-- 21. Thành phố nào có nhiều nhân viên nhất


