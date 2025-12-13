--DROP DATABASE ClubManagement

CREATE DATABASE ClubManagement

USE ClubManagement

--DROP TABLE Club
CREATE TABLE Club
(
	ClubID char(5) PRIMARY KEY,         -- PK Primary Key - Khóa chính
	ClubName nvarchar(50),
	Hotline varchar(11)
)

INSERT INTO Club VALUES('SiTi', N'Cộng đồng Sinh viên Tình nguyện', '090x')
INSERT INTO Club VALUES('SkllC', N'Skillcetera', '091x')
INSERT INTO Club VALUES('CSG', N'CLB Truyền thông Cóc Sài Gòn', '092x')
INSERT INTO Club VALUES('FEV', N'FPT Event Club', '093x')
INSERT INTO Club VALUES('FCode', N'FPT Code', '094x')

SELECT * FROM Club

--DROP TABLE Student
CREATE TABLE Student
(
	StudentID char(8) PRIMARY KEY,          -- PK Primary Key - Khóa chính
	LastName nvarchar(30),
	FirstName nvarchar(10),
	DOB date,
	Address nvarchar(50)	
)

INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE1', N'Nguyễn', N'Một');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE2', N'Lê', N'Hai');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE3', N'Trần', N'Ba');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE4', N'Phạm', N'Bốn');
INSERT INTO Student(StudentID, LastName, FirstName) VALUES('SE5', N'Lý', N'Năm');

SELECT * FROM Student

--DROP TABLE Registration
CREATE TABLE Registration
(
	RegID int IDENTITY(1, 1) PRIMARY KEY,   -- PK Primary Key - Khóa chính - Tăng tự động từ 1	      
	StudentID char(8),
	ClubID char(5),    
	JoinedDate date,
	LeavedDate date
	CONSTRAINT FK_Reg_Club FOREIGN KEY (ClubID) REFERENCES Club(ClubID),                -- FK Foreign Key - Khóa ngoại
	CONSTRAINT FK_Reg_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID)     -- FK Foreign Key - Khóa ngoại
)


-- SiTi 3, SkllC 2, CSG 2, FEV 0, FCODE 0
-- SE1 3, SE2 3, SE3 1, SE4 0, SE5 0
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'SiTi')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'SkllC')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE1', 'CSG')


INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'SiTi')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'SkllC')
INSERT INTO Registration(StudentID, ClubID) VALUES('SE2', 'CSG')

INSERT INTO Registration(StudentID, ClubID) VALUES('SE3', 'SiTi')

SELECT * FROM Student
SELECT * FROM Club
SELECT * FROM Registration

-- bài toán trên mối quan hệ n - n
SELECT * FROM Student

-- THỰC HÀNH
-- 1. Liệt kê thông sinh viên đang theo học 
SELECT * FROM Student

-- 2. Liệt kê thông tin sinh viên đang theo học kèm theo clb bạn í tham gia
-- Output1: Mã sv, tên sv, mã clb
-- Output2: Mã sv, tên sv, mã clb, tên clb
SELECT * FROM Student
SELECT * FROM Registration

-- cần hiểu kiến trúc table đế có thể join đúng
SELECT * --ghép 2 table sát nhau, nhiều cột
FROM Student s JOIN Registration r
	ON s.StudentID = r.StudentID

SELECT s.StudentID, s.FirstName + ' '  + s.LastName AS [Full Name], r.ClubID--ghép 2 table sát nhau, nhiều cột
FROM Student s JOIN Registration r
	ON s.StudentID = r.StudentID --rút bớt cột
-- thiếu mất sv 4, 5 vì INNER JOIN

SELECT s.StudentID, s.FirstName + ' '  + s.LastName AS [Full Name], r.ClubID--ghép 2 table sát nhau, nhiều cột
FROM Student s LEFT JOIN Registration r
	ON s.StudentID = r.StudentID

-- 3. In ra thông tin tham gia clb của các sv
-- output: mã sv, tên sv, mã clb, tên clb, join date
SELECT *
FROM Student s LEFT JOIN Registration r 
	ON s.StudentID = r.StudentID 
	JOIN Club c ON r.ClubID = c.ClubID

SELECT s.StudentID, s.FirstName, c.ClubID, c.ClubName, r.JoinedDate
FROM Student s JOIN Registration r 
	ON s.StudentID = r.StudentID 
	JOIN Club c ON r.ClubID = c.ClubID
--vãn đề lớn: mất nó clb FCode FEV, và sinh viên SE4, SE5

SELECT s.StudentID, s.FirstName, c.ClubID, c.ClubName, r.JoinedDate
FROM Student s, Registration r, Club c
WHERE s.StudentID = r.StudentID AND r.ClubID = c.ClubID
--với cách này ko thể lấy được phần riêng của từng bảng, cách viết thực dụng 
--khi lấy được phần hụt, vì nó chỉ đi tìm đám bằng nhau common field
--ghép và in ra, thằng nào bị hụt, kệ. 

-- JOIN SẼ GIÚP, VÌ NÓ NHÌN LUÔN PHẦN CHUNG VÀ PHẦN BỊ HỤT
SELECT s.StudentID, s.FirstName, c.ClubID, c.ClubName, r.JoinedDate
FROM Student s FULL JOIN Registration r 
	ON s.StudentID = r.StudentID 
	FULL JOIN Club c ON r.ClubID = c.ClubID    --11

-- Bài tập
-- 1. Đếm số clb mà mỗi sv đã tham gia
-- Output: mã sv, tên sv, số clb-tham-gia
SELECT s.StudentID, s.FirstName, COUNT(r.StudentID) AS [No clbs]
FROM Student s LEFT JOIN Registration r
	ON s.StudentID = r.StudentID
GROUP BY s.StudentID, s.FirstName

-- 2. Sinh viên SE1 tham gia mấy clb
-- Output: mã sv, tên sv, số clb-tham-gia
SELECT s.StudentID, s.FirstName, COUNT(r.StudentID) AS [No clbs]
FROM Student s LEFT JOIN Registration r
	ON s.StudentID = r.StudentID
WHERE s.StudentID = 'SE1'
GROUP BY s.StudentID, s.FirstName

-- 3. Sinh viên nào tham gia nhiều clb nhất ?? -- SE1, SE2
SELECT s.StudentID, s.FirstName, COUNT(r.StudentID) AS [No clbs]
FROM Student s LEFT JOIN Registration r
	ON s.StudentID = r.StudentID
GROUP BY s.StudentID, s.FirstName
HAVING COUNT(r.StudentID) = 
							(
								SELECT MAX([No clbs])
								FROM(
								SELECT COUNT(r.StudentID) AS [No clbs]
								FROM Student s LEFT JOIN Registration r
									ON s.StudentID = r.StudentID
								GROUP BY s.StudentID, s.FirstName) GoCLB
							)

SELECT s.StudentID, s.FirstName, COUNT(r.StudentID) AS [No clbs]
FROM Student s LEFT JOIN Registration r
	ON s.StudentID = r.StudentID
GROUP BY s.StudentID, s.FirstName
HAVING COUNT(r.StudentID) >= ALL 
							(
								SELECT COUNT(r.StudentID) AS [No clbs]
								FROM Student s LEFT JOIN Registration r
									ON s.StudentID = r.StudentID
								GROUP BY s.StudentID, s.FirstName
							)
-- 4. CLB Cộng động Sinh viên Tình nguyện có những sv nào tham gia (gián tiếp)
-- không dùng sub cũng okie. nhớ là tui không có hỏi SiTi à nhen
SELECT r.StudentID, c.ClubName
FROM Club c JOIN Registration r
	ON c.ClubID = r.ClubID
WHERE c.ClubName = N'Cộng đồng Sinh viên Tình nguyện'

-- 5. Mỗi clb có bao nhiêu thành viên
-- Output: mã clb, tên clb, số thành viên
SELECT c.ClubID, c.ClubName, COUNT(r.ClubID) AS [No Students]
FROM Club c LEFT JOIN Registration r
	ON c.ClubID = r.ClubID
GROUP BY c.ClubID, c.ClubName

-- 6. Clb nào đông member nhất
-- Output: mã clb, tên clb, số thành viên
SELECT c.ClubID, c.ClubName, COUNT(r.ClubID) AS [No Students]
FROM Club c LEFT JOIN Registration r
	ON c.ClubID = r.ClubID
GROUP BY c.ClubID, c.ClubName
HAVING COUNT(r.ClubID) >= ALL
							(
								SELECT COUNT(r.ClubID) AS [No Students]
								FROM Club c LEFT JOIN Registration r
									ON c.ClubID = r.ClubID
								GROUP BY c.ClubID, c.ClubName
							)

SELECT c.ClubID, c.ClubName, COUNT(r.ClubID) AS [No Students]
FROM Club c LEFT JOIN Registration r
	ON c.ClubID = r.ClubID
GROUP BY c.ClubID, c.ClubName
HAVING COUNT(r.ClubID) =
						(
							SELECT MAX([No Students])
							FROM(
							SELECT COUNT(r.ClubID) AS [No Students]
							FROM Club c LEFT JOIN Registration r
								ON c.ClubID = r.ClubID
							GROUP BY c.ClubID, c.ClubName) ClubGroup
						)

-- 7. CLB SiTi và CSG có bao nhiêu member. Đếm riêng từng clb
-- Output: mã clb, tên clb, số thành viên (2 dòng)
SELECT c.ClubID, c.ClubName, COUNT(r.ClubID) AS [No Student]
FROM Club c JOIN Registration r
	ON c.ClubID = r.ClubID
WHERE C.ClubID IN('CSG', 'SiTi')
GROUP BY c.ClubID, c.ClubName

-- 8. Có tổng cộng bao nhiêu lượt sinh viên tham gia clb
SELECT COUNT(*) AS [No Student]
FROM Registration
