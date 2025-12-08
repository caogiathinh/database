SELECT * FROM Vndict, Endict --tích đề-các
SELECT * FROM Vndict CROSS JOIN Endict

SELECT * FROM Vndict vn, Endict	en --Tích đềcat xog fillter lại
		 WHERE vn.Nmbr = en.Nmbr

SELECT * FROM Vndict, Endict
WHERE Nmbr = Nmbr --bối rối tên

SELECT * FROM Vndict, Endict
		 WHERE Vndict.Nmbr = Endict.Nmbr --nên đặt alias thì giúp ngắn gọn câu lệnh 
		 
--cách viết chuẩn thế giới 
SELECT * FROM Vndict INNER JOIN Endict --nhìn sâu vào talbe rồi ghép, không ghép bừa bãi
						ON Vndict.Nmbr = Endict.Nmbr --ghép có tương quan bên trong, theo điểm chung

SELECT * FROM Vndict JOIN Endict --nhìn sâu vào talbe rồi ghép, không ghép bừa bãi
						ON Vndict.Nmbr = Endict.Nmbr

--CÓ THỂ DÙNG THÊM WHERE ĐƯỢC HAY KHÔNG ? KHI XÀI INNER, JOIN
--JOIN chỉ là thêm data để tính toán, gộp data lại nhiều đơn, sau đó áp dụng toàn bộ kiến thức
--SELECT đã học


