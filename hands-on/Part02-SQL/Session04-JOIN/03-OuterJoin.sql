USE Cartesian

--1. liệt kê cho tôi các cặp từ điển Anh-Việt
SELECT * FROM Endict e, Vndict v
		 WHERE e.Nmbr = v.Nmbr
		 --có bằng cell thù mới ghép
SELECT * FROM Endict e INNER JOIN Vndict v
		 ON e.Nmbr = v.Nmbr
		 --hãy ghép, trên cột này có cell/value này = cell/value bên kia
SELECT * FROM Endict e JOIN Vndict v
		 ON e.Nmbr = v.Nmbr

-- ba câu tương đương kết quả

-- 2. Hụt mất của tui 4 - Four và 5 Năm không thấy xuất hiện 
-- muốn xh 4 Four, 5 Năm thì tích đề cát
SELECT * FROM Endict
SELECT * FROM Vndict

-- 3. Tui muốn xh lấy tiếng Anh làm chuẩn, tìm các nghĩa TV tương đương 
-- nếu không tương đương vẫn phải hiện ra
SELECT * FROM Endict e LEFT JOIN Vndict v
		 ON e.Nmbr = v.Nmbr
-- lấy Endict làm chuẩn nối sang bên kia
SELECT * FROM Endict e LEFT OUTER JOIN Vndict v
		 ON e.Nmbr = v.Nmbr

-- 4. Tui muốn lấy tiếng Việt làm đầu !!
SELECT * FROM Vndict v LEFT JOIN Endict e
		 ON e.Nmbr = v.Nmbr

-- vẫn lấy tiếng Việt làm đầu, nhưng để Tiếng Việt bên tay phải
SELECT * FROM Endict e RIGHT OUTER JOIN Vndict v
		 ON e.Nmbr = v.Nmbr

-- 5. Dù chung và riêng mỗi bên, lấy tất cả, chấp nhận FA ở 1 vế
SELECT * FROM Endict e FULL OUTER JOIN Vndict v
		 ON e.Nmbr = v.Nmbr

SELECT * FROM Endict e FULL JOIN Vndict v
		 ON e.Nmbr = v.Nmbr

SELECT * FROM Vndict v FULL JOIN Endict e
		 ON e.Nmbr = v.Nmbr
--FULL OUTER JOIN, THỨ TỰ TABLE KHÔNG QUAN TRỌNG, VIẾT TRƯỚC SAU ĐỀU ĐƯỢC
--LEFT, RIGHT JOIN THỨ TỰ TABLE LÀ CÓ CHUYỆN KHÁC NHAU

SELECT * FROM Endict e LEFT JOIN Vndict v
		 ON e.Nmbr = v.Nmbr --show 4 Four 

SELECT * FROM Vndict v LEFT JOIN Endict e
		 ON e.Nmbr = v.Nmbr --show 5 Năm

-- OUTER JOIN SINH RA ĐỂ ĐẢM BẢO VIỆC KẾT NỐI GHÉP BẢNG 
-- KHÔNG BỊ MẤT MÁT DATA
-- DO INNER  JOIN, JOIN = CHỈ TỈM CÁI CHUNG 2 BÊN

-- sau khi tìm ra được data chung và riêng, ta có quyền filter trên loại
-- cell nào đó, WHERE như bình thường

-- 6. In ra bộ từ điển Anh Việt (Anh làm chuẩn) của những con số
-- từ 3 trở lên
SELECT * FROM Endict e LEFT JOIN Vndict v
		 ON e.Nmbr = v.Nmbr --show 4 null
		 WHERE e.Nmbr >= 3

SELECT * FROM Endict e LEFT JOIN Vndict v
		 ON e.Nmbr = v.Nmbr --show 4 null
		 WHERE v.Nmbr >= 3

-- 7. In bộ từ điển Anh Việt, Việt Anh của những con số 
-- từ 3 trở lên
SELECT * FROM Endict e FULL JOIN Vndict v
		 ON e.Nmbr = v.Nmbr --show 4 null
		 WHERE e.Nmbr >= 3 --toang mất mẹ con số 5 của vn 

SELECT * FROM Endict e FULL JOIN Vndict v
		 ON e.Nmbr = v.Nmbr 
		 WHERE v.Nmbr >= 3 --có 5 mất 4 

SELECT * FROM Endict e FULL JOIN Vndict v
		ON e.Nmbr = v.Nmbr 
		WHERE v.Nmbr >= 3 OR e.Nmbr >= 3