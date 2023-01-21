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

CREATE TABLE fen_lisesi(
okul_no INT UNIQUE,
isim VARCHAR(25) NOT NULL,
derece DOUBLE,
adres VARCHAR(50),
son_degisiklik_tarihi DATE
);
SELECT * FROM fen_lisesi;

INSERT INTO fen_lisesi VALUES (101,'Mehmet Dag',4.5,'Ankara','2023-01-20');
INSERT INTO fen_lisesi VALUES (102,'Berrin Hanim',4.6,'İstanbul', '2023-01-18' );
INSERT INTO fen_lisesi VALUES (103,'Mehmet Erdem',3.9,'İzmir', '2023-01-20' );
INSERT INTO fen_lisesi VALUES (104,'Sinan Bey',4.7,'İstanbul', '2023-01-20' );
INSERT INTO fen_lisesi VALUES (105,'Gulhayat',4.3,'İstanbul', '2023-01-21' );
INSERT INTO fen_lisesi VALUES (106,'Gulhayat',null,null, null );
INSERT INTO fen_lisesi VALUES (null,'Gulhayat',null,null, null );
INSERT INTO fen_lisesi VALUES (null,'Gulhayat',null,null, null );
INSERT INTO fen_lisesi (isim,adres) VALUES ('Abdullah Ak','İstanbul' );
INSERT INTO fen_lisesi (okul_no,isim,adres) VALUES (109,'Yucel','İstanbul' );
INSERT INTO fen_lisesi (isim,adres,okul_no) VALUES ('Yucel','İstanbul',109 );

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz>>>>>> Lms ten aldığım notta UNİQUE 	KEY sadece 1 TANE NULL kabul eder bilgisi var
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder,
-- diger kayitlarda duplicate hatasi verir
/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

CREATE TABLE anadolu_lisesi(
okul_no VARCHAR(4) UNIQUE,
isim VARCHAR(25) NOT NULL,
adres VARCHAR(10),
derece DOUBLE
);

SELECT * FROM anadolu_lisesi;
DROP TABLE anadolu_lisesi;

INSERT INTO anadolu_lisesi VALUES ('1001','Aysee Nuriye','Antep',4.7);
INSERT INTO anadolu_lisesi VALUES ('1002','Zafer','Ankara',4.6);
INSERT INTO anadolu_lisesi VALUES ('1003','Furkan Veli','Istanbul',4.7);
INSERT INTO anadolu_lisesi VALUES ('1004','Humeyra','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('1005','Mehmet','Izmir',4.7);
INSERT INTO anadolu_lisesi VALUES (null,'Mutlu','Maras',4.7);
INSERT INTO anadolu_lisesi VALUES (null,'Mesut','Maras',4.7);
INSERT INTO anadolu_lisesi VALUES ('1001','Aysee Nuiye','Antep',4.7);

INSERT INTO anadalu_lisesi (isim, adres) VALUES ('Berrin','Ankara');
INSERT INTO anadalu_lisesi (okul_no, adres, derece) VALUES (1007,'Ankara');





