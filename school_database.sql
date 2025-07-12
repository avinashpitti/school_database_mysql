create database school;

use school;

create table students(
name varchar(20),
telugu int,
hindi int,
english int,
maths int,
science int);

insert into students
values
("ramesh",67,76,90,98,94),
("srinu",56,87,76,45,90),
("rakesh",94,38,78,56,88),
("amar",88,86,54,78,98);

alter table students
add column Total int;

set sql_safe_updates=0;

update students
set total=telugu+hindi+english+maths+science;

select * from students
where name="amar";

alter table students
add column max int;

update students
set max=500;

alter table students
add column percentage decimal(5,2);

update students
set percentage=(total/max)*100;

select * from students;