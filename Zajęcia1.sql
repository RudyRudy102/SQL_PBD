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