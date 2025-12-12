CREATE DATABASE StudentManagement`

USE StudentManagement

CREATE TABLE Major
(
	MajorID char(2) PRIMARY KEY,         -- PK Primary Key - Khóa chính
	MajorName varchar(30),
	Hotline varchar(11)
)

INSERT INTO Major VALUES('SE', 'Software Engineering', '090x')
INSERT INTO Major VALUES('IA', 'Information Assurance', '091x')
INSERT INTO Major VALUES('GD', 'Graphic Design', '092x')
INSERT INTO Major VALUES('JP', 'Japanese', '093x')
INSERT INTO Major VALUES('KR', 'Korean', '094x')

SELECT * FROM Major

CREATE TABLE Student
(
	StudentID char(8) PRIMARY KEY,          -- PK Primary Key - Khóa chính
	LastName nvarchar(30),
	FirstName nvarchar(10),
	DOB date,
	Address nvarchar(50), 
	MajorID char(2) REFERENCES Major(MajorID)  -- FK Foreign Key - Khóa ngoại
)

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE1', N'Nguyễn', N'Một', 'SE');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE2', N'Lê', N'Hai', 'SE');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE3', N'Trần', N'Ba', 'SE');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE4', N'Phạm', N'Bốn', 'IA');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE5', N'Lý', N'Năm', 'IA');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('SE6', N'Võ', N'Sáu', 'IA');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('GD7', N'Đinh', N'Bảy', 'GD');
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('GD8', N'Huỳnh', N'Tám', 'GD');

INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('JP9', N'Ngô', N'Chín', 'JP');

SELECT * FROM Student

-- TỪ TỪ HÃY THÊM VÀO ĐỂ XEM FULL-OUTER JOIN RA SAO
INSERT INTO Student(StudentID, LastName, FirstName, MajorID) VALUES('UNK', N'Đặng', N'Mười', NULL);
SELECT * FROM Student
SELECT * FROM Major

-- tùy vào triết lý thiết kế mà mình phải tách bảng
-- mình cần nhiều thông tin, nhiều cột hơn, nên phải ghép ngang hay còn gọi là Join
-- rất cẩn thận khi chơi với inner join

-- 1. In ra thông tin chi tiết của sv kèm thông tin chuyên ngành 
SELECT * 
FROM Student --chỉ chứa thông tin sinh viên và mã chuyên ngành
SELECT * 
FROM Major --chỉ có info chuyên ngành 

-- JOIN chắn chắn, lấy info đang nằm ở bên kia ghép thêm theo chiều ngang
SELECT *
FROM Student s, Major m 
WHERE s.MajorID = m.MajorID --bị dư cột MajorID

--chỉ SELECT những cột thực sự cần 
SELECT s.*, m.MajorName, m.Hotline
FROM Student s, Major m 
WHERE s.MajorID = m.MajorID

SELECT s.*, m.MajorName, m.Hotline 
FROM Student s JOIN Major m 
	ON s.MajorID = m.MajorID

-- mất Major Korean 

-- 2. In ra thông tin chi tiết của sinh viên kèm info chuyên ngành chỉ quan tâm sinh viên SE, IA
-- phân tích: thông tin chi tiết chuyên ngành thì chắc chắn phải join 
SELECT s.*, m.MajorName, m.Hotline 
FROM Student s JOIN Major m 
	ON s.MajorID = m.MajorID
WHERE s.MajorID IN('SE', 'IA')

SELECT s.*, m.MajorName, m.Hotline 
FROM Student s JOIN Major m 
	ON s.MajorID = m.MajorID
WHERE s.MajorID = 'SE' OR s.MajorID = 'IA'

-- ghép vô tội vạ sau đó lọc lại qua where
SELECT s.*, m.MajorName, m.Hotline 
FROM Student s, Major m 
WHERE s.MajorID = m.MajorID AND (s.MajorID = 'SE' OR s.MajorID = 'IA')

-- 3. In ra thông tin các sinh viên kèm chuyên ngành. Chuyên ngành nào chưa có sinh viên cũng phải in ra
-- phân tích nếu căn theo sinh viên mà in, thì Hàn Quốc không xuất hiện
-- việc đúng ở đây là căn theo chuyên ngành mà đếm 

SELECT s.*, m.MajorName, m.Hotline 
FROM Student s RIGHT JOIN Major m 
	ON s.MajorID = m.MajorID

SELECT s.*, m.* 
FROM Student s RIGHT JOIN Major m 
	ON s.MajorID = m.MajorID

SELECT s.*, m.* 
FROM Major m LEFT JOIN Student s 
	ON s.MajorID = m.MajorID --10 dòng, korean fa null

-- thứ tự table đặt trong mệnh đề FROM để OUTER JOIN cực kì quan trọng
-- lấy bên nào làm gốc 

SELECT s.*, m.* 
FROM Major m RIGHT JOIN Student s 
	ON s.MajorID = m.MajorID --9 dòng, korean biến mất

-- 4. Có bao nhiêu chuyên ngành ?? 
SELECT COUNT(*) AS [No Major]
FROM Major

SELECT COUNT(MajorID) AS [No Major]
FROM Major

-- 5. Mỗi chuyên ngành có bao nhiêu sinh viên
-- output 0: số lượng sv đang theo học của từng chuyên ngành
-- output 1: mã cn | số sinh viên đang theo học
-- phân tích: đếm sinh viên, bao nhiêu sinh viên, đếm sv sure
-- gặp thêm từ mỗi 
-- mỗi chuyên ngành có một con số đếm, đếm theo chuyên ngành, nhóm chuyên ngành mà đếm
SELECT MajorID, COUNT(*) AS [No Student]
FROM Student
GROUP BY MajorID 

SELECT MajorID, COUNT(MajorID) AS [No Student]
FROM Student
GROUP BY MajorID

-- 6. Chuyên ngành nào có từ 3 sinh viên trở lên ? 
-- Phân tích: chia chặng ròi
--			  đầu tiên đếm chuyên ngành đã, quét qua bảng 1 lần về đếm ra sv
--			  đếm xong, dợt lại kết quả, lọc thêm cái từ 3 sv trở lên
--			  phải đếm xong từng ngành sau đó tính tiếp
SELECT MajorID, COUNT(*) AS [No Student]
FROM Student 
GROUP BY MajorID
HAVING COUNT(*) >= 3

-- 7. Chuyên ngành nào có ít sính viên nhất ? 
-- cách 1: dùng toán tử all
SELECT MajorID, COUNT(*) AS [No Student]
FROM Student
GROUP BY MajorID
HAVING COUNT(*) <= ALL(
						SELECT COUNT(*) AS [No Student]
						FROM Student
						GROUP BY MajorID
						)
-- cách 2: so sánh với max
SELECT MajorID, COUNT(*) AS [No Student]
FROM Student
GROUP BY MajorID
HAVING COUNT(*) = 
				(
					SELECT MIN([No Student])
					FROM (
						SELECT COUNT(*) AS [No Student]
					    FROM Student
				        GROUP BY MajorID) AS MinEle
				)

--coi bảng thống kê sinh viên theo chuyên ngành tìm max sau đó so sánh với max 

-- 8. Đếm số sinh viên của chuyên ngành SE
SELECT MajorID, COUNT(*) AS [No student]
FROM Student 
WHERE MajorID = 'SE'
GROUP BY MajorID --câu này nhanh hơn

-- cách group by sau đó lọc se ra sẽ có hiệu suất chạy chậm hơn
SELECT MajorID, COUNT(*) AS [No student]
FROM Student 
GROUP BY MajorID
HAVING MajorID = 'SE'

-- 9. Đếm số sinh viên của mỗi chuyên ngành 
-- output: mã chuyên ngành, tên chuyên ngàng, số lượng sinh viên
-- phân tích; đáp án cần có info của 2 table
--			  đếm trên 2 table 
--			  đếm trong Major hong có info sv
--			  đếm trong sv chỉ có được mã cn
--		      muốn có mã cn, tên cn, số lượng sv -> JOIN 2 BẢNG RỒI MỚI ĐẾM

SELECT s.FirstName, s.LastName,  m.MajorID, m.MajorName
FROM Student s INNER JOIN Major m
	ON s.MajorID = m.MajorID

SELECT m.MajorID, m.MajorName, COUNT(*) AS [No Student]
FROM Student s INNER JOIN Major m
	ON s.MajorID = m.MajorID
GROUP BY m.MajorID, m.MajorName

-- 10. 
-- thế còn chuyên ngành Korean thì sao
-- bị miss mất chuyên ngành hàn quốc
SELECT s.FirstName, s.LastName,  m.MajorID, m.MajorName
FROM Student s RIGHT JOIN Major m
	ON s.MajorID = m.MajorID
	
SELECT m.MajorID, m.MajorName, COUNT(*) AS [No Student]
FROM Student s RIGHT JOIN Major m
	ON s.MajorID = m.MajorID
GROUP BY m.MajorID, m.MajorName --vì có một dòng Korean FA, NULL VỀ SV
								--COUNT(1) CÓ 1 DÒNG HÀN QUỐC FA, HQ CÓ 1 SV SAI

SELECT m.MajorID, m.MajorName, COUNT(s.StudentID) AS [No Student]
FROM Student s RIGHT JOIN Major m
	ON s.MajorID = m.MajorID
GROUP BY m.MajorID, m.MajorName
-- count null lại đúng trong trường hợp này vì mã sinh viên null ứng với chuyên ngành hàn quốc
-- count(*) chi cần có dòng là ra số 1, chấp dòng có nhiều null hay không
-- đếm cell, cell null -> 0
-- đếm trên mã số sinh viên thay vì đếm trên dòng sẽ bị sai
-- dashboard màn hình thống kế của admin tuyển sinh