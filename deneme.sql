/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
USE sys;

CREATE TABLE Insan_Ozellikleri(
isim CHAR(30),
soyisim CHAR(50) NOT NULL,
boy DOUBLE,
kilo DOUBLE,
meslek CHAR(20),
maas INT
);
SELECT*FROM Insan_Ozellikleri;
DROP TABLE Insan_Ozellikleri;

INSERT INTO Insan_Ozellikleri VALUES ('Ali','Veli',1.75,68,'is adami',15000);
INSERT INTO Insan_Ozellikleri VALUES ('Veli','Verir',1.85,888,'tester',200000);
INSERT INTO Insan_Ozellikleri VALUES('Mutlu','Mesut',1.73,66,'developer',35000);
INSERT INTO Insan_Ozellikleri VALUES('Mesut','Mutlu',1.68,73,'Muhasebeci',17000);
INSERT INTO Insan_Ozellikleri VALUES(NULL,'Celik',Null,Null,Null,Null);


CREATE TABLE Duz_lise(
okul_no CHAR(5) UNIQUE,
isim VARCHAR(20) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE 
);
SELECT*FROM DUZ_LISE;

INSERT INTO Duz_lise VALUES ('1','Ali',78,'Ankara','2023-1-21');
INSERT INTO Duz_lise VALUES ('2','Veli',88,'Istanbul','2022-11-28');
INSERT INTO Duz_lise VALUES ('5','Ayse',91,'Izmir','2023-12-21');
INSERT INTO Duz_Lise VALUES ('3','Fatma',71,'Maras','2025-12-30');
INSERT INTO Duz_Lise VALUES ('7','Fatma',71,'Maras','2025-12-30');
INSERT INTO Duz_Lise VALUES ('6','Fatma',71,'Maras','2025-12-30');
INSERT INTO Duz_Lise VALUES ('4','NULL OLAMAZ',71,'Maras','2025-12-30');
