#sql #select
[[DATABASE - SQL]]
## SERVER 
- APP chạy ngầm, không lộ rõ ra, không có USER INTERFACE để ta dùng chuột tương tác, không có mặt tiền, BACKGROUD PROCESS, CHƯƠNG TRÌNH chạy nền.
- Không lộ ra trên taskbar
- Dùng để cung cấp dịch vụ cho ai đó xài. App này gọi tên khác là SERVICE/SERVICES, phục vụ, hành động, icon/biểu tượng chung là 2 bánh răng cưa - ĐỘNG CƠ - RUN - ENGINE
- SERVE (V) -> SERVER  GÃ CHUYÊN PHỤC VỤ. 
- SQL SERVER trong Ram gọi: SERVICE, SERVER, DB ENGINE, BACKGROUND PROCESS. 
- Cần nó phục vụ mình phải giao tiếp với nó, chuột/phím -> chạm được server
- Chế ra 1 tool <----------------------------------------------> SERVER
	 UI
	USER INTERFACE
     SSMS                             <------------->                       INSTANCE/DB Engine/Server...
     CLIENT TOOL                 <------------->                      SERVER
     BROWSER                      <------------->                      SERVER, FB, TT, KÊNH 14


## TƯƠNG TÁC VỚI SQL SERVER (CLIENT)
- Có nhiều cách để kết nối tới SQL SERVER: SSMS tool hoặc qua Ngôn ngữ lập trình C#, Java, Php, Python,...
- Tool/PM tháy trên TASKBAR, UI TƯƠNG TÁC. 
- FOREGROUND.

## KHÁI NIỆM XOAY QUANH DBMS
- META-DATA -> SIÊU DỮ LIỆU, Dữ liệu dùng để quản lí dữ liệu khác. Không nên chạm và xóa.
![[Pasted image 20251116140938.png]]
- SSMS giao tiếp với DB ENGINE thông qua text, viết theo cú pháp gọi là **SQL** (Structure Query Languages - IBM)

## VIẾT CÂU LỆNH SELECT
- SELECT: ngôn ngữ giao tiếp với Database. 
```sql
USE Northwind --Chọn để chơi với thùng chứa data nào đó 
			  --tại 1 thời điểm chơi với 1 thùng chứa data

SELECT * FROM Customers
SELECT * FROM Employees

--------------------------------------------------------------
-- LÍ THUYẾT 
-- 1. DBE cung cấp câu lệnh SELECT dùng để
--	  in ra màn hình một cái gì đó ~ printf() sout()
--	  in ra dữ liệu có trong table (hàng/cột)
--    dùng cho mục đích nào thì kết quả hiển thị luôn là 1 table
-- 
--------------------------------------------------------------
-- THỰC HÀNH
-- 1. Hôm nay là ngày bao nhiêu ?? 
SELECT GETDATE() 
SELECT GETDATE() AS [Hôm nay là ngày]

-- 2. Bây giờ tháng mấy hỡi em?
SELECT MONTH(GETDATE()) AS [Bây giờ tháng mấy?]
SELECT YEAR(GETDATE()) AS [Bây giờ năm nào?]

-- 3. Trị tuyệt đối của -5 là mấy ?
SELECT ABS(-5) AS [Trị tuyệt đối của -5 là mấy?]

-- 4. 5 + 5 là mấy??
SELECT 5 + 5 AS [5 + 5 là mấy??]

-- 5. In ra tên của mình ?
SELECT N'Cao Gia Thinh' AS [My fullname is]
SELECT 'Cao' + N' Gia Thinh' AS [My fullname is]

-- 6. Tính tuổi
SELECT YEAR(GETDATE()) - 2003 AS [Age]

SELECT N'Cao ' + N'Gia Thịnh ' + CAST((YEAR(GETDATE()) - 2003) AS varchar)  + ' year old'
SELECT N'Cao ' + N'Gia Thịnh ' + CONVERT(varchar, (YEAR(GETDATE() - 2003))) + ' year old'


```
