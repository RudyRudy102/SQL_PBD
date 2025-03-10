date RRRR-MM-DD

datetimre RRRR-MM-DD HH:MM:SS

create table warzywniak
(
    id int(11) auto_increment primary key,
    nazwa varchar(30),
    dostawca varchar(30),
    cena int(11),
    ilosc int(11),
    waga int(11),
    kolor varchar(30),
    kontynent varchar(30)
);


insert into warzywniak values (0, 'Marchewka', 'Polcargo', 12, 4, 22, 'Czerwony', 'Europa');


Ponadto dodajemy:

2. Czerwonego ananasa z Azji dostarczanego przez firmę Wrot. Kosztuje 45zl, waga 12kg, ilość – 55szt.
3. Zielonego arbuza z Azji dostarczanego przez firmę Atton. Kosztuje 5zl, waży 2kg, ilość – 5szt.
4. Dodaj do tabeli pole na numer faktury od dostawcy i pole na kwotę brutto na fakturze
5. Uzupełnij numery faktur i kwoty brutto faktur (jak się uda cena razy waga razy ilość).
6. Oblicz (sumujemy kwoty brutto z faktur) - ile zapłacono za wszystkie faktury.

7. Zmieniamy cenę dla dowolnej Papryki. Ma kosztować 22zł 34gr
8. Sprawdzamy (select * from warzywniak;) czy cena jest poprawna.
Jeśli nie, zastanawiamy się dlaczego. Próbujemy rozwiązać problem.

9. Wprowadzamy wagę dla Pomidora (2kg 34dkg).
10. Dodajemy dodatkowe pole na końcu tabeli dla daty dostawy (typ danych DATE).
Datę wprowadzamy w formacie RRRR-MM-DD. Uzupełnij dowolnymi datami.
11. Wyświetlamy informację o wszystkich towarach (Produkt, ilość, cena w zł, cena w EUR). Kurs 1EUR=4,8zł
12. Cena w EUR wygląda źle. Zaokrąglamy cenę w EUR do dwóch miejsc po przecinku - wyświetlamy całą zawartość tabeli.
13. Wyświetlamy informację o wszystkich towarach (Produkt, ilość, cena w zł, cena w EUR, cena w USD). Kurs 1EUR=4,8zł, 1USDł=3,62zł.
14. Zaokrąglenia cen jak wyżej do dwóch miejsc po przecinku.
15. Oblicz (wyświetl) ile dni upłynęło od daty dostawy do dnia dzisiejszego dla każdego z produktów.
(produkt, data dostawy, ile dni).
16. Wyświetl nazwy dni tygodnia (na podstawie dat w tabeli) dla daty dostawy każdego produktu (pon, wt ...). Nie pokazuj na liście produktów dostarczonych w niedzielę. Nazwy dni tygodnia (jeśli się da :)) wyświetlamy w języku polskim.
17.
18. Wyświetl produkty gdzie data dostawy w tabeli to poniedziałek, środa, piątek) wg. schematu:
Produkt, Data, Dzień tygodnia (dzień tygodnia może być w języku francuskim :) )
19. Zmieniamy cenę wszystkich papryk na 12,32zł. Wyświetlamy informacje o wszystkich paprykach w układzie: produkt, cena, kolor, kontynent.
20. Wyświetlamy info o wszystkich produktach w układzie: Produkt, cena, kontynent, waga. Sortujemy dane wg. cen od najdroższych do najtańszych.
21. Wyświetlamy info o wszystkich produktach w układzie: Produkt, cena, kontynent, waga. Sortujemy dane wg. wagi od najlżejszych do najcięższych.
22. Ile wynosi średnia cena produktów?
23. Znalazłem gdzieś w sieci taką fakturę. Wprowadź zakup do swojej tabeli.

2 insert into warzywniak values (0, "Ananas", "Wrot", 45, 12, 55, "Czerwony", "Azja");
3 insert into warzywniak values (0, "Arbuz", "Atton", 5, 2, 5, "Zielony", "Azja");
4 alter table warzywniak add numer_faktury varchar(30), add kwota_brutto int(11);
5 
6 SET @numer_faktury = 0;
UPDATE warzywniak 
SET numer_faktury = (@numer_faktury := @numer_faktury + 1), 
    kwota_brutto = cena * waga * ilosc;

6 select sum(kwota_brutto) from warzywniak;
7 update warzywniak set cena = 22.34 where nazwa = "Papryka";
8 select * from warzywniak;
9 update warzywniak set waga = 2.34 where nazwa = "Pomidor";
10 alter table warzywniak add data_dostawy DATE;
11 select nazwa, ilosc, cena, round(cena/4.8, 2) as cena_eur from warzywniak;
12 select nazwa, ilosc, cena, round(cena/4.8, 2) as cena_eur from warzywniak;
13 select nazwa, ilosc, cena, round(cena/4.8, 2) as cena_eur, round(cena/3.62, 2) as cena_usd from warzywniak;
14 select nazwa, ilosc, cena, round(cena/4.8, 2) as cena_eur, round(cena/3.62, 2) as cena_usd from warzywniak;
15 select nazwa, data_dostawy, datediff(now(), data_dostawy) as ile_dni from warzywniak;
16 select nazwa, data_dostawy, case 
    when dayname(data_dostawy) = 'Monday' then 'Poniedziałek'
    when dayname(data_dostawy) = 'Tuesday' then 'Wtorek'
    when dayname(data_dostawy) = 'Wednesday' then 'Środa'
    when dayname(data_dostawy) = 'Thursday' then 'Czwartek'
    when dayname(data_dostawy) = 'Friday' then 'Piątek'
    when dayname(data_dostawy) = 'Saturday' then 'Sobota'
    when dayname(data_dostawy) = 'Sunday' then 'Niedziela'
    else 'Nieznany'
END as dzien_tygodnia from warzywniak where dayname(data_dostawy) != 'Sunday';

17 select nazwa, data_dostawy, case 
    when dayname(data_dostawy) = 'Monday' then 'Poniedziałek'
    when dayname(data_dostawy) = 'Wednesday' then 'Środa'
    when dayname(data_dostawy) = 'Friday' then 'Piątek'
    else 'Nieznany'
END as dzien_tygodnia from warzywniak where dayname(data_dostawy) != 'Sunday';

19 update warzywniak set cena = 12.32 where nazwa = "Papryka";
select nazwa, cena, kolor, kontynent from warzywniak where nazwa = "Papryka";

20 select nazwa, cena, kontynent, waga from warzywniak order by cena desc;
21 select nazwa, cena, kontynent, waga from warzywniak order by waga asc;
22 select avg(cena) from warzywniak;

ALTER TABLE warzywniak MODIFY kwota_brutto VARCHAR(255);

UPDATE warzywniak 
SET kwota_brutto = CONCAT(kwota_brutto, ' zł');

UPDATE warzywniak 
SET data_dostawy = '2024-01-24' 
WHERE id = '12';

cena brutto 738
faktura RR RR 1/22
Marchew
10 kg
60zl netto
vat 138zl

insert into warzywniak values (0, "Marchew", "Polcargo", 60, 10, 10, "Pomarańczowy", "Europa", "RR RR 1/22", 738, '2024-01-24');