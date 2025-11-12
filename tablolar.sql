-- 1. Uyeler Tablosu
CREATE TABLE Uyeler (
    UyeID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    TCKimlikNo NVARCHAR(11),
    TelefonNo NVARCHAR(15)
);

-- 2. Tarifeler Tablosu
CREATE TABLE Tarifeler (
    TarifeID INT PRIMARY KEY IDENTITY(1,1),
    TarifeAdi NVARCHAR(100),
    Fiyat DECIMAL(10, 2),
    InternetGB INT,
    Dakika INT,
    SMS INT
);

-- 3. Abonelikler Tablosu
CREATE TABLE Abonelikler (
    AbonelikID INT PRIMARY KEY IDENTITY(1,1),
    UyeID INT,
    TarifeID INT,
    BaslangicTarihi DATE,
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID),
    FOREIGN KEY (TarifeID) REFERENCES Tarifeler(TarifeID)
);

-- 4. Faturalar Tablosu
CREATE TABLE Faturalar (
    FaturaID INT PRIMARY KEY IDENTITY(1,1),
    AbonelikID INT,
    FaturaTarihi DATE,
    Tutar DECIMAL(10, 2),
    OdendiMi BIT,
    FOREIGN KEY (AbonelikID) REFERENCES Abonelikler(AbonelikID)
);
