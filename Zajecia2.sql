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

Jan Kowalski zapłacił za samochód Polonez 2300zł
Polonez spala 7 litrów oleju napędowego na 100km
Polonez o pojemności 4000cm3 kosztuje 5000zł
Polonez z 1993 roku spala 5 litrów
Polonez, który ma 15 lat kosztuje 3400zł

Wyświetl dane w tabeli (cztery kolumny) o wszystkich autach
Kolumna 1: Nazwisko i imię właściciela
Kolumna 2: Polonez spala 5 litrów
Kolumna 3: Cena PLN
Kolumna 4: Cena w EUR /kurs EUR PLN 3.87

select concat(w_imie, " ", w_nazwisko, " zapłacił za samochód ", marka, " ", cena, "zł.") from auta;

select concat(marka, " spala ", spalanie, " litrów oleju napędowego na 100km") from auta;

select concat(marka, " o pojemności ", pojemnosc, "cm3 kosztuje ", cena, "zł") from auta;

select concat(marka, " z ", rok, " roku spala ", spalanie, " litrów") from auta;

select concat(marka, ", który ma ", 2025 - rok, " lat kosztuje ", cena, "zł") from auta;

select concat(w_imie, " ", w_nazwisko) as "Właściciel", 
    concat(marka, " spala ", spalanie, " litrów") as "Spalanie", 
    concat(cena, " zł") as "Cena w PLN", 
    concat(round(cena/3.87, 0), " EUR") as "Cena w EUR" 
from auta;


Ułóż zdania o wszystkich autach wg wzoru:

Jan Kowalski ma samochód marki Polonez, który ma 24 lata i kosztuje 345 EUR

select concat(w_imie, " ", w_nazwisko, " ma samochód marki ", marka, ", który ma ", 2025 - rok, " lata i kosztuje ", round(cena/3.87, 0), " EUR") as "Zdanka" from auta;