use sys;

/*================================= SUBQUERY =================================
	Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');


CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
personel_sayisi int
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);


SELECT * FROM personel;
SELECT * FROM sirketler;


-- ======================== WHERE ile SUBQUERY ===========================
/*----------------------------------------------------------------
 1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/

-- 1. adim: personel sayisi 15000 binden buyuk olan sirketleri listeleyelim
select sirket
from sirketler
where personel_sayisi>15000;  -- ford ve toyotayi cıkti olarak verir

-- 2. adim: ford ve toyotada calican personeli listeleyin
select isim, sirket
from personel
where sirket in ('ford','toyota');

-- 3. adim: Personel sayisi 15000 den cok olan sirketleri ve bu sirketlerde calisan personeli
-- listeleyelim

select isim, sirket
from personel
where sirket in (select sirket
                 from sirketler
                 where personel_sayisi>15000);
-- ford ve toyota cıktısi veren yere 1. adimdaki komutu yapistırdım.
-- bu yazim sekliyle komut dinamiklesmis oldu.


update sirketler
set personel_sayisi=16000
where sirket ='honda';


/*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/

select maas,sehir
from personel
where sirket in (select sirket
                 from sirketler
                  where sirket_id>101);



/*----------------------------------------------------------------                
  3) Ankara'daki sirketlerin sirket id ve personel 
  sayilarini listeleyiniz.
----------------------------------------------------------------*/


select sirket_id,personel_sayisi
from sirketler
where sirket IN (SELECT sirket
                   from personel
                    where sehir='ankara');
           
           
/*----------------------------------------------------------------                
  4) Veli Yilmaz isimli personelin calistigi sirketlerin sirket 
  ismini ve personel sayilarini listeleyiniz.
----------------------------------------------------------------*/
            
select personel_sayisi,sirket
from sirketler
where sirket IN (SELECT sirket
				from personel
				where isim=' veli yilmaz');
                
    -- sirket in >>>>  her iki tableda sirket field i ortak oldugu icin yaziyoruz            
                
  /* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
  
=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?
=========================================================================*/


/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/


select sirket,personel_sayisi, (select avg(maas) 
                                 from personel
                                 where sirketler.sirket=personel.sirket)
from sirketler;






/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

select sirket, (select max(maas)
			    from personel
                where sirketler.sirket=personel.sirket) 

from sirketler;
-- her iki tableda sirket field i ortak oldugu icin yaziyoruz



/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/


select sirket_id, sirket, (select count(sehir) 
                           from personel
						   where sirketler.sirket=personel.sirket)
from sirketler;

/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/



select sirket_id,sirket, (select count(sehir)
                           from personel
						   where sirketler.sirket=personel.sirket) toplam_sehir
 from sirketler
 where sirket_id>101;



/*----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/   
     

select sirket, personel_sayisi,
                                 (select min(maas)
                                 from personel
                                 where sirketler.sirket=personel.sirket),
                                 (select max(maas)
                                 from personel
                                 where sirketler.sirket=personel.sirket)
from sirketler;

 
/*----------------------------------------------------------------
SORU 6- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
     

select sirket,personel_sayisi,(select sum(maas)
                               from personel
                               where sirketler.sirket=personel.sirket)  toplam_maas

from sirketler;
-- yukarida toplam_maas isimini yazarak field ismini kisaltmis oldum












              
                                    




