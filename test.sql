create database if not exists University;

use University;

create table if not exists Students
(
	firstname varchar(15) not null,
    secondname varchar(15) not null,
    course int not null check (course >= 1 and course <= 6)
);

insert into Students (firstname, secondname, course)
values ('Иванов', 'Иван', 1),
	   ('Петров', 'Петр', 2),
	   ('Александров', 'Александр', 3),
       ('Алексеев', 'Алексей', 4),
       ('Николаев', 'Николай', 5);
  use University;

drop table if exists Teachers;
drop table if exists Schedulee;

create table if not exists Teachers
(
firstname varchar(15) not null,
secondname varchar(15) not null,
department varchar(16) not null
); 

Alter table Teachers add primary key (firstname, secondname);

insert into Teachers
values ('Павел', 'Дегтярев', 'ИТ'),
	   ('Анатолий', 'Беркетов', 'ИБ'),
       ('Артем', 'Беляев', 'АСУ'),
       ('Ирина', 'Токарева', 'ИСИП');

create table if not exists Schedulee
(
dayofweek varchar(12) not null,
timeofclass time not null,
teacherfirname varchar(15) not null,
teachersecname varchar(15) not null,
groupp varchar(15) not null
); 

insert into Schedulee
values ('Понедельник', '10:00:00', 'Павел', 'Дегтярев', 'ПРГ'),
	   ('Вторник', '9:40:00', 'Ирина', 'Токарева', 'ИС'),
       ('Среда', '13:05:00', 'Артем', 'Беляев', 'ИС'),
       ('Четверг', '9:40:00', 'Анатолий', 'Беркетов', 'ПРГ'),
       ('Пятница', '13:05:00', 'Анатолий', 'Беркетов', 'ИС'),
       ('Суббота', '10:00:00', 'Павел', 'Дегтярев', 'ПРГ');

Alter table Schedulee
add constraint teacher_fk
foreign key (teacherfirname, teachersecname) 
references Teachers(firstname, secondname);