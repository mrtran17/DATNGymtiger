
CREATE TABLE [Anh] (
	[idAnh] INT NOT NULL IDENTITY UNIQUE,
	[MoTa] NVARCHAR(255),
	PRIMARY KEY([idAnh])
);
GO

CREATE TABLE [MauSac] (
	[idMauSac] INT NOT NULL IDENTITY UNIQUE,
	[TenMauSac] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idMauSac])
);
GO

CREATE TABLE [Size] (
	[idSize] INT NOT NULL IDENTITY UNIQUE,
	[TenSize] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idSize])
);
GO

CREATE TABLE [ChiTietSanPham] (
	[idCTSP] INT NOT NULL IDENTITY UNIQUE,
	[idSP] INT NOT NULL,
	[NgayCapNhat] DATETIME,
	[DetailSanPham] NVARCHAR(255),
	[DonGia] FLOAT,
	[SoLuongSanPham] INT,
	[idAnh] INT NOT NULL,
	[idChatLieu] INT NOT NULL,
	[idMauSac] INT NOT NULL,
	[idSize] INT NOT NULL,
	PRIMARY KEY([idCTSP])
);
GO

CREATE TABLE [SanPham] (
	[idSanPham] INT NOT NULL IDENTITY UNIQUE,
	[MaSP] NVARCHAR(255),
	[TenSP] NVARCHAR(255),
	[NgayThem] DATETIME,
	[NgayUpDate] DATETIME,
	[MoTa] NVARCHAR(255),
	[DonGia] FLOAT,
	[TrangThai] INT,
	[idLoaiSp] INT,
	[idThuongHieu] INT,
	PRIMARY KEY([idSanPham])
);
GO

CREATE TABLE [ChiTietGioHang] (
	[idChiTietGioHang] INT NOT NULL IDENTITY UNIQUE,
	[idGioHang] INT,
	[idCTSP] INT,
	[SoLuong] INT,
	[DonGia] FLOAT,
	[NgayTao] DATETIME,
	[NgayCapNhat] DATETIME,
	[GhiChu] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idChiTietGioHang])
);
GO

CREATE TABLE [GioHang] (
	[idGioHang] INT NOT NULL IDENTITY UNIQUE,
	[idAccount] INT,
	[idKH] INT,
	[NgayTao] DATETIME,
	[NgayCapNhat] DATETIME,
	[GhiChu] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idGioHang])
);
GO

CREATE TABLE [LoaiSP] (
	[idLoaiSP] INT NOT NULL IDENTITY UNIQUE,
	[TenLoai] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idLoaiSP])
);
GO

CREATE TABLE [ThuongHieu] (
	[idThuongHieu] INT NOT NULL IDENTITY UNIQUE,
	[DetailThuongHieu] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idThuongHieu])
);
GO

CREATE TABLE [ChiTietHoaDon] (
	[idChiTietHoaDon] INT NOT NULL IDENTITY UNIQUE,
	[SoLuong] INT,
	[TongTien] FLOAT,
	[idCTSP] INT,
	[idHoaDon] INT,
	PRIMARY KEY([idChiTietHoaDon])
);
GO

CREATE TABLE [Comment] (
	[idComment] INT NOT NULL IDENTITY UNIQUE,
	[idCTSP] INT,
	[idKH] INT,
	PRIMARY KEY([idComment])
);
GO

CREATE TABLE [KhachHang] (
	[idKhachHang] INT NOT NULL IDENTITY UNIQUE,
	[MaKH] NVARCHAR(255),
	[HoTen] NVARCHAR(255),
	[GioiTinh] INT,
	[NgaySinh] DATE,
	[UserName] NVARCHAR(255),
	[Password] INT,
	[SDT] INT,
	[Email] NVARCHAR(255),
	[Image] NVARCHAR(255),
	[Mota] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idKhachHang])
);
GO

CREATE TABLE [Voucher] (
	[idVoucher] INT NOT NULL IDENTITY UNIQUE,
	[MaVoucher] NVARCHAR(255),
	[TenVoucher] NVARCHAR(255),
	[NgayTao] DATETIME,
	[NgayBatDau] DATETIME,
	[NgayCapNhat] DATETIME,
	[NgayKetThuc] DATETIME,
	[SoLanDung] INT,
	[GiaTriGiam] FLOAT,
	[MoTa] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idVoucher])
);
GO

CREATE TABLE [HoaDon] (
	[idHoaDon] INT NOT NULL IDENTITY UNIQUE,
	[TongHoaDon] FLOAT,
	[NgayTao] DATETIME,
	[NgayDong] DATETIME,
	[DiaChi] NVARCHAR(255),
	[TrangThai] INT,
	[GiaSale] FLOAT,
	[PhuongThucThanhToan] INT,
	[idAccount] INT,
	[idVoucher] INT,
	PRIMARY KEY([idHoaDon])
);
GO

CREATE TABLE [Account] (
	[idAccount] INT NOT NULL IDENTITY UNIQUE,
	[idChucVu] INT,
	[MaAccount] NVARCHAR(255),
	[HoTen] NVARCHAR(255),
	[GioiTinh] INT,
	[NgaySinh] DATE,
	[UserName] NVARCHAR(255),
	[PassWord] NVARCHAR(255),
	[SDT] INT,
	[Email] NVARCHAR(255),
	[Image] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idAccount])
);
GO

CREATE TABLE [ChucVu] (
	[idChucVu] INT NOT NULL IDENTITY UNIQUE,
	[TenChucVu] NVARCHAR(255),
	[LoaiChucVu] INT,
	[TrangThai] INT,
	PRIMARY KEY([idChucVu])
);
GO

CREATE TABLE [ChatLieu] (
	[idChatLieu] INT NOT NULL IDENTITY UNIQUE,
	[ChatLieu] NVARCHAR(255),
	[TrangThai] INT,
	PRIMARY KEY([idChatLieu])
);
GO

ALTER TABLE [ChiTietSanPham]
ADD FOREIGN KEY([idAnh]) REFERENCES [Anh]([idAnh])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietSanPham]
ADD FOREIGN KEY([idSize]) REFERENCES [Size]([idSize])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietSanPham]
ADD FOREIGN KEY([idMauSac]) REFERENCES [MauSac]([idMauSac])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietSanPham]
ADD FOREIGN KEY([idChatLieu]) REFERENCES [ChatLieu]([idChatLieu])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietSanPham]
ADD FOREIGN KEY([idSP]) REFERENCES [SanPham]([idSanPham])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietGioHang]
ADD FOREIGN KEY([idGioHang]) REFERENCES [GioHang]([idGioHang])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietGioHang]
ADD FOREIGN KEY([idCTSP]) REFERENCES [ChiTietSanPham]([idCTSP])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [SanPham]
ADD FOREIGN KEY([idLoaiSp]) REFERENCES [LoaiSP]([idLoaiSP])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [SanPham]
ADD FOREIGN KEY([idThuongHieu]) REFERENCES [ThuongHieu]([idThuongHieu])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietHoaDon]
ADD FOREIGN KEY([idCTSP]) REFERENCES [ChiTietSanPham]([idCTSP])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [ChiTietHoaDon]
ADD FOREIGN KEY([idHoaDon]) REFERENCES [HoaDon]([idHoaDon])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Comment]
ADD FOREIGN KEY([idCTSP]) REFERENCES [ChiTietSanPham]([idCTSP])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Comment]
ADD FOREIGN KEY([idKH]) REFERENCES [KhachHang]([idKhachHang])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [HoaDon]
ADD FOREIGN KEY([idVoucher]) REFERENCES [Voucher]([idVoucher])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [HoaDon]
ADD FOREIGN KEY([idAccount]) REFERENCES [Account]([idAccount])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Account]
ADD FOREIGN KEY([idChucVu]) REFERENCES [ChucVu]([idChucVu])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO