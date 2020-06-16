--CREATE DATABASE CakeBakery
--use CakeBakery
--drop database CakeBakery
CREATE DATABASE CakeBakery3
USE CakeBakery3
GO
CREATE TABLE NGUOIDUNG
(
	UserAdmin varchar(30),
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
	CONSTRAINT PK_Nguoidung PRIMARY KEY(UserAdmin)
)
--drop table KHACHHANG
--drop table SANPHAM
GO
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME,
	CONSTRAINT PK_Khanghang PRIMARY KEY(MaKH)
)


GO
CREATE TABLE DANHMUC
(
	MaDM int Identity(1,1),
	TenDM nvarchar(50) NOT NULL,
	CONSTRAINT PK_Danhmuc PRIMARY KEY(MaDM)
)
GO


CREATE TABLE SANPHAM
(
	MaSP   INT IDENTITY(1,1),
	TEN_SP  Nvarchar(30),
	MaDM INT,
	SOLUONG_SP INT,
	ANHBIA Varchar(50),
	Mota NVarchar(Max),
	GIA_SP Decimal(18,0) CHECK (GIA_SP>=0),
	
	CONSTRAINT PK_Sanpham PRIMARY KEY(MaSP),
	CONSTRAINT FK_Danhmucsanpham FOREIGN KEY(MaDM) REFERENCES DANHMUC(MaDM),
)
GO
CREATE TABLE DONHANG
(
	MaDH	INT IDENTITY(1,1),
	MaKH INT,
	Ngaydat Datetime,

	CONSTRAINT FK_Khachhang FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH),
	CONSTRAINT PK_Donhang PRIMARY KEY(MaDH),
)
Go
CREATE TABLE CTDatHang1
(
	MaDH INT,
	MaSP INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDH,MaSP),
	CONSTRAINT FK_Donhang FOREIGN KEY (MaDH) REFERENCES DONHANG(MaDH),
	CONSTRAINT FK_Sanpham FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP)	
)
----------------------------------------Nhập dữ liệu---------------------
INSERT INTO NGUOIDUNG(UserAdmin,PassAdmin,Hoten) VALUES ('bichtram2352','bichtram2352',N'Trâm Nguyễn')
-----------------------------------

INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Gato')
INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Tiramisu')
INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Mousse')
INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Cheese')
INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Kem Lạnh')
INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Kem Fondant')
INSERT INTO DANHMUC(TenDM) VALUES (N'Bánh Sự Kiện')
INSERT INTO DANHMUC(TenDM) VALUES (N'Khác')
-----------------------------------

-----------------------------------
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Bánh màu xanh','1','sp1.jpg',N'Chiếc bánh màu xanh đầy hy vọng','200000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Gấu trúc','1','gt1.jpg',N'Vườn thú','250000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Trái cây','1','gt2.jpg',N'Theo kiểu trái cây','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Dâu tây','1','gt3.jpg',N'Dễ thương,trái dâu','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Đồng quê','1','gt4.jpg',N'Chiec banh mang hoa tiet nhe nhang','300000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Nhẹ nhàng','1','gt5.jpg',N'Chiec banh mang hoa tiet nhe nhang','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Bướm','1','gt6.jpg',N'Chiec banh mang hoa tiet nhe nhang','550000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Mạ vàng','1','gt7.jpg',N'Chiec banh mang hoa tiet nhe nhang','700000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Thiên nga','1','gt8.jpg',N'Chiec banh mang hoa tiet nhe nhang','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (1,N'Tuổi khỉ','1','gt9.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Tuổi mới','1','t1.jpg',N'Chiec banh mang hoa tiet day dang yeu','300000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Tình yêu','1','t2.jpg',N'Chiec banh mang hoa tiet day dang yeu','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Khoảnh lặng','1','t3.jpg',N'Chiec banh mang hoa tiet day dang yeu','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Mattcha','1','t4.jpg',N'Chiec banh mang hoa tiet day dang yeu','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Sức sống','1','t5.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Gấu','1','t6.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Vui vẻ','1','t7.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Đơn giản','1','t8.jpg','.........','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (2,N'Tim','1','t9.jpg','.........','300000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Tĩnh lặng','1','m1.jpg',N'Chiec banh mang hoa tiet tran day yeu thuong','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Trống','1','m2.jpg',N'Chiec banh mang hoa tiet tran day yeu thuong','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Vui tươi','1','m3.jpg',N'Chiec banh mang hoa tiet tran day yeu thuong','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Nhỏ xinh','1','m4.jpg',N'Chiec banh mang hoa tiet tran day yeu thuong','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Dịu dàng','1','m5.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Phấn khởi','1','m6.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Màu sắc','1','m7.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Khoe sắc','1','m8.jpg','.........','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (3,N'Nô đùa','1','m9.jpeg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Hoa','1','c1.jpg',N'Chiec banh mang hoa tiet mau sac ruc ro','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'mùa hạ','1','c2.jpg',N'Chiec banh mang hoa tiet mau sac ruc ro','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Hoa anh đào','1','c3.jpg',N'Chiec banh mang hoa tiet mau sac ruc ro','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Hạnh phúc','1','c4.jpg',N'Chiec banh mang hoa tiet mau sac ruc ro','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Xanh tươi','1','c5.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Đong đầy','1','c6.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Rực rỡ','1','c7.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Ấm no','1','c8.jpg','.........','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (4,N'Sum vầy','1','c9.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Trẻ thơ','1','kl1.png',N'Chiec banh mang hoa tiet mau sac vui tuoi','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Dâu','1','kl2.png',N'Chiec banh mang hoa tiet mau sac vui tuoi','570000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Yêu thương','1','kl3.jpg',N'Chiec banh mang hoa tiet mau sac vui tuoi','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Sao nhỏ','1','kl4.jpg',N'Chiec banh mang hoa tiet mau sac vui tuoi','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Orio','1','kl5.png',N'Chiec banh mang hoa tiet mau sac vui tuoi','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Nơ dâu','1','kl6.jpg','.........','550000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Thơ ấu','1','kl7.png','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Đáng yêu','1','kl8.jpg','.........','470000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (5,N'Người tuyết','1','kl9.jpg','.........','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Khỉ vàng','1','fd1.jpg',N'Chiec banh mang hoa tiet mau sac vui tuoi','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Gà vàng','1','fd2.jpg',N'Chiec banh mang hoa tiet mau sac vui tuoi','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Gia đình','1','fd3.jpg',N'Chiec banh mang hoa tiet mau sac vui tuoi','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Biển xanh','1','fd4.jpg',N'Chiec banh mang hoa tiet mau sac vui tuoi','550000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Lâu đài','1','fd5.jpg','.........','600000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Cầu vòng','1','fd6.jpg','.........','550000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Lâu đài mây','1','fd7.jpg','.........','700000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Đảo hải tặc','1','fd8.jpg','.........','550000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (6,N'Nhà vườn','1','fd9.jpg','.........','600000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Nhớ ơn','1','sk1.jpg',N'Chiec banh mang hoa tiet mau sac ky niem','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Biết ơn','1','sk2.jpg',N'Chiec banh mang hoa tiet mau sac ky niem','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Kỉ niệm','1','sk3.jpg',N'Chiec banh mang hoa tiet mau sac ky niem','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Tim yêu thương','1','sk4.jpg',N'Chiec banh mang hoa tiet mau sac ky niem','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Tim đỏ','1','sk5.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Tim tưởng nhớ','1','sk6.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Mừng 8.3','1','sk7.jpg','.........','470000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Hallowen','1','sk8.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (7,N'Đêm tuyết','1','sk9.jpg','.........','500000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Tim su kem','1','k1.png',N'Chiec banh mang hoa tiet mau sac doc dao','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Bắp hạnh nhân','1','k2.jpg',N'Chiec banh mang hoa tiet mau sac doc dao','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Su tròn','1','k3.jpg',N'Chiec banh mang hoa tiet mau sac doc dao','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Bắp vàng','1','k4.jpg',N'Chiec banh mang hoa tiet mau sac doc dao','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Bốn mùa','1','k5.png',N'Chiec banh mang hoa tiet mau sac doc dao','300000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Trứng muối hoa','1','k6.jpg','.........','400000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Trứng muối vẽ','1','k7.jpg','.........','350000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Tháp su','1','k8.jpg','.........','450000')
INSERT INTO SANPHAM(MaDM,TEN_SP,SOLUONG_SP,ANHBIA,Mota,GIA_SP) VALUES (8,N'Rau câu','1','k9.jpg','.........','350000')
-----------------------------------
INSERT INTO KHACHHANG(HoTen,Taikhoan,Matkhau,DiachiKH,DienthoaiKH,Email,Ngaysinh) VALUES (N'Nguyễn Bích Trâm','tram2352','tram2352',N'456 QUang Trung,Quận Gò vấp','0357155645','bichtram2352@gmail.com','2/3/1997')
INSERT INTO KHACHHANG(HoTen,Taikhoan,Matkhau,DiachiKH,DienthoaiKH,Email,Ngaysinh) VALUES (N'Nguyễn Thị Trân','tran123','tran123',N'1029 Nguyễn Xí,Quận Bình Thạnh','0342899012','tran123@gmail.com','3/7/1998')
INSERT INTO KHACHHANG(HoTen,Taikhoan,Matkhau,DiachiKH,DienthoaiKH,Email,Ngaysinh) VALUES (N'Trần Nguyễn Hà','ha123','ha123',N'45 Điện Biên Phủ,Quận Bình Thạnh','0918273012','ha123@gmail.com','19/4/2000')
INSERT INTO KHACHHANG(HoTen,Taikhoan,Matkhau,DiachiKH,DienthoaiKH,Email,Ngaysinh) VALUES (N'Mai Thị Hoa','hoa123','hoa123',N'123/23 Trần Duy Tùng,Quận 3','0367890234','hoa123@gmail.com','1/1/1999')
INSERT INTO KHACHHANG(HoTen,Taikhoan,Matkhau,DiachiKH,DienthoaiKH,Email,Ngaysinh) VALUES (N'Vũ Văn Hào','hao123','hao123',N'123 Nguyễn Du,Quận 1','0989403213','hao123@gmail.com','20/5/1998')
-----------------------------------
INSERT INTO DONHANG(MaKH,Ngaydat) VALUES (1,'2/3/2018')
INSERT INTO DONHANG(MaKH,Ngaydat) VALUES (2,'6/7/2018')
INSERT INTO DONHANG(MaKH,Ngaydat) VALUES (3,'4/8/2017')
INSERT INTO DONHANG(MaKH,Ngaydat) VALUES (4,'5/8/2017')
INSERT INTO DONHANG(MaKH,Ngaydat) VALUES (5,'6/8/2017')
-----------------------------------
INSERT INTO CTDatHang1(MaDH,MaSP,Soluong,Dongia) VALUES (1,1,'1','200000')
INSERT INTO CTDatHang1(MaDH,MaSP,Soluong,Dongia) VALUES (2,11,'2','600000')
INSERT INTO CTDatHang1(MaDH,MaSP,Soluong,Dongia) VALUES (4,2,'1','400000')




