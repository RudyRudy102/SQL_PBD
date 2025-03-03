ssh s24@193.0.78.160
s24.ABCD
mysql -p
s24.ABCD
use s24Patryk

Konkatanacja - łączenie stringów


select concat(nazwisko, imie) from osoby;
select id, concat(nazwisko, " ", imie), pesel from osoby;

select concat("Samochód ", marka," kosztuje ", cena, "zł.") from auta;
select concat(marka, " kosztuje ", cena, "zł.") as "Cennik" from auta;

