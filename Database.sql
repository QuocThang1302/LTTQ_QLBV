CREATE DATABASE BV
USE BV

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
  GhiChu TEXT
)
GO

CREATE TABLE LichTruc (
  MaLichTruc VARCHAR(20) PRIMARY KEY,
  MaBacSi VARCHAR(20),
  NgayTruc DATE,
  PhanCong VARCHAR(20),
  TrangThai VARCHAR(50)
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
  GiaTien decimal(10,2),
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

--Ràng buộc
CREATE TRIGGER trg_LichHenKham_MaBacSi
ON LichHenKham
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN NhanVien nv ON i.MaBacSi = nv.MaNhanVien
        WHERE nv.LoaiNhanVien != 'Bác sĩ'
    )
    BEGIN
        RAISERROR ('MaBacSi phải thuộc về nhân viên là Bác sĩ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE TRIGGER trg_PhieuKhamBenh_MaBacSi
ON PhieuKhamBenh
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN NhanVien nv ON i.MaBacSi = nv.MaNhanVien
        WHERE nv.LoaiNhanVien != 'Bác sĩ'
    )
    BEGIN
        RAISERROR ('MaBacSi phải thuộc về nhân viên là Bác sĩ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE TRIGGER trg_DonThuoc_MaBacSi
ON DonThuoc
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN NhanVien nv ON i.MaBacSi = nv.MaNhanVien
        WHERE nv.LoaiNhanVien != 'Bác sĩ'
    )
    BEGIN
        RAISERROR ('MaBacSi phải thuộc về nhân viên là Bác sĩ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE TRIGGER trg_VatDung_MaQuanLy
ON VatDung
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN NhanVien nv ON i.MaQuanLy = nv.MaNhanVien
        WHERE nv.LoaiNhanVien != 'Quản lý'
    )
    BEGIN
        RAISERROR ('MaQuanLy phải thuộc về nhân viên là Quản lý.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO




--Dữ liệu mẫu 
-- Role table 
INSERT INTO Role (RoleID, TenRole) VALUES  
('R01', 'Admin'), 
('R02', 'Doctor');
 
-- ChucNang table 
INSERT INTO CongViec (MaCongViec, TenCongViec, MoTaCongViec, GhiChu) VALUES  
('CN001', 'Trực ngày 18/8/2024', 'Trực khoa nội', 'Trực cả ngày'),
('CN002', 'Trực ngày 19/8/2024', 'Trực khoa ngoại', 'Trực ca sáng '),
('CN003',  'Trực ngày 19/8/2024', 'Trực khoa nhi', 'Trực ca chiều'),
('CN004', 'Trực ngày 20/8/2024', 'Trực khoa tim mạch', 'Trực cả ngày');

-- Vô hiệu hóa tất cả ràng buộc khóa ngoại
ALTER TABLE NhanVien NOCHECK CONSTRAINT ALL;
ALTER TABLE Khoa NOCHECK CONSTRAINT ALL;
ALTER TABLE ChuyenNganh NOCHECK CONSTRAINT ALL;
-- Khoa table
INSERT INTO Khoa (MaKhoa, TenKhoa, TruongKhoa) VALUES
('K01', 'Khoa Nội', 'NV003'),
('K02', 'Khoa Ngoại', 'NV002'),
('K03', 'Khoa Nhi', 'NV003'),
('K04', 'Khoa Tim Mạch', 'NV002');

-- ChuyenNganh table
INSERT INTO ChuyenNganh (MaChuyenNganh, TenChuyenNganh, Khoa) VALUES
('CN01', 'Tim Mạch', 'K04'),
('CN02', 'Nhi Khoa', 'K03'),
('CN03', 'Ngoại Thần Kinh', 'K02'),
('CN04', 'Nội Tiết', 'K01');

-- NhanVien table
INSERT INTO NhanVien (MaNhanVien, Ho, Ten, MaChuyenNganh, RoleID, LoaiNhanVien, NgaySinh, GioiTinh, CCCD, DiaChi, SDT, Email, MatKhau) VALUES
('NV001', 'Nguyen', 'Van A', 'CN01', 'R01', 'Quản lý', '1980-01-01', 'Nam', '123456789', 'Hà Nội', '0901234567', 'a@gmail.com', '123'),
('NV002', 'Tran', 'Thi B', 'CN02', 'R02', 'Bác sĩ', '1985-02-02', 'Nữ', '987654321', 'TP Hồ Chí Minh', '0912345678', 'b@gmail.com', '123'),
('NV003', 'Le', 'Van C', 'CN03', 'R02', 'Bác sĩ', '1990-03-03', 'Nam', '111111111', 'Đà Nẵng', '0923456789', 'c@gmail.com', '123'),
('NV004', 'Pham', 'Thi D', 'CN04', 'R01', 'Quản lý', '1988-04-04', 'Nữ', '222222222', 'Hải Phòng', '0934567890', 'd@gmail.com', '123');
-- Kích hoạt lại các ràng buộc khóa ngoại
ALTER TABLE NhanVien CHECK CONSTRAINT ALL;
ALTER TABLE Khoa CHECK CONSTRAINT ALL;
ALTER TABLE ChuyenNganh CHECK CONSTRAINT ALL;
--LichTruc table
INSERT INTO LichTruc (MaLichTruc, MaBacSi, NgayTruc, PhanCong, TrangThai) VALUES 
('LT001', 'NV002', '2024-08-18', 'CN001', 'Đã hoàn thành'),
('LT002', 'NV003', '2024-08-19', 'CN002', 'Đã hoàn thành'),
('LT003', 'NV002', '2024-08-19', 'CN003', 'Đang thực hiện'),
('LT004', 'NV003', '2024-08-20', 'CN004', 'Chưa thực hiện');
-- BenhNhan table
INSERT INTO BenhNhan (MaBenhNhan, Ho, Ten, NgaySinh, GioiTinh, CCCD, NgheNghiep, DiaChi, SDT, Email, MaKhoa) VALUES
('BN001', 'Le', 'Thi C', '1990-03-03', 'Nữ', '123123123', 'Nhân viên văn phòng', 'Đà Nẵng', '0923456789', 'c@gmail.com', 'K01'),
('BN002', 'Pham', 'Van D', '1995-04-04', 'Nam', '321321321', 'Sinh viên', 'Hải Phòng', '0934567890', 'd@gmail.com', 'K02'),
('BN003', 'Nguyen', 'Thi E', '1988-05-05', 'Nữ', '456456456', 'Giáo viên', 'Cần Thơ', '0945678901', 'e@gmail.com', 'K03'),
('BN004', 'Tran', 'Van F', '1992-06-06', 'Nam', '654654654', 'Kỹ sư', 'Quảng Ninh', '0956789012', 'f@gmail.com', 'K04');

-- VatDung table
INSERT INTO VatDung (MaVatDung, TenVatDung, MoTa, SoLuong, Gia, MaQuanLy) VALUES
('VD001', 'Băng gạc', 'Băng gạc y tế', 100, 5000.00, 'NV001'),
('VD002', 'Nhiệt kế', 'Nhiệt kế điện tử', 50, 150000.00, 'NV002'),
('VD003', 'Ống nghe', 'Ống nghe y tế', 20, 300000.00, 'NV003'),
('VD004', 'Máy đo huyết áp', 'Máy đo huyết áp tự động', 10, 1000000.00, 'NV004');

-- HoaDon table
INSERT INTO HoaDon (MaHoaDon, TenHoaDon, MaBenhNhan, MaNhanVien, NgayLapHoaDon, GiaTien, TrangThai) VALUES
('HD001', 'Thanh toán khám bệnh', 'BN001', 'NV001', '2024-01-01', 500000.00, 'Đã thanh toán'),
('HD002', 'Thanh toán xét nghiệm', 'BN002', 'NV002', '2024-01-02', 300000.00, 'Chưa thanh toán'),
('HD003', 'Thanh toán thuốc', 'BN003', 'NV003', '2024-01-03', 400000.00, 'Đã thanh toán'),
('HD004', 'Thanh toán dịch vụ', 'BN004', 'NV004', '2024-01-04', 600000.00, 'Chưa thanh toán');

-- Thuoc table
INSERT INTO Thuoc (MaThuoc, TenThuoc, CongDung, SoLuong, GiaTien, HanSuDung) VALUES
('T001', 'Paracetamol', 'Giảm đau, hạ sốt', 200, 2000.00, '2025-01-01'),
('T002', 'Vitamin C', 'Tăng sức đề kháng', 300, 1000.00, '2024-12-31'),
('T003', 'Amoxicillin', 'Kháng sinh', 150, 5000.00, '2025-06-30'),
('T004', 'Ibuprofen', 'Giảm đau, kháng viêm', 100, 3000.00, '2024-11-30');

-- DonThuoc table
INSERT INTO DonThuoc (MaDonThuoc, MaBenhNhan, MaBacSi, NgayLapDon) VALUES
('DT001', 'BN001', 'NV002', '2024-01-01'),
('DT002', 'BN002', 'NV003', '2024-01-02'),
('DT003', 'BN003', 'NV004', '2024-01-03'),
('DT004', 'BN004', 'NV001', '2024-01-04');

-- Benh table
INSERT INTO Benh (MaBenh, TenBenh, MoTa, TrieuChung) VALUES
('B001', 'Cảm cúm', 'Nhiễm virus', 'Sốt, ho, đau họng'),
('B002', 'Đau dạ dày', 'Viêm loét dạ dày', 'Đau bụng, buồn nôn'),
('B003', 'Tiểu đường', 'Rối loạn đường huyết', 'Khát nước, sụt cân'),
('B004', 'Cao huyết áp', 'Tăng áp lực máu', 'Chóng mặt, đau đầu');

-- BenhAn table
INSERT INTO BenhAn (MaBenhAn, MaBenhNhan, NgayTaoLap, Benh, TinhTrang, DieuTri) VALUES
('BA001', 'BN001', '2024-01-01', 'B001', 'Đã khỏi', 'Nghỉ ngơi, uống thuốc'),
('BA002', 'BN002', '2024-01-02', 'B002', 'Đang điều trị', 'Theo dõi, uống thuốc'),
('BA003', 'BN003', '2024-01-03', 'B003', 'Ổn định', 'Chế độ ăn kiêng'),
('BA004', 'BN004', '2024-01-04', 'B004', 'Đang điều trị', 'Sử dụng thuốc đều đặn');

-- PhieuKhamBenh table
INSERT INTO PhieuKhamBenh (MaPhieuKham, MaBenhNhan, NgayKham, LyDoKhamBenh, KhamLamSang, ChanDoan, KetQuaKham, DieuTri, MaBacSi) VALUES
('PK001', 'BN001', '2024-01-01', 'Sốt cao', 'Kiểm tra nhiệt độ', 'Cảm cúm', 'Ổn định', 'Uống thuốc theo chỉ dẫn', 'NV002'),
('PK002', 'BN002', '2024-01-02', 'Đau bụng', 'Nội soi', 'Đau dạ dày', 'Cần theo dõi', 'Điều chỉnh chế độ ăn', 'NV003'),
('PK003', 'BN003', '2024-01-03', 'Mệt mỏi', 'Xét nghiệm máu', 'Tiểu đường', 'Ổn định', 'Thay đổi lối sống', 'NV004'),
('PK004', 'BN004', '2024-01-04', 'Đau đầu', 'Đo huyết áp', 'Cao huyết áp', 'Đang điều trị', 'Dùng thuốc huyết áp', 'NV001');

-- CTHDVatDung table
INSERT INTO CTHDVatDung (MaHoaDon, MaVatDung, SoLuong, ThanhTien) VALUES
('HD001', 'VD001', 10, 50000.00),
('HD002', 'VD002', 5, 750000.00),
('HD003', 'VD003', 2, 600000.00),
('HD004', 'VD004', 1, 1000000.00);

-- CTDonThuoc table
INSERT INTO CTDonThuoc (MaDonThuoc, MaThuoc, SoLuong, GiaTien, HuongDanSuDung, MaHoaDon) VALUES
('DT001', 'T001', 20, 40000.00, 'Uống 2 viên sau khi ăn', 'HD001'),
('DT002', 'T002', 15, 15000.00, 'Uống 1 viên mỗi sáng', 'HD002'),
('DT003', 'T003', 10, 50000.00, 'Uống 1 viên sau bữa tối', 'HD003'),
('DT004', 'T004', 5, 15000.00, 'Uống 1 viên sau khi ăn', 'HD004');

-- LichHenKham table
INSERT INTO LichHenKham (MaLichHen, MaBenhNhan, NgayHenKham, MaBacSi) VALUES
('LH001', 'BN001', '2024-02-01', 'NV002'),
('LH002', 'BN002', '2024-02-02', 'NV003'),
('LH003', 'BN003', '2024-02-03', 'NV004'),
('LH004', 'BN004', '2024-02-04', 'NV001');
