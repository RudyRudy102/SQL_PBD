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

select concat(w_imie, " ", w_nazwisko, " ma samochód marki ", marka, ", który ma ", 2025 - rok, " lata i kosztuje ", round(cena/3.87, 0), " EUR.") as "Zdanka" from auta;

Case 
    when condition1 then result1
    when condition2 then result2
    when condidionN then resultN
    else result3
END;

Select imie, nazwisko, wiek,
Case
    when wiek < 30 then "Młodszy deweloper"
    when wiek > 30 then "Starszy deweloper"
    else "Deweloper ma 30 lat"
END
From pracownicy;

8. 1- Marka pojazdu
    2- Spalanie
    3- spala powyżej 6 litrów - spala duzo
        spala poniej 6 litrów - spala mało
        spala 6 litrów - spala idealnie

Select marka, spalanie,
Case
    when spalanie > 8 then "Spala dużo"
    when spalanie < 8 then "Spala mało"
    else "Spala idealnie"
END
as "Kalkulator spalania"
From auta;

Wyświetl dane w dwóch kolumnach:
1- Polonez ma 15 lat
2- imię i nawisko właściciela
SELECT 
    CONCAT(marka, ' ma ', 2025 - rok, ' ',
        CASE 
            WHEN (2025 - rok) = 1 THEN 'rok'
            WHEN (2025 - rok) BETWEEN 2 AND 4 OR (2025 - rok) % 10 BETWEEN 2 AND 4 AND (2025 - rok) % 100 NOT BETWEEN 12 AND 14 THEN 'lata'
            ELSE 'lat'
        END) AS "Wiek auta",
    CONCAT(w_imie, ' ', w_nazwisko) AS "Właściciel"
FROM auta;

Pokaz w tabeli:

Marka   Spalanie    Eko Info
Mercedes  5   spala poniej 8l
Polonez 10 spala od 8 do 10l
mazda 12 spala powyzej 10l
fiat 10 spala 10l

SELECT 
    marka,
    spalanie,
    CASE
        WHEN spalanie < 8 THEN 'Spala poniej 8l'
        WHEN spalanie BETWEEN 8 AND 10 THEN 'Spala od 8 do 10l'
        WHEN spalanie > 10 THEN 'Spala powyzej 10l'
    END AS "Eko Info"
FROM auta;

W tabeli zmieniamy by Mazda w 3 rekordzie spalała 8 i pół litra

UPDATE auta
SET spalanie = 8.5
WHERE id = 3;


ALTER TABLE auta MODIFY COLUMN spalanie varchar(10);
ALTER TABLE auta MODIFY COLUMN spalanie FLOAT(10);


Ułóz zdania o wszystkich rekordach zawierające:

Inforację o imieniu i nazwisku właściciela, który kupił auto jakiejś marki

SELECT 
    CONCAT(w_imie, ' ', w_nazwisko) AS "Właściciel",
    CONCAT(
        CASE 
            WHEN RIGHT(w_imie, 1) = 'a' THEN 'kupiła auto marki '
            ELSE "kupił auto marki '
        END,
        marka
    ) as "nazwa samochodu"
FROM auta;

