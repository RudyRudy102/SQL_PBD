create table auta (id int not null auto_increment primary key, marka varchar(15), pojemnosc int, w_nazwisko varchar(20), w_imie varchar(10), cena int, rok int, spalanie int);insert into auta values (0, 'Fiat', 2000, 'Kowalski', 'Jan', 3300, 2001, 7);insert into auta values (0, 'Polonez', 1500, 'Malinowski', 'Piotr', 3500, 2002, 4);insert into auta values (0, 'Mazda', 2000, 'Jankowski', 'Dariusz', 1000, 2001, 3);insert into auta values (0, 'Mercedes', 3000, 'Kowalski', 'Jan', 8000, 2009, 10);insert into auta values (0, 'Mercedes', 2200, 'Wicek', 'Jan', 13300, 2010, 9);insert into auta values (0, 'Seat', 1300, 'Jankowska', 'Katarzyna', 8000, 2008, 6);insert into auta values (0, 'Syrenka', 2000, 'Witkowska', 'Joanna', 300, 1994, 15);insert into auta values (0, 'Opel', 1550, 'Jaszczurkowski', 'Adam', 7000, 1992, 10);insert into auta values (0, 'Opel', 1550, 'Jasz', 'Joanna', 4700, 1999, 11);insert into auta values (0, 'Syrenka', 2300, 'Kilkuc', 'Tomasz', 5200, 2003, 9);insert into auta values (0, 'Fiat', 2100, 'Juskiewicz', 'Anna', 8900, 2003, 8);


CREATE TABLE wlasciciele (id int NOT NULL AUTO_INCREMENT PRIMARY KEY,nazwisko varchar(20), imie varchar(10), miasto varchar(10), ulica varchar(10));

INSERT INTO wlasciciele (id, nazwisko, imie, miasto, ulica) VALUES(0, 'Kowalski', 'Jan', 'Warszawa', 'Zielona 5'),(0, 'Malinowski', 'Jan', 'Otwock', 'Cicha 11'), (0, 'Brys', 'Karol', 'Warszawa', 'Mala 16'),(0, 'Jablonski', 'Karol', 'Krakow', 'Smocza 11'),(0, 'Wargocki', 'Grzgorz', 'Krakow', 'Wawelska 3'),(0, 'Piotrwwski', 'Grzgorz', 'Warszawa', 'Cicha 56a'),(0, 'Rak', 'Piotr', 'Warszawa', 'Jasna 11'),(0, 'Pawlowski', 'Maciej', 'Krakow', 'Taka 1');

5. W tabeli auta kasujemy zbędne pola w_nazwisko oraz w_imie, dodajemy pole id_osoby do którego później wstawiamy numer osoby z tabeli właściciele.

ALTER TABLE auta DROP w_nazwisko;

ALTER TABLE auta DROP w_imie;

ALTER TABLE auta ADD id_osoby INT;

6. Uzupełniamy tabelę auta (pole id_osoby) numerami osób z tabeli wlasciciele.

UPDATE auta SET id_osoby = 5 WHERE id = 1;

UPDATE auta SET id_osoby = 2 WHERE id = 2;

UPDATE auta SET id_osoby = 1 WHERE id = 3;

UPDATE auta SET id_osoby = 5 WHERE id = 4;

UPDATE auta SET id_osoby = 4 WHERE id = 5;

UPDATE auta SET id_osoby = 1 WHERE id = 6;


INSERT INTO wlasciciele (id, nazwisko, imie, miasto, ulica) VALUES
(0, 'Nowak', 'Marek', 'Gdansk', 'Dluga 10'),
(0, 'Zielinski', 'Anna', 'Poznan', 'Krotka 5'),
(0, 'Kowalczyk', 'Piotr', 'Lodz', 'Szeroka 3'),
(0, 'Wojcik', 'Ewa', 'Wroclaw', 'Waska 7');
insert into wlasciciele values (0, 'Kłos', 'Bartula', 'Raszyn', 'Zielona 69');
update auta set id_osoby = 10 where id = 11;
update auta set id_osoby = 11 where id = 9;
update auta set id_osoby = 14 where id = 10; 



auta.id_osoby -> wlasciciele.id;


select * from auta join wlasciciele on auta.id_osoby = wlasciciele.id;


select * from auta;
select concat(w_imie, w_nazwisko) from auta;
select concat(w_imie, " ", w_nazwisko) from auta;
select concat(w_imie, " ma na imie ", w_nazwisko) from auta;
1. Polonez spala 7 litrow.
select concat(marka, " spala ", spalanie, " litrow.") from auta;
2. Jan Kowalski jest wlascicielem samochodu Polonez.
3. Polonez kosztuje 34000 zł i spala 4 litry.
4. Jan Kowalski kupil samochod mazda i zaplacil 45000zl.
5. Mazda spala 10 litrow PB98 na 100km. Pojemnosc tego auta to 3000.
6. Polonez ma kolor zielony i wyprodukowano go w 2003 roku.
7. Mazda kosztuje 28000zł czyli 3600USD (kurs: 1USD=3.8zł).
// przyda się zaokrąglenie wyniku w usd
select concat(mazda, round(cena/3.8,2)) from auta;
8. Jan Kowalski ma auto, które ma 23lata.
9. Ułóż zdanie o samochodach uwzględniając: Wlasciciela, markę, kolor,
 cenę i spalanie.
10. To co w pkt. 9 - ale chcemy info tylko o Mercedesach.
11. To co w pkt. 8 - sortujemy dane wg. wieku - od najstarszych
12. J.W. od najtańszych wg. ceny
13. Wyswietl dane w dwoch kolumnach. W pierwszej: Polonez ma 15lat.
    W drugiej imie i nazwisko wlasciciela.
select concat(cos tam), concat(cos tam drugiego) from ...;
14.Ułóż zdania:
Zielony Polonez wyprodukowany w 2022 roku przejezdza 100km za 8.20zł
(cena PB98 = 7.40).

select concat(wlasciciele.imie, " ", wlasciciele.nazwisko, " kupil samochod ", auta.marka, " i zaplacil ", auta.cena, "zl.")
from auta 
join wlasciciele on auta.id_osoby = wlasciciele.id 

where auta.marka = "Mazda";



Wyświetl dane o wszystkich samochodach
kolumna 1 - Marka auta
Kolumna 2 - imię i nazwisko właściciela
Kolumna 3 - wiek auta (w latach)
Kolumna 4 spalanie (w litrach)
Kolumna 5 - tekst zalezny od kolumny 4 -
- spala w normie (7-10l)
- spala za dużo (powyżej 10l)
- spala za mało (poniżej 7l)

select auta.marka as zadanko concat(wlasciciele.imie, " ", wlasciciele.nazwisko), 2025 - auta.rok, auta.spalanie,
case
    when auta.spalanie > 10 then "Spala duzo"
    when auta.spalanie < 7 then "Spala malo"
    else "Spala w normie"
end
from auta
join wlasciciele on auta.id_osoby = wlasciciele.id;


select 
    auta.marka AS "Marka auta",
    concat(wlasciciele.imie, " ", wlasciciele.nazwisko) AS "Właściciel",
    2025 - auta.rok AS "Wiek auta",
    auta.spalanie AS "Spalanie",
    case
        when auta.spalanie > 10 then "Spala za dużo"
        when auta.spalanie < 7 then "Spala za mało"
        else "Spala w normie"
    end AS "Ocena spalania"
from auta
join wlasciciele on auta.id_osoby = wlasciciele.id;



11 (Kolor) samochód marki (marka) kupił (imię i nazwisko właściciela)

select concat(auta.kolor, " samochod marki ", auta.marka, " kupil ", wlasciciele.imie, " ", wlasciciele.nazwisko)
from auta
join wlasciciele on auta.id_osoby = wlasciciele.id;
 


SELECT CONCAT(
    UPPER(SUBSTRING(auta.kolor, 1, 1)), 
    SUBSTRING(auta.kolor, 2), 
    " samochod marki ", 
    auta.marka, 
    " kupil ", 
    wlasciciele.imie, 
    " ", 
    wlasciciele.nazwisko
)as "Auta"
FROM auta
JOIN wlasciciele ON auta.id_osoby = wlasciciele.id;

