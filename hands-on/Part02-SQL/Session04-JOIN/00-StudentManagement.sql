CREATE DATABASE StudentManagement

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

SELECT * FROM Major
SELECT * FROM Student

-- 1. In ra thông tin chi tiết của sinh viên và thông tin chuyên ngành
SELECT * FROM Student --info tắt của sinh viên kèm thông tin chuyên ngành
SELECT * FROM Major	  --chỉ có info của chuyên ngaanh, thiếu info sinh viên
--chắn chắn phải join, rồi lấy info đang nằm ở bảng kia ghép lại theo chiều ngang
SELECT * FROM Student s, Major m
		 WHERE s.MajorID = m.MajorID --dư cột MajorID

SELECT s.*, m.MajorName, m.Hotline FROM Student s, Major m
		 WHERE s.MajorID = m.MajorID

SELECT s.*, m.MajorName, m.Hotline FROM Student s JOIN Major m
		 ON s.MajorID = m.MajorID

SELECT s.*, m.MajorName, m.Hotline FROM Student s INNER JOIN Major m
		 ON s.MajorID = m.MajorID

-- 2. In ra thông tin chi tiết của sinh viên có kèm info chuyên ngành, chỉ quan tâm sv SE và IA
SELECT s.*, m.MajorName, m.Hotline 
FROM Student s JOIN Major m
		 ON s.MajorID = m.MajorID
WHERE m.MajorID IN('SE', 'IA')

SELECT s.*, m.MajorName, m.Hotline
FROM Student s JOIN Major m
		 ON s.MajorID = m.MajorID
WHERE m.MajorID IN('SE', 'IA') --6

SELECT s.*, s.MajorID, m.MajorName, m.Hotline
FROM Student s, Major m
WHERE s.MajorID = m.MajorID AND m.MajorID IN('SE', 'IA') --tích đề cát sau đó lọc lại dữ liệu

-- 3. In ra thông tin sinh viên kèm chuyên ngành. Chuyên ngành nào chưa số sinh viên cũng in ra luôn 
-- phân tích: căn theo sinh viên mà in, thì HÀN QUỐC tèo không xuất hiện
SELECT s.*, m.* 
FROM Student s RIGHT JOIN Major m
	ON s.MajorID = m.MajorID --10

SELECT s.*, m.* --thứ tự hiển thị không phải là câu chuyện 
FROM Major m LEFT JOIN Student s
	ON s.MajorID = m.MajorID --10

SELECT s.*, m.* --thứ tự hiển thị không phải là câu chuyện 
FROM Student s LEFT JOIN Major m
	ON s.MajorID = m.MajorID --không có chuyên ngành korean, căn theo sinh viên

-- 4. Có bao nhiêu chuyên ngành??
SELECT COUNT(*) AS [No Major]
FROM Major

