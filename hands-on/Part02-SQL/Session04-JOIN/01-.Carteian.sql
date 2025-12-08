CREATE DATABASE Cartesian
USE Cartesian

--DB ~~~ KHO ~~ THÙNG CHỨA DATA BÊN TRONG
-- DATA BÊN TRONG CÁI TỦ ĐƯỢC CẤT DƯỚI DẠNG KỆ CÓ NGĂN - TABLE

CREATE TABLE Endict --DDL (một nhánh của SQL)
(					--Data Definition Languages
	Nmbr int, 
	EnDesc varchar(30)
)
--DROP TABLE Endict    --DDL

--từ điển Tiếng Anh
-- 1. One 
-- 2. Two
SELECT * FROM Endict    --DML: Data Manipulation Languages
INSERT INTO Endict VALUES (1, 'One') --DML
INSERT INTO Endict VALUES (2, 'Two')
INSERT INTO Endict VALUES (3, 'Three')

CREATE TABLE Vndict --DDL (một nhánh của SQL)
(					--Data Definition Languages
	Nmbr int, 
	VnDesc nvarchar(30)
)
INSERT INTO Vndict VALUES (1, N'Một') --DML
INSERT INTO Vndict VALUES (2, N'Hai') 
INSERT INTO Vndict VALUES (3, N'Ba') 

SELECT * FROM Vndict
SELECT * FROM Endict

--BÔI ĐEN 2 CÂU LỆNH NÀY CHẠY, THÌ KHÔNG PHẢI LÀ JOIN, NÓ LÀ 2 CÂU LỆNH RIÊNG BIỆT CHẠY
-- CÙNG LÚC CHO 2 TẬP HỢP RIÊNG BIỆT
--JOIN LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RAM, KHÔNG ẢNH HƯỞNG DỮ LIỆU GỐC 
--CỦA MỖI TABLE
-- JOIN LÀ SELECT CÙNG LÚC NHIỀU TABLE 

SELECT * FROM Vndict, Endict --sinh table mới, tạm thời lúc chạy
						     --số cột = tổng 2 bên
							 --số dòng = tích 2 bên 
SELECT * 
FROM Vndict, Endict
ORDER BY Nmbr --BỐI RỐI TRÙNG TÊN
--Ghép table, Join bị trùng tên cột, dùng alias (AS), ĐẶT TÊN GIẢ CHO THAM CHIẾU
--									 CHỈ ĐỊNH CỘT THUỘC TABLE NÀO ĐỂ TRÁNH NHẰM

SELECT 
	*
FROM Vndict, Endict 
ORDER BY Vndict.Nmbr

SELECT 
	*
FROM Vndict vn, Endict en
ORDER BY vn.Nmbr --đặt tên ngắn/giả cho table
				 --dùng tham chiếu cho các cột
SELECT 
	vn.Nmbr, vn.VnDesc, en.EnDesc
FROM Vndict vn, Endict en
ORDER BY vn.Nmbr

SELECT 
	vn.*, en.EnDesc
FROM Vndict vn, Endict en
ORDER BY vn.Nmbr

SELECT 
	vn.*, en.*
FROM Vndict vn, Endict en
ORDER BY vn.Nmbr

--CÚ PHÁP THỨ 2 - CHUẨN 
SELECT vn.*, en.*
FROM Vndict vn CROSS JOIN Endict en
ORDER BY en.Nmbr

--tui biết rằng có cặp ghép vài được, có tương hợp trong cell nào đó, WHERE Nmbr
SELECT vn.Nmbr, vn.VnDesc, en.EnDesc
FROM Vndict vn, Endict en
WHERE vn.Nmbr = en.Nmbr --rút từ 3x3 = 9 xuống còn 3

--ghéo có chọn lọc khi tìm tương quan giữa cột/cell để ghép -> INNER JOIN/OUTER
--						EQUI JOIN
--						ĐA PHẦN TƯƠNG GHÉP THEO TOÁN TỬ = 
--						CÒN CÓ THỂ GHÉP THEO >= <= < > !=

