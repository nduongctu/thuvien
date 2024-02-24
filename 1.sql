CREATE DATABASE IF NOT EXISTS qlsach;

USE qlsach;

DELIMITER $$
--
-- Thủ tục
--
CREATE PROCEDURE `SUA_NHAN_VIEN` (IN `manv` VARCHAR(255), IN `name` VARCHAR(255), IN `std` VARCHAR(255), IN `dc` VARCHAR(255), IN `tk` VARCHAR(255), IN `mk` VARCHAR(255), IN `role` INT)
BEGIN
   IF manv <> 'NV03' THEN
      UPDATE `nhan_vien_thu_vien` SET `NAME` = name, `PHONE` = std, `ADDRESS` = dc WHERE `MA_NV` = manv;
      DELETE FROM `tai_khoan` WHERE `MA_NV` = manv;
      INSERT INTO tai_khoan(TEN_DANG_NHAP, MAT_KHAU, MA_NV, ROLE) VALUES (tk, mk, manv, role);
   END IF;
END$$

CREATE PROCEDURE `THEM_NV` (IN `ma_nv` VARCHAR(20), IN `name` VARCHAR(255), IN `std` VARCHAR(255), IN `dc` VARCHAR(255), IN `tk` VARCHAR(255), IN `mk` VARCHAR(255), IN `role` INT)
BEGIN
    INSERT INTO nhan_vien_thu_vien(MA_NV, NAME, PHONE, ADDRESS)
    VALUES (ma_nv, name, std, dc);
    
    INSERT INTO tai_khoan(TEN_DANG_NHAP, MAT_KHAU, MA_NV, ROLE)
    VALUES (tk, mk, ma_nv, role);
END$$

CREATE PROCEDURE `THEM_SACH` (IN `p_ma_phieu` VARCHAR(20), IN `p_ma_sach` VARCHAR(20))
BEGIN
    -- Thêm sách vào bảng phieu_muon_sach
    INSERT INTO phieu_muon_sach (MA_PHIEU, MA_SACH) VALUES (p_ma_phieu, p_ma_sach);

    -- Cập nhật số lượng sách trong bảng sach
    UPDATE sach
    SET SO_LUONG = SO_LUONG - 1
    WHERE MA_SACH = p_ma_sach;
END$$

CREATE PROCEDURE `XOA_NV` (IN `p_manv` VARCHAR(255))
BEGIN
   IF p_manv <> 'NV03' THEN
      DELETE FROM nhan_vien_thu_vien WHERE MA_NV = p_manv;
      DELETE FROM tai_khoan WHERE MA_NV = p_manv;
   END IF;
END$$

CREATE PROCEDURE `XOA_SACH` (IN `p_ma_phieu` VARCHAR(20), IN `p_ma_sach` VARCHAR(20))
BEGIN
    -- Thêm sách vào bảng phieu_muon_sach
    DELETE FROM phieu_muon_sach WHERE MA_PHIEU = p_ma_phieu AND MA_SACH = p_ma_sach;

    -- Cập nhật số lượng sách trong bảng sach
    UPDATE sach
    SET SO_LUONG = SO_LUONG + 1
    WHERE MA_SACH = p_ma_sach;
END$$

--
-- Các hàm
--
CREATE FUNCTION `TONG_TIEN` (`ma_phieu` VARCHAR(20)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT SUM(GIA_TIEN) INTO total
    FROM sach
    JOIN phieu_muon_sach ON sach.MA_SACH = phieu_muon_sach.MA_SACH
    WHERE phieu_muon_sach.MA_PHIEU = ma_phieu;

    RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doc_gia`
--

CREATE TABLE `doc_gia` (
  `MA_DOC_GIA` varchar(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SDT` varchar(15) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL
);

--
-- 
--

INSERT INTO `doc_gia` (`MA_DOC_GIA`, `NAME`, `SDT`, `ADDRESS`) VALUES
('B2007', 'Lê Thanh Tuấn', '0345678910', 'Cần Thơ'),
('B2017', 'Nguyễn Quỳnh Như', '0987654321', 'Cần Thơ');
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhan_vien_thu_vien` 
--

CREATE TABLE `nhan_vien_thu_vien` (
  `MA_NV` varchar(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL
);

--
-- 
--

INSERT INTO `nhan_vien_thu_vien` (`MA_NV`, `NAME`, `PHONE`, `ADDRESS`) VALUES
('NV01', 'Lê Thanh Tuấn', '0345678911', 'Cần Thơ'),
('NV03', 'Nguyễn Quỳnh Như', '0987654322', 'Cần Thơ'),
('NV04', 'Nguyễn Đại Dương', '0123456788', 'Cần Thơ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nha_xuat_ban`
--

CREATE TABLE `nha_xuat_ban` (
  `MA_NXB` varchar(20) NOT NULL,
  `NAME` varchar(255) NOT NULL
);

--
-- 
--

INSERT INTO `nha_xuat_ban` (`MA_NXB`, `NAME`) VALUES
('NXB01', 'Hà Nội'),
('NXB02', 'Hải Dương'),
('NXB03', 'Thái Bình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_muon`
--

CREATE TABLE `phieu_muon` (
  `MA_PHIEU` varchar(20) NOT NULL,
  `MA_NV` varchar(20) NOT NULL,
  `MA_DOC_GIA` varchar(20) NOT NULL,
  `DATE_START` date NOT NULL,
  `DATE_END` date NOT NULL,
  `TRANG_THAI` varchar(30) NOT NULL DEFAULT 'ĐANG MƯỢN'
);

--
-- 
--

INSERT INTO `phieu_muon` (`MA_PHIEU`, `MA_NV`, `MA_DOC_GIA`, `DATE_START`, `DATE_END`, `TRANG_THAI`) VALUES
('PM01', 'NV01', 'B2017', '2023-11-11', '2023-11-12', 'ĐÃ TRẢ'),
('PM02', 'NV03', 'B2007', '2023-11-13', '2023-11-21', 'ĐANG MƯỢN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_muon_sach`
--

CREATE TABLE `phieu_muon_sach` (
  `MA_PHIEU` varchar(20) NOT NULL,
  `MA_SACH` varchar(20) NOT NULL
);

--
-- 
--

INSERT INTO `phieu_muon_sach` (`MA_PHIEU`, `MA_SACH`) VALUES
('PM02', 'S01'),
('PM02', 'S03'),
('PM02', 'S05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `MA_SACH` varchar(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SO_LUONG` int NOT NULL,
  `GIA_TIEN` int NOT NULL,
  `NAM_XB` varchar(20) NOT NULL,
  `MA_NXB` varchar(20) NOT NULL,
  `MA_TAC_GIA` varchar(20) NOT NULL
);

--
--
--

INSERT INTO `sach` (`MA_SACH`, `NAME`, `SO_LUONG`, `GIA_TIEN`, `NAM_XB`, `MA_NXB`, `MA_TAC_GIA`) VALUES
('S01', 'Dế Mèn Phiêu Lưu Ký', 7, 89000, '2023', 'NXB01', 'TG04'),
('S03', 'Số đỏ', 6, 50000, '2010', 'NXB01', 'TG06'),
('S04', 'Chí Phèo', 1, 75000, '2013', 'NXB01', 'TG07'),
('S05', 'Làng', 4, 35000, '2015', 'NXB01', 'TG08'),
('S06', 'Hai Đứa Trẻ', 10, 79000, '2009', 'NXB01', 'TG09'),
('S07', 'Già Thiên', 4, 79000, '2023', 'NXB03', 'TG05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tac_gia`
--

CREATE TABLE `tac_gia` (
  `MA_TAC_GIA` varchar(20) NOT NULL,
  `NAME` varchar(255) NOT NULL
);

--
-- 
--

INSERT INTO `tac_gia` (`MA_TAC_GIA`, `NAME`) VALUES
('TG01', 'Phạm Minh Hoài'),
('TG02', 'Nguyên Thanh Châu'),
('TG03', 'Lương Minh Minh'),
('TG04', 'Tô Hoài'),
('TG05', 'Thần Đông'),
('TG06', 'Vũ Trọng Phụng'),
('TG07', 'Nam Cao'),
('TG08', 'Kim Lân'),
('TG09', 'Thạch Lam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `TEN_DANG_NHAP` varchar(255) NOT NULL,
  `MAT_KHAU` varchar(255) NOT NULL,
  `MA_NV` varchar(20) NOT NULL,
  `ROLE` varchar(1) NOT NULL DEFAULT '0'
);

--
--

INSERT INTO `tai_khoan` (`TEN_DANG_NHAP`, `MAT_KHAU`, `MA_NV`, `ROLE`) VALUES
('', '', 'NV04', '1'),
('Tuan', 'Tuan123', 'NV01', '0'),
('Nhu', 'Nhu123', 'NV03', '0');

--
-- Khoá chính cho các bảng đã đổ
--

--
-- Khoá chính cho bảng `doc_gia`
--
ALTER TABLE `doc_gia`
  ADD PRIMARY KEY (`MA_DOC_GIA`);

--
--  Khoá chính cho bảng `nhan_vien_thu_vien`
--
ALTER TABLE `nhan_vien_thu_vien`
  ADD PRIMARY KEY (`MA_NV`);

--
--  Khoá chính cho bảng `nha_xuat_ban`
--
ALTER TABLE `nha_xuat_ban`
  ADD PRIMARY KEY (`MA_NXB`);

--
--  Khoá chính cho bảng `phieu_muon`
--
ALTER TABLE `phieu_muon`
  ADD PRIMARY KEY (`MA_PHIEU`),
  ADD KEY `MA_NV` (`MA_NV`,`MA_DOC_GIA`),
  ADD KEY `MA_DOC_GIA` (`MA_DOC_GIA`);

--
--  Khoá chính cho bảng `phieu_muon_sach`
--
ALTER TABLE `phieu_muon_sach`
  ADD PRIMARY KEY (`MA_PHIEU`,`MA_SACH`),
  ADD KEY `MA_PHIEU` (`MA_PHIEU`,`MA_SACH`),
  ADD KEY `MA_SACH` (`MA_SACH`);

--
--  Khoá chính cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`MA_SACH`),
  ADD KEY `MA_NXB` (`MA_NXB`,`MA_TAC_GIA`),
  ADD KEY `MA_TAC_GIA` (`MA_TAC_GIA`);

--
--  Khoá chính cho bảng `tac_gia`
--
ALTER TABLE `tac_gia`
  ADD PRIMARY KEY (`MA_TAC_GIA`);

--
--  Khoá chính cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`TEN_DANG_NHAP`),
  ADD KEY `MA_NV` (`MA_NV`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `phieu_muon`
--
ALTER TABLE `phieu_muon`
  ADD CONSTRAINT `phieu_muon_ibfk_1` FOREIGN KEY (`MA_NV`) REFERENCES `nhan_vien_thu_vien` (`MA_NV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieu_muon_ibfk_2` FOREIGN KEY (`MA_DOC_GIA`) REFERENCES `doc_gia` (`MA_DOC_GIA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_muon_sach`
-- 
ALTER TABLE `phieu_muon_sach`
	ADD CONSTRAINT `phieu_muon_sach_ibfk_1` FOREIGN KEY (`MA_PHIEU`) REFERENCES `phieu_muon` (`MA_PHIEU`) ON DELETE CASCADE ON UPDATE NO ACTION,
	ADD CONSTRAINT `phieu_muon_sach_ibfk_2` FOREIGN KEY (`MA_SACH`) REFERENCES `sach` (`MA_SACH`) ON DELETE CASCADE ON UPDATE NO ACTION;
--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `sach_ibfk_2` FOREIGN KEY (`MA_TAC_GIA`) REFERENCES `tac_gia` (`MA_TAC_GIA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sach_ibfk_3` FOREIGN KEY (`MA_NXB`) REFERENCES `nha_xuat_ban` (`MA_NXB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD CONSTRAINT `tai_khoan_ibfk_1` FOREIGN KEY (`MA_NV`) REFERENCES `nhan_vien_thu_vien` (`MA_NV`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;