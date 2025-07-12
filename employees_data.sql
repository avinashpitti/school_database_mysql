create database school;

use school;

create table employees(
employee_id int,
first_name varchar(20),
last_name varchar(20),
hourly_pay decimal(5,2),
hire_date date
);

insert into employees
values
(1,"Eugene","krabs",25.50,"2023-01-02"),
(2,"squidward","tentacles",15.00,"2023-01-03"),
(3,"spongebob","squarepants",12.50,"2023-01-04"),
(4,"patrick","star",12.50,"2023-01-05"),
(5,"sandy","cheeks",17.25,"2023-01-06");

select * from employees;

