-- BaiTap1
CREATE DATABASE quanlysach;
USE quanlysach;

CREATE TABLE tacgia(
	MaTacGia INT PRIMARY KEY,
	TenTacGia VARCHAR(100) NOT NULL,
	QuocTich VARCHAR(50) NULL
);

CREATE TABLE sach(
	MaSach INT PRIMARY KEY,
	TenSach VARCHAR(200) NOT NULL,
	NamXuatBan INT NULL,
	MaTacGia INT,
	FOREIGN KEY (MaTacGia) REFERENCES tacgia(MaTacGia)
);

-- BaiTap2
INSERT INTO tacgia(MaTacGia, TenTacGia, QuocTich) VALUES
(1, 'Nguyễn Nhật Ánh', 'Việt Nam'),
(2, 'Haruki Murakami', 'Nhật Bản'),
(3, 'J.K. Rowling', 'Anh');

INSERT INTO sach(MaSach, TenSach, NamXuatBan, MaTacGia) VALUES
(1, 'Mắt Biếc', 1990, 1),
(2, 'Tôi thấy hoa vàng trên cỏ xanh', 2005, 1),
(3, 'Rừng Na Uy', 1987, 2),
(4, 'Harry Potter và Hòn đá Phù thủy', 1997, 3);

-- BaiTap3
-- Lấy danh sách tất cả sách trong hệ thống.
SELECT * FROM sach;
-- Lấy danh sách tất cả tác giả có quốc tịch là "Việt Nam".
SELECT * FROM tacgia WHERE QuocTich = "Việt Nam";
-- Lấy tên sách và tên tác giả tương ứng (JOIN 2 bảng).
SELECT s.TenSach, tg.TenTacGia 
FROM sach s JOIN tacgia tg ON s.MaTacGia = tg.MaTacGia; 
-- Lấy danh sách các sách xuất bản sau năm 1990.
SELECT * FROM sach 
WHERE NamXuatBan > 1990;
-- Đếm số lượng sách của mỗi tác giả.
SELECT tg.TenTacGia, COUNT(*) SoLuongSach 
from sach s JOIN tacgia tg ON s.MaTacGia = tg.MaTacGia
GROUP BY tg.TenTacGia;
-- Tìm tác giả có nhiều sách nhất.
SELECT tg.TenTacGia, COUNT(*) SoLuongSach 
from sach s JOIN tacgia tg ON s.MaTacGia = tg.MaTacGia
GROUP BY tg.TenTacGia
ORDER BY SoLuongSach DESC
LIMIT 1;