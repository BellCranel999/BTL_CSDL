
-- Bảng KHOA
CREATE TABLE Khoa(
    makhoa CHAR(10),
    tenkhoa CHAR(30),
    dienthoai CHAR(10),
    CONSTRAINT PK_Khoa PRIMARY KEY(makhoa)
);
GO
-- Bảng GIANGVIEN
CREATE TABLE GiangVien(
    magv INT,
    hotengv CHAR(30),
    luong DECIMAL(10,2),
    makhoa CHAR(10),
    CONSTRAINT PK_GiangVien PRIMARY KEY(magv),
    CONSTRAINT FK_GV_Khoa FOREIGN KEY(makhoa) REFERENCES Khoa(makhoa)
);
GO
-- Bảng SINHVIEN
CREATE TABLE SinhVien(
    masv INT,
    hotensv CHAR(30),
    makhoa CHAR(10),
    namsinh INT,
    quequan CHAR(30),
    CONSTRAINT PK_SinhVien PRIMARY KEY(masv),
    CONSTRAINT FK_SV_Khoa FOREIGN KEY(makhoa) REFERENCES Khoa(makhoa)
);
GO
-- Bảng DETAI
CREATE TABLE DeTai(
    madt CHAR(10),
    tendt CHAR(30),
    kinhphi INT,
    NoiThucTap CHAR(30),
    CONSTRAINT PK_DeTai PRIMARY KEY(madt)
);
GO
-- Bảng HUONGDAN
CREATE TABLE HuongDan(
    masv INT,
    madt CHAR(10),
    magv INT,
    ketqua DECIMAL(5,2),
    CONSTRAINT PK_HuongDan PRIMARY KEY(masv, madt),
    CONSTRAINT FK_HD_SV FOREIGN KEY(masv) REFERENCES SinhVien(masv),
    CONSTRAINT FK_HD_DT FOREIGN KEY(madt) REFERENCES DeTai(madt),
    CONSTRAINT FK_HD_GV FOREIGN KEY(magv) REFERENCES GiangVien(magv)
);
GO

--  part 2


-- SELECT COUNT(*) AS SumCount FROM SinhVien  
-- SELECT SV.masv, K.tenkhoa,SV.namsinh FROM SinhVien SV, Khoa K WHERE SV.masv = K.makhoa
-- SELECT SV.hotensv,SV.masv,SV.namsinh FROM SinhVien SV WHERE SV.makhoa = 'CNTT'
-- SELECT * FROM GiangVien GV ORDER BY (luong) ASC/DESC

-- TEN DE TAI KO CO SINH VIEN THUC TAP -> USING NOT IN
-- SELECT tendt FROM DeTai WHERE madt NOT IN (SELECT madt FROM HuongDan)

SELECT makhoa, COUNT(*) AS SUMCOUNT FROM SinhVien GROUP BY (makhoa)









-- 
CREATE TABLE Khoa
(
    makhoa char(10) NOT NULL,
    tenkhoa varchar(20),
    CONSTRAINT PK_Khoa PRIMARY KEY(makhoa)
);
GO



-- CREATE TABLE MONTH(
--     maMH char(10) NOT NULL,
--     makhoa char(10) NOT NULL,
    
-- );


