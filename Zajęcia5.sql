1. Do pracy używaj własnej bazy.

2. Stwórz tabele i wypełnij je danymi - polecenia poniżej.

drop table studenci;

drop table wykladowcy;

drop table przedmioty;

drop table dni;

drop table sale;

drop table oceny;

drop table dziennik;

create table studenci
(studentID int not null auto_increment primary key,
Snazwisko varchar(20),Simie varchar(10), Sindeks varchar(10), SdataUR DATE);

insert into studenci values (1, 'Krolokowski', 'Piotr', '45678', '1985-02-11');
insert into studenci values (2, 'Pawlikowski', 'Janusz', '45679', '1986-11-04');
insert into studenci values (3, 'Wietek', 'Maria','45680', '1988-02-10');
insert into studenci values (4, 'Palikowski', 'Piotr','56681', '1986-05-21');
insert into studenci values (5, 'Wilczek', 'Anna','45683', '1985-06-09');
insert into studenci values (6, 'Krolokowski', 'Witold','45684', '1990-12-15');
insert into studenci values (7, 'Maliniak', 'Piotr','45685', '1991-01-22');
insert into studenci values (8, 'Kalinowska', 'Magdalena','45687', '1992-12-20');
insert into studenci values (9, 'Patkowska', 'Anna','45688', '1989-07-08');

create table wykladowcy
(wykladowcaID int not null auto_increment primary key,
Wnazwisko varchar(20), Wimie varchar(10), Wtytul varchar(10), Wpokoj varchar(10));

insert into wykladowcy values (1, 'Mackowiak', 'Janusz', 'prof.', 'pok.311');
insert into wykladowcy values (2, 'Pilkowska', 'Joanna', 'dr', 'pok.310');
insert into wykladowcy values (3, 'Abacki', 'Julian', 'mgr', 'pok.124');
insert into wykladowcy values (4, 'Jurkowski', 'Andrzej', 'dr hab.', 'pok.50');

create table przedmioty
(przedmiotID int not null auto_increment primary key,
Pnazwa varchar(20),PwykladowcaID int, PsalaID int, PdzienID int, Pstart TIME);

insert into przedmioty values (1, 'Geografia', 1, 2, 3, '09:45:00');
insert into przedmioty values (2, 'Fizyka', 2, 1, 4, '11:15:00');
insert into przedmioty values (3, 'Etyka', 2, 2, 3, '15:00:00');
insert into przedmioty values (4, 'Historia', 3, 2, 3, '16:45:00');
insert into przedmioty values (5, 'Biologia', 4, 2, 3, '18:30:00');

create table dni
(dzienID int not null auto_increment primary key,
Dnazwa varchar(11));

insert into dni values (1, 'Poniedziałek');
insert into dni values (2, 'Wtorek');
insert into dni values (3, 'Środa');
insert into dni values (4, 'Czwartek');
insert into dni values (5, 'Piątek');
insert into dni values (6, 'Sobota');
insert into dni values (7, 'Niedziela');

create table sale
(salaID int not null auto_increment primary key,
Snazwasali varchar(20), Sadressali varchar(30), Silemiejsc int);

insert into sale values (1, 'Sala kolumnowa nr2', 'ul.Krakowskie Przedm. 12', 20);
insert into sale values (2, 'Sala kolumnowa nr3', 'ul.Krakowskie Przedm. 12a', 30);
insert into sale values (3, 'Sala 304', 'ul.Nowy Świat 69', 30);
insert into sale values (4, 'Sala 302', 'ul.Nowy Świat 69', 20);
insert into sale values (5, 'Sala 227', 'ul.Krakowskie Przedm. 3', 20);

create table oceny
(ocenaID int not null auto_increment primary key,
Onazwa varchar(22), Oliczba decimal(10,1));

insert into oceny values (1, 'bardzo dobry (5,0)', 5);
insert into oceny values (2, 'dobry plus (4,5)', 4.5);
insert into oceny values (3, 'dobry (4,0)', 4);
insert into oceny values (4, 'dostateczny plus (3,5)', 3.5);
insert into oceny values (5, 'dostateczny (3,0)', 3);
insert into oceny values (6, 'niedostateczny (2,0)', 2);
insert into oceny values (7, 'Zaliczenie (ZAL)', 0);
insert into oceny values (8, 'Niezaliczenie (NZAL)', 0);
insert into oceny values (9, 'Nieklasyfikowany (NK)', 0);

create table dziennik
(dziennikID int not null auto_increment primary key,
Ddata DATETIME,
studentID int(11),
przedmiotID int(11),
ocenaID int(11)
);
insert into dziennik values (1, '2023-02-12 11:22:00', 1, 2, 3);
insert into dziennik values (2, '2023-02-12 11:30:00', 1, 3, 4);
insert into dziennik values (3, '2023-02-14 14:28:00', 1, 4, 2);
insert into dziennik values (4, '2023-02-14 15:22:00', 2, 2, 2);

3. W tabeli dziennik wystawione są cztery oceny: Trzy dla studenta nr 1 i jedna dla studenta nr 2



4. Sprawdź poprawność danych: select dla wszystkich tabel.

select * from studenci, wykladowcy, przedmioty, dni, sale, oceny, dziennik;


5. Wyświetl w tabelce dane wg. schematu:

Data oceny  | Nazwisko i imię studenta  | Przedmiot    | Ocena
2023-02-12  | Krolokowski Piotr                | Fizyka           | 4
2023-02-14  | Falkowski Marek                 | Biologia        | 4.5
itd
Powinny być 4 rekordy

SELECT DATE(dziennik.Ddata) as "Data", 
    CONCAT(studenci.Snazwisko, " ", studenci.Simie) as "Nazwisko i imię studenta", 
    przedmioty.Pnazwa as "Przedmiot", 
    oceny.Oliczba as "Ocena"
FROM dziennik
JOIN studenci ON dziennik.studentID = studenci.studentID
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID;


6. Dodaj do tabel nowe rekordy tak aby:


a) Student o numerze indeksu 45687 przedwczoraj o 11h30s15 otrzymał z przedmiotu Etyka ocenę 5.

INSERT INTO dziennik (Ddata, studentID, przedmiotID, ocenaID)
VALUES (
    '2025-03-22 11:30:15',
    (SELECT studentID FROM studenci WHERE Sindeks = '45687'),
    (SELECT przedmiotID FROM przedmioty WHERE Pnazwa = 'Etyka'),
    (SELECT ocenaID FROM oceny WHERE Oliczba = 5)
);


b) Piotr Maliniak otrzymał wczoraj o 11h20 ocenę 4 z przedmiotu Biologia.

INSERT INTO dziennik (Ddata, studentID, przedmiotID, ocenaID)
VALUES (
    '2025-03-23 11:20:00',
    (SELECT studentID FROM studenci WHERE Sindeks = '45685'),
    (SELECT przedmiotID FROM przedmioty WHERE Pnazwa = 'Biologia'),
    (SELECT ocenaID FROM oceny WHERE Oliczba = 4)
);

c) Magdalena Kalinowska wczoraj o 12h00 otrzymała 3 z Historii


INSERT INTO dziennik (Ddata, studentID, przedmiotID, ocenaID)
VALUES (
    '2025-03-23 12:00:00',
    (SELECT studentID FROM studenci WHERE Sindeks = '45687'),
    (SELECT przedmiotID FROM przedmioty WHERE Pnazwa = 'Historia'),
    (SELECT ocenaID FROM oceny WHERE Oliczba = 3)
);


d) Dodaj do bazy nowy przedmiot: Matematyka. Będzie go prowadziła dr Anna Liszkowska - pok.120 (też trzeba dodać). Matematyka będzie się odbywała w poniedziałki o 8h00 w sali 302 na Nowym Świecie 69. (Ta sala na szczęście jest).

insert into wykladowcy values (5, 'Liszkowska', 'Anna', 'dr', 'pok.120');

INSERT INTO przedmioty (Pnazwa, PwykladowcaID, PsalaID, PdzienID, Pstart)
VALUES (
    'Matematyka',
    (SELECT wykladowcaID FROM wykladowcy WHERE Wnazwisko = 'Liszkowska'),
    (SELECT salaID FROM sale WHERE Snazwasali = 'Sala 302'),
    (SELECT dzienID FROM dni WHERE Dnazwa = 'Poniedziałek'),
    '08:00:00'
);  


e) Dodaj studenta Aneta Milowska - indeks nr 45689. Urodzona 21 marca 2001 roku w Warszawie. Wystaw Jej z wczorajszą datą ocenę dobry plus z Biologii.

INSERT INTO studenci (Snazwisko, Simie, Sindeks, SdataUR)
VALUES ('Milowska', 'Aneta', '45689', '2001-03-21');

INSERT INTO dziennik (Ddata, studentID, przedmiotID, ocenaID)
VALUES (
    '2025-03-23 21:37:00',
    (SELECT studentID FROM studenci WHERE Sindeks = '45689'),
    (SELECT przedmiotID FROM przedmioty WHERE Pnazwa = 'Biologia'),
    (SELECT ocenaID FROM oceny WHERE Onazwa = "dobry plus (4,5)")
);


7. Wykonaj ponownie polecenie z pkt.5 tylko oceny wyświetl słownie i liczbowo (bardzo dobry (5.0), dobry (4.0) itd.)

Jak dobrze policzyłem to powinno być 8 rekordów.

SELECT DATE(dziennik.Ddata) as "Data", 
    CONCAT(studenci.Snazwisko, " ", studenci.Simie) as "Nazwisko i imię studenta", 
    przedmioty.Pnazwa as "Przedmiot", 
    oceny.Oliczba as "Ocena",
    oceny.Onazwa as "Ocena słownie"
FROM dziennik
JOIN studenci ON dziennik.studentID = studenci.studentID
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID;


8. Wystaw oceny z Fizyki dla studentów o indeksach: 45683 i 45684 (oceny 3.5). Data dzisiejsza, godzina bieżąca.

INSERT INTO dziennik (Ddata, studentID, przedmiotID, ocenaID)
VALUES (
    '2025-03-24 17:30:00',
    (SELECT studentID FROM studenci WHERE Sindeks = '45683'),
    (SELECT przedmiotID FROM przedmioty WHERE Pnazwa = 'Fizyka'),
    (SELECT ocenaID FROM oceny WHERE Oliczba = "3,5")
);

INSERT INTO dziennik (Ddata, studentID, przedmiotID, ocenaID)
VALUES (
    '2025-03-24 17:30:00',
    (SELECT studentID FROM studenci WHERE Sindeks = '45684'),
    (SELECT przedmiotID FROM przedmioty WHERE Pnazwa = 'Fizyka'),
    (SELECT ocenaID FROM oceny WHERE Oliczba = "3,5")
);
9. Wyświetl w dowolnej formie informacje o ocenach z przedmiotu Fizyka. Data oceny, Nazwa przedmiotu, Imię i nazwisko studentka, nr indeksu, ocena. (Może być w tabelce).

SELECT przedmioty.Pnazwa as "Przedmiot", 
    CONCAT(studenci.Snazwisko, " ", studenci.Simie) as "Nazwisko i imię studenta", 
    studenci.Sindeks as "Nr indeksu",
    oceny.Oliczba as "Ocena",
    DATE(dziennik.Ddata) as "Data oceny"
FROM dziennik
JOIN studenci ON dziennik.studentID = studenci.studentID
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID
WHERE przedmioty.Pnazwa = "Fizyka";


10. To samo co pkt.9 i dodaj za przedmiotem imię i nazwisko prowadzącego z tytułem (np.: mgr Anna Przylkowska).



SELECT przedmioty.Pnazwa as "Przedmiot", 
    CONCAT(wykladowcy.Wtytul, " ", wykladowcy.Wimie, " ", wykladowcy.Wnazwisko) as "Prowadzący",
    CONCAT(studenci.Snazwisko, " ", studenci.Simie) as "Nazwisko i imię studenta", 
    studenci.Sindeks as "Nr indeksu",
    oceny.Oliczba as "Ocena",
    DATE(dziennik.Ddata) as "Data oceny"
FROM dziennik
JOIN studenci ON dziennik.studentID = studenci.studentID
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN wykladowcy ON przedmioty.PwykladowcaID = wykladowcy.wykladowcaID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID
WHERE przedmioty.Pnazwa = "Fizyka";


11. Wyświetl w tabeli zestawienie: Nazwa przedmiotu i ile osób zaliczyło przedmiot.

SELECT przedmioty.Pnazwa as "Przedmiot", 
    COUNT(dziennik.ocenaID) as "Ilość zaliczonych"
FROM dziennik
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID
WHERE oceny.Oliczba >= 3 OR oceny.Onazwa = "Zaliczenie (ZAL)"
GROUP BY przedmioty.Pnazwa; 

12. Wyświetl zestawienie nazwisko i imię studenta i średnia uzyskanych przez Niego ocen.

SELECT 
    CONCAT(studenci.Snazwisko, ' ', studenci.Simie) AS "Nazwisko i imię studenta",
    ROUND(AVG(oceny.Oliczba), 2) AS "Średnia"
FROM dziennik
JOIN studenci ON dziennik.studentID = studenci.studentID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID
GROUP BY studenci.studentID, studenci.Snazwisko, studenci.Simie;

13. Wyświetl zestawienie nazwisko i imię studenta i ile przedmiotów zaliczył.

SELECT 
    CONCAT(studenci.Snazwisko, ' ', studenci.Simie) AS "Nazwisko i imię studenta",
    COUNT(DISTINCT dziennik.przedmiotID) AS "Liczba zaliczonych przedmiotów"
FROM studenci
JOIN dziennik ON studenci.studentID = dziennik.studentID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID
WHERE oceny.oliczba >=3
GROUP BY studenci.studentID, studenci.Snazwisko, studenci.Simie;


14. Wybierz jednego studenta. Wyświetl w dowolnym układzie jakie przedmioty zaliczył, jakie dostał oceny i kiedy oraz tę ocenę wystawił.

SELECT 
    CONCAT(studenci.Snazwisko, ' ', studenci.Simie) AS "Nazwisko i imię studenta",
    przedmioty.Pnazwa AS "Przedmiot",
    oceny.Onazwa AS "Ocena",
    DATE(dziennik.Ddata) AS "Data wystawienia oceny"
FROM studenci
JOIN dziennik ON studenci.studentID = dziennik.studentID
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID
WHERE studenci.Sindeks = 45687;

SELECT 
    CONCAT(studenci.Snazwisko, ' ', studenci.Simie) AS "Nazwisko i imię studenta",
    przedmioty.Pnazwa AS "Przedmiot",
    oceny.Onazwa AS "Ocena",
    DATE(dziennik.Ddata) AS "Data wystawienia oceny"
FROM studenci
JOIN dziennik ON studenci.studentID = dziennik.studentID
JOIN przedmioty ON dziennik.przedmiotID = przedmioty.przedmiotID
JOIN oceny ON dziennik.ocenaID = oceny.ocenaID;