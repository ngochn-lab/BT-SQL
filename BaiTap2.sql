CREATE DATABASE cybersoft_shop;
USE cybersoft_shop;

CREATE TABLE sanpham(
	MaSP INT PRIMARY KEY,
	TenSP VARCHAR(100),
	MoTa TEXT,
	Gia DOUBLE,
	MaLoaiSP INT,
	FOREIGN KEY (MaLoaiSP) REFERENCES loaisanpham(MaLoaiSP)
);

CREATE TABLE loaisanpham(
	MaLoaiSP INT PRIMARY KEY,
	TenLoaiSP VARCHAR(100)
);

CREATE TABLE hoadon(
	MaHD INT PRIMARY KEY,
	NgayMua DATE,
	MaSP INT,
	MaKH INT,
	FOREIGN KEY (MaKH) REFERENCES khachhang(MaKH)
);

CREATE TABLE khachhang (
	MaKH    INT PRIMARY KEY,
	Ho      VARCHAR(50)   NOT NULL,
	Ten     VARCHAR(50)   NOT NULL,
	Email   VARCHAR(100),
	SoDT    VARCHAR(20),
	DiaChi  VARCHAR(255)
);

-- Bang quan he n-n giua san pham va hoa don
CREATE TABLE chitiet_hoadon(
	MaHD INT,
	MaSP INT,
	SoLuong INT,
	GiaBan DOUBLE,
	PRIMARY KEY (MaHD, MaSP),
	FOREIGN KEY (MaHD) REFERENCES hoadon(MaHD),
	FOREIGN KEY (MaSP) REFERENCES sanpham(MaSP)
);