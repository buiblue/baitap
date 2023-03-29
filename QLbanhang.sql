use QLBANHANG

create table SanPham(
	masp nchar(10),
	mahangsx nchar(10),
	tensp nvarchar(20),
	soluong int,
	mausac nvarchar(20),
	giaban money,
	donvitinh nchar(10),
	mota nvarchar,
	constraint pk_SanPham primary key(masp)
)
create table Hangsx(
	 Mahangsx nchar(10),
	 Tenhang nvarchar(20),
	 Diachi nvarchar(30),
	 Sodt nvarchar(20),
	 email nvarchar (30),
	 constraint pk_Hangsx primary key(Mahangsx)
)
create table Nhanvien(
	Manv nchar(10),
	Tennv nvarchar(20),
	Gioitinh nchar(10),
	Diachi nvarchar(30),
	Sodt nvarchar(20),
	email nvarchar(30),
	Phong nvarchar(30),
	constraint pk_Nhanvien primary key(Manv)
)
create table Nhap(
	Sohdn nchar(10),
	Masp nchar(10),
	Manv nchar(10),
	Ngaynhap date,
	soluongN int,
	dongiaN money,
	constraint pk_Nhap primary key (Sohdn,Masp)
)
create table Xuat(
	Sohdx nchar (10),
	Masp nchar(10),
	Manv nchar (10),
	Ngayxuat date,
	soluongX int,
	constraint pk_Xuat primary key (Sohdx)
)
ALTER TABLE Sanpham ADD CONSTRAINT fk01_SP FOREIGN KEY(mahangsx) REFERENCES Hangsx(Mahangsx)
AlTER TABLE Nhap ADD CONSTRAINT fk01_N FOREIGN KEY (Masp) REFERENCES SanPham(masp)
ALTER TABLE Nhap ADD CONSTRAINT fk02_N FOREIGN KEY (Manv) REFERENCES Nhanvien(manv)
ALTER TABLE Xuat ADD CONSTRAINT fk01_X FOREIGN KEY (Masp) REFERENCES SanPham(masp)
ALTER TABLE Xuat ADD CONSTRAINT fk02_X FOREIGN KEY (Manv) REFERENCES Nhanvien(manv)
set dateformat dmy
-- hangsx
insert into Hangsx values('H01','Samsung','Korea','011-08271717','ss@gmail.comkr')
insert into Hangsx values('H02','OPPO', 'china', '081-8626262','oppo@gmail.com.cn')
insert into Hangsx values('H03', ' Vinfone','Việt Nam','084-0982262626','vf@gmail.com.vn')
--nhanvien
insert into Nhanvien values('NV01','Nguyễn Thị Thu', 'Nữ','Hà Nội ', '0982626521','thu@gmail.com','kế toán')
insert into Nhanvien values('NV02','Lê văn Nam','Nam',' Bắc Ninh','0972525252','nam@gmail.com','vật tư')
insert into Nhanvien values('NV03','Trần Hòa Bình', ' Nữ','Hà Nội','0328388388','hb@gmail.com','Kế toán')
--San pham
insert into SanPham values('SP01','H02','F1 Plus',100,'Xám',7000000,'Chiếc','hàng cận cao cấp')
insert into SanPham values('SP02','H01','galaxy note 11',50,'đỏ',19000000,'chiếc','hàng cao cấp')
insert into SanPham values ('SP03','H02','F3 lite',200,'nâu',3000000,'chiếc','hàng phổ thông')
insert into SanPham values('SP04','H03','Vjoy3', 200,'Xám',1500000,'chiếc','hàng phổ thông')
insert into SanPham values('SP05','H01','galaxy',500,'nâu',8000000,'chiếc','hàng cận cao cấp')
--nhap
insert into Nhap values('N01','SP02','NV01','02-05-2019',10,17000000)
insert into Nhap values('N02','SP01','NV02','04-07-2020',30,6000000)
insert into Nhap values('N03','SP04','NV02','05-17-2020',20,1200000)
insert into Nhap values('N04','SP01','NV03','03-22-2020',10,6000000)
insert into Nhap values ('N05','SP05','NV01','07-07-2020',20,7000000)
--xuat
insert into Xuat values ('X01','SP03','NV02','06-14-2020',5)
insert into Xuat values('X02','SP01','NV03','03-05-2019',3)
insert into Xuat values('X03','SP02','NV01','12-12-2020',1)
insert into Xuat values('X04','SP03','NV02','06-02-2020',2)
insert into Xuat values('X05','SP05','NV01','05-18-2020',1)


--1. 
select * 
from Hangsx
select * 
from Nhanvien
select * 
from Nhap
select * 
from SanPham
select * 
from Xuat
--2.

GO
SELECT SanPham.masp, SanPham.tensp, Hangsx.tenhang, SanPham.soluong, SanPham.mausac, SanPham.giaban, SanPham.donvitinh, SanPham.mota
FROM SanPham
INNER JOIN Hangsx ON SanPham.mahangsx = Hangsx.mahangsx
ORDER BY SanPham.giaban DESC;
GO
--3.
GO
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
GO
--4
GO
SELECT * FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
--5
SELECT Nhap.sohdn, SanPham.masp, SanPham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, Nhap.soluongN*Nhap.dongiaN AS tiennhap, SanPham.mausac, SanPham.donvitinh, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Nhap.sohdn ASC;
--6
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
ORDER BY Xuat.soluongX DESC;
-- 9.Đưa ra thông tin 10 sản phẩm có giả bản cao nhất trong cửa hàng, theo chiều giảm dần giá bán.
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
-- 10.Đưa ra các thông tin sản phẩm có gia bản từ 100.000 đến 500.000 của hãng Samsung.
SELECT *
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
-- 11.Tính tổng tiền đã nhập trong năm 2018 của hãng samsung. 
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
-- 12.Thống kê tổng tiền đã xuất trong ngày 2/9/2018.
	SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
-- 13.Đưa ra sohdn, ngaynhap có tiền nhập phải trả cao nhất trong năm 2018.
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC
-- 14.Đưa ra 10 mặt hàng có soluongN nhiều nhất trong năm 2019.
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
-- 15.Đưa ra masp,tensp của các sản phẩm do công ty 'Samsung' sản xuất do nhân viên có mã 'NV01' nhập.
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
-- 16.Đưa ra sohda, masp, soluongN, ngayN của mặt hàng có masp là 'SPO2', được nhân viên 'NVG2' xuất.
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'
-- 17.Đưa ra manv, tennv, đã xuất mặt hàng có mã 'SPO2' ngày '03-02-2020'.
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
-- 7.  --
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
--8. --
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
ORDER BY Xuat.soluongX DESC;
--9. --
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
--10. --
SELECT *
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
--11 --
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
--12 --
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
--13 --
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC
--14 --
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
--15 --
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
--16 --
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'
--17 --
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02'

