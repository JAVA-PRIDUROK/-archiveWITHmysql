create database if not exists Library;

use Library;

create table if not exists Author
(
firstName varchar(15) not null,
secondName varchar(15) not null,
YearsOfLife varchar(21) not null 
);

Alter table Author add primary key (firstName, secondName);

insert into Author
values ('Федор', 'Достоевский', '11.11.1821-09.02.1881'),
	   ('Михаил', 'Лермонтов', '15.10.1814-27.07.1841'),
       ('Александр', 'Пушкин', '06.07.1799-10.02.1837'),
       ('Сергей', 'Есенин', '03.10.1895-28.12.1925'),
       ('Николай', 'Некрасов', '28.11.1821-27.12.1877');

create table if not exists Book
(
AuthorFN varchar(15) not null,
AuthorSN varchar(15) not null,
NameOfBook varchar(30) not null,
YearOfCreate int not null check (YearOfCreate >= 1800 and YearOfCreate <= 2000),
primary key (AuthorFN, AuthorSN, NameOfBook), 
foreign key (AuthorFN, AuthorSN) references Author(firstName, secondName)
);

 insert into Book
values ('Федор', 'Достоевский', 'Преступление и наказание', 1866),
	   ('Федор', 'Достоевский', 'Бедные люди', 1846),
       ('Михаил', 'Лермонтов', 'Мцыри', 1840),
       ('Михаил', 'Лермонтов', 'Демон', 1839),
       ('Александр', 'Пушкин', 'Дубровский', 1841),
       ('Сергей', 'Есенин', 'Черный человек', 1926),
       ('Николай', 'Некрасов', 'Кому на Руси жить хорошо', 1874);



DELIMITER $$
create procedure SelectAUTandBOOK(in a varchar(15))
begin 
    declare error_msg varchar(100);

	if not exists (select 1 from Author where secondName = a) then
    set error_msg = concat('автор ', a, ' не найден');
    signal sqlstate '45000' set message_text = error_msg;
        
    else

	select * from Author
    where secondName = a;
    
    end if; 
end $$
DELIMITER ;

select * from Author;

select * from Book;


call SelectAUTandBOOK('Достоевский');
call SelectAUTandBOOK('Пушкен');