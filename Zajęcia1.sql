ssh s24@193.0.78.160
s24.ABCD
mysql -p
s24.ABCD
use s24Patryk

create table osoby 

(

id int(11) not null auto_increment primary key,

nazwisko varchar(30), 

imie varchar(20), 

rok int(11)

);

show columns from osoby;

insert into osoby values

("0", "Kowalski", "Jan", "1997")

;

insert into osoby values

("0", "Omar", "Jakub", "2007")

;

insert into osoby values

("0", "Kosa", "Olaf", "2007")

;

insert into osoby values

("0", "Gluszek", "Andrzej", "2007")

;

insert into osoby values

("0", "Omar", "Jakub", "2007")

;

select * from osoby;

update osoby set rok = "1876" where id=5;

update osoby set nazwisko = "Barcikowska" where id=3;

alter table osoby add pesel varchar(11);

update osoby set pesel = "123456789" where id=1;

update osoby set pesel = "098765432" where id=2;

update osoby set pesel = "111222333" where id=3;

update osoby set pesel = "897605435" where id=4;

update osoby set pesel = "098776554" where id=5;


create table psy 

(

id int(11) not null auto_increment primary key,

imiePsa varchar(30),  

rasa varchar(30), 

kolor varchar(30), 

wiek int(11),

imieW varchar(30),

nazwiskoW varchar(30),

);

show columns from psy;

insert into osoby values

("0", "Kowalski", "Jan", "1997")

;

UPDATE auta SET kolor = 'czerwony' WHERE id = 1;
UPDATE auta SET kolor = 'zielony' WHERE id = 2;
UPDATE auta SET kolor = 'niebieski' WHERE id = 3;
UPDATE auta SET kolor = 'czarny' WHERE id = 4;
UPDATE auta SET kolor = 'srebrny' WHERE id = 5;
UPDATE auta SET kolor = 'biały' WHERE id = 6;
UPDATE auta SET kolor = 'biały' WHERE id = 7;
UPDATE auta SET kolor = 'biały' WHERE id = 8;
UPDATE auta SET kolor = 'biały' WHERE id = 9;
UPDATE auta SET kolor = 'biały' WHERE id = 10;
UPDATE auta SET kolor = 'zielony' WHERE id = 11;
UPDATE auta SET kolor = 'niebieski' WHERE id = 12;