CREATE DATABASE LTTQ
USE LTTQ
CREATE TABLE CTHDVatDung (
  MaHoaDon VARCHAR(20),
  MaVatDung VARCHAR(20),
  SoLuong INT,
  ThanhTien DECIMAL(10,2),
  PRIMARY KEY (MaHoaDon, MaVatDung)
)
GO

CREATE TABLE VatDung (
  MaVatDung VARCHAR(20) PRIMARY KEY,
  TenVatDung VARCHAR(100),
  MoTa TEXT,
  SoLuong INT,
  Gia DECIMAL(10,2),
  MaQuanLy VARCHAR(20)
)
GO

CREATE TABLE HoaDon (
  MaHoaDon VARCHAR(20) PRIMARY KEY,
  TenHoaDon VARCHAR(50),
  MaBenhNhan VARCHAR(20),
  MaNhanVien VARCHAR(20),
  NgayLapHoaDon DATE,
  GiaTien DECIMAL(10,2),
  TrangThai VARCHAR(50)
)
GO

CREATE TABLE Thuoc (
  MaThuoc VARCHAR(20) PRIMARY KEY,
  TenThuoc VARCHAR(100),
  CongDung TEXT,
  SoLuong INT,
  GiaTien DECIMAL(10,2),
  HanSuDung DATE
)
GO

CREATE TABLE CongViec (
  MaCongViec VARCHAR(20) PRIMARY KEY,
  TenCongViec VARCHAR(100),
  MoTaCongViec TEXT,
  TrangThai VARCHAR(50),
  GhiChu TEXT
)
GO

CREATE TABLE LichTruc (
  MaLichTruc VARCHAR(20) PRIMARY KEY,
  MaBacSi VARCHAR(20),
  NgayTruc DATE,
  PhanCong VARCHAR(20)
)
GO

CREATE TABLE Khoa (
  MaKhoa VARCHAR(20) PRIMARY KEY,
  TenKhoa VARCHAR(100),
  TruongKhoa VARCHAR(20)
)
GO

CREATE TABLE ChuyenNganh (
  MaChuyenNganh VARCHAR(20) PRIMARY KEY,
  TenChuyenNganh VARCHAR(100),
  Khoa VARCHAR(20)
)
GO

CREATE TABLE Role (
  RoleID VARCHAR(20) PRIMARY KEY,
  TenRole VARCHAR(50)
)
GO

CREATE TABLE PhieuKhamBenh (
  MaPhieuKham VARCHAR(20) PRIMARY KEY,
  MaBenhNhan VARCHAR(20),
  NgayKham DATE,
  LyDoKhamBenh TEXT,
  KhamLamSang TEXT,
  ChanDoan TEXT,
  KetQuaKham TEXT,
  DieuTri TEXT,
  MaBacSi VARCHAR(20)
)
GO

CREATE TABLE LichHenKham (
  MaLichHen VARCHAR(20) PRIMARY KEY,
  MaBenhNhan VARCHAR(20),
  NgayHenKham DATE,
  MaBacSi VARCHAR(20)
)
GO

CREATE TABLE BenhNhan (
  MaBenhNhan VARCHAR(20) PRIMARY KEY,
  Ho VARCHAR(50),
  Ten VARCHAR(50),
  NgaySinh DATE,
  GioiTinh VARCHAR(10),
  CCCD VARCHAR(20),
  NgheNghiep VARCHAR(100),
  DiaChi TEXT,
  SDT VARCHAR(20),
  Email VARCHAR(100),
  MaKhoa VARCHAR(20)
)
GO

CREATE TABLE BenhAn (
  MaBenhAn VARCHAR(20) PRIMARY KEY,
  MaBenhNhan VARCHAR(20),
  NgayTaoLap DATE,
  Benh VARCHAR(20),
  TinhTrang TEXT,
  DieuTri TEXT
)
GO

CREATE TABLE Benh (
  MaBenh VARCHAR(20) PRIMARY KEY,
  TenBenh VARCHAR(100),
  MoTa TEXT,
  TrieuChung TEXT
)
GO

CREATE TABLE CTDonThuoc (
  MaDonThuoc VARCHAR(20),
  MaThuoc VARCHAR(20),
  SoLuong INT,
  GiaTien DECIMAL(10,2),
  HuongDanSuDung TEXT,
  MaHoaDon VARCHAR(20),
  PRIMARY KEY (MaDonThuoc, MaThuoc)
)
GO

CREATE TABLE DonThuoc (
  MaDonThuoc VARCHAR(20) PRIMARY KEY,
  MaBenhNhan VARCHAR(20),
  MaBacSi VARCHAR(20),
  NgayLapDon DATE
)
GO

CREATE TABLE NhanVien (
  MaNhanVien VARCHAR(20) PRIMARY KEY,
  Ho VARCHAR(50),
  Ten VARCHAR(50),
  MaChuyenNganh VARCHAR(20),
  RoleID VARCHAR(20),
  LoaiNhanVien VARCHAR(20),
  NgaySinh DATE,
  GioiTinh VARCHAR(10),
  CCCD VARCHAR(20),
  DiaChi TEXT,
  SDT VARCHAR(20),
  Email VARCHAR(100),
  MatKhau VARCHAR(100)
)
GO

ALTER TABLE BenhNhan ADD FOREIGN KEY (MaKhoa) REFERENCES Khoa (MaKhoa)
GO

ALTER TABLE CTDonThuoc ADD FOREIGN KEY (MaHoaDon) REFERENCES HoaDon (MaHoaDon)
GO

ALTER TABLE VatDung ADD FOREIGN KEY (MaQuanLy) REFERENCES NhanVien (MaNhanVien)
GO

ALTER TABLE Khoa ADD FOREIGN KEY (TruongKhoa) REFERENCES NhanVien (MaNhanVien)
GO

ALTER TABLE CTHDVatDung ADD FOREIGN KEY (MaVatDung) REFERENCES VatDung (MaVatDung)
GO

ALTER TABLE CTHDVatDung ADD FOREIGN KEY (MaHoaDon) REFERENCES HoaDon (MaHoaDon)
GO

ALTER TABLE HoaDon ADD FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan (MaBenhNhan)
GO

ALTER TABLE HoaDon ADD FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien)
GO

ALTER TABLE LichTruc ADD FOREIGN KEY (MaBacSi) REFERENCES NhanVien (MaNhanVien)
GO

ALTER TABLE LichTruc ADD FOREIGN KEY (PhanCong) REFERENCES CongViec (MaCongViec)
GO

ALTER TABLE ChuyenNganh ADD FOREIGN KEY (Khoa) REFERENCES Khoa (MaKhoa)
GO

ALTER TABLE NhanVien ADD FOREIGN KEY (MaChuyenNganh) REFERENCES ChuyenNganh (MaChuyenNganh)
GO

ALTER TABLE NhanVien ADD FOREIGN KEY (RoleID) REFERENCES Role (RoleID)
GO

ALTER TABLE PhieuKhamBenh ADD FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan (MaBenhNhan)
GO

ALTER TABLE PhieuKhamBenh ADD FOREIGN KEY (MaBacSi) REFERENCES NhanVien (MaNhanVien)
GO

ALTER TABLE LichHenKham ADD FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan (MaBenhNhan)
GO

ALTER TABLE LichHenKham ADD FOREIGN KEY (MaBacSi) REFERENCES NhanVien (MaNhanVien)
GO

ALTER TABLE BenhAn ADD FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan (MaBenhNhan)
GO

ALTER TABLE BenhAn ADD FOREIGN KEY (Benh) REFERENCES Benh (MaBenh)
GO

ALTER TABLE CTDonThuoc ADD FOREIGN KEY (MaDonThuoc) REFERENCES DonThuoc (MaDonThuoc)
GO

ALTER TABLE CTDonThuoc ADD FOREIGN KEY (MaThuoc) REFERENCES Thuoc (MaThuoc)
GO

ALTER TABLE DonThuoc ADD FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan (MaBenhNhan)
GO

ALTER TABLE DonThuoc ADD FOREIGN KEY (MaBacSi) REFERENCES NhanVien (MaNhanVien)
GO
