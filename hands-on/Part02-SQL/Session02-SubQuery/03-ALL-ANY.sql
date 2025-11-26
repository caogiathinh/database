USE Northwind

--------------------------------------------------------------
-- LÍ THUYẾT 
-- Cú pháp chuẩn của câu lệnh SELECT
-- SELECT * FROM <TABLE> WHERE.... 
-- WHERE CỘT TOÁN-TỬ-SO-SÁNH VỚI VALUE-CẦN-LỌC
--       CỘT > >= < <= != VALUE
--						  CÓ THỂ SỬ DỤNG CÂU SUBQUERY TÙY NGỮ CẢNH
--	     CỘT            = (SUB CHỈ CÓ 1 VALUE)
--	     CỘT			IN (SUB CHỈ CÓ MỘT CỘT NHƯNG NHIỀU VALUE)

--	     CỘT			> < >= <= ALL(1 CÂU SUB 1 CỘT NHIỀU VALUE)
--								  ANY(1 CÂU SUB 1 CỘT NHIỀU VALUE)
--------------------------------------------------------------
-- THỰC HÀNH
-- tạo 1 table có một cột tên là Numbr, chỉ chứa đống dòng các số nguyên
CREATE TABLE Num
(
	NumBr int
)

SELECT * FROM Num
INSERT INTO Num VALUES (1)
INSERT INTO Num VALUES (1)
INSERT INTO Num VALUES (2)
INSERT INTO Num VALUES (9)
INSERT INTO Num VALUES (5)
INSERT INTO Num VALUES (100)
INSERT INTO Num VALUES (101)

-- 1. In ra những số > 5
SELECT * FROM Num WHERE NumBr > 5

-- 2. In ra số lớn nhất trong 1 số đã nhập
-- SỐ LỚN NHẤT TRONG 1 ĐÁM ĐƯỢC ĐỊNH NGHĨA LÀ: MÀY LỚN HƠN CẢ ĐÁM NGOẠI TRỪ MÀY
-- lớn hơn tất cả ngoại trừ chính mình -> mình là MAX CỦA ĐÁM
SELECT * FROM Num WHERE NumBr = 101 --lầy
SELECT * FROM Num WHERE NumBr >= ALL(SELECT * FROM Num)

-- 3. Số nhỏ nhất là số nào ?
SELECT * FROM Num WHERE NumBr <= ALL(SELECT * FROM Num)

SELECT * FROM Num WHERE NumBr < ALL(SELECT * FROM Num)   --rỗng

-- 4. Ai lớn tuổi nhất nhân viên nào lớn tuổi nhất
SELECT * FROM Employees WHERE BirthDate <= ALL(SELECT BirthDate FROM Employees)

-- 5. Đơn hàng nào có trọng lượng nặng nhất
SELECT * FROM Orders WHERE Freight >= ALL(SELECT Freight FROM Orders)