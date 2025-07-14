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

alter table employees
add phone_ino int;

alter table employees
modify column phone_ino varchar(20);

alter table employees
rename column phone_ino to  phone_no;

alter table employees 
modify column phone_no int;

alter table employees
modify column phone_no int after last_name;

alter table employees
modify column phone_no varchar(14);

set sql_safe_updates=0;

update employees
set phone_no="+91-9898989898"
where employee_id=1;

update employees
set phone_no="+91-9898956789"
where employee_id=2;

update employees
set phone_no="+91-9123459898"
where employee_id=3;

update employees
set phone_no="+91-9128980011"
where employee_id=4;

update employees
set phone_no="+91-9984325646"
where employee_id=5;

alter table employees
add column working_hours decimal(6,2);

alter table employees
modify column working_hours decimal(6,2) after hourly_pay;

update employees
set working_hours=2000;

alter table employees
add column yearly_pay decimal(8,2);

alter table employees
modify column yearly_pay decimal(8,2) after working_hours;

update employees
set yearly_pay=hourly_pay*working_hours;

alter table employees
modify column employee_id int primary key;

insert into employees(employee_id,first_name,last_name,phone_no,hourly_pay,working_hours,hire_date)
values
(6,"avinash","avi","+91-7674039456",16.25,2000,"2023-01-07");

update employees
set yearly_pay=hourly_pay*working_hours
where employee_id=6;

# Triggers

delimiter $$
create trigger before_insert_employees
before insert on employees
for each row
begin 
set new.yearly_pay=new.hourly_pay*new.working_hours;
end $$

delimiter ; # Before semicolon space must

insert into employees(employee_id, first_name, last_name, phone_no, hourly_pay, working_hours, hire_date)
values (7, 'ravi', 'kumar', '+91-9876543210', 18.75, 2000, '2023-01-08');

update employees
set hourly_pay=17 # yearly_pay does not change automatically
where employee_id=2;

update employees
set yearly_pay = hourly_pay*working_hours
where employee_id=2;

update employees
set hourly_pay=14,
	yearly_pay=hourly_pay*working_hours
where employee_id=3;

set sql_safe_updates=1;

delete from employees
where employee_id=6;

delimiter $$
create trigger before_update_employees
before update on employees
for each row
begin
	set new.yearly_pay=new.hourly_pay*new.working_hours;
end $$
delimiter ;

update employees
set hourly_pay=21
	where employee_id=4;
    
drop trigger before_update_employees;
drop trigger if exists after_update_employees;

create view employee_summary as
select first_name,last_name,phone_no from employees;
select * from employee_summary;

create view pay as 
select first_name,yearly_pay from employees;
select * from pay;

select * from employees;

select * from employees where employee_id=5; 

select * from employees where hourly_pay > 20;

select first_name,hourly_pay from employees;

select yearly_pay from employees;

select yearly_pay from employees where yearly_pay between 34000 and 37500; # Both values are inclusive.

alter table employees
add constraint check_hourly_pay check(hourly_pay >10);

insert into employees(employee_id,first_name,last_name,phone_no,hourly_pay,working_hours,hire_date)
values
(6,"amar","yadav","+91-9834278342",28.50,2000,"2023-01-07"); # if we give 8.5 instead of 28.5 it shows violation

alter table employees
modify column hire_date date after last_name; # Don't forget to add data type

alter table employees
modify column phone_no varchar(14) after yearly_pay;

alter table employees
modify column hire_date date after phone_no;

select * from employees;


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments (department_id, department_name)
VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');


select * from departments;

ALTER TABLE employees
ADD department_id INT;

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

set sql_safe_updates=0;
UPDATE employees
SET department_id = CASE
    WHEN employee_id = 1 THEN 1
    WHEN employee_id = 2 THEN 2
    WHEN employee_id = 3 THEN 3
    WHEN employee_id = 4 THEN 1
    WHEN employee_id = 5 THEN 2
    WHEN employee_id = 6 THEN 3
    WHEN employee_id = 7 THEN 1
END;

select * from employees;

select * from employees
where hire_date like "2023-01-05";

select * from employees
where hire_date like "____-01-02"; # 4 underscores for year

select * from employees
where hire_date like "____-__-03";

select * from employees
where first_name like "s%"; # It considers the first letter of first_name

select * from employees
where first_name like "%k"; # It considers the last letter of first_name

select * from employees
where first_name like "_a%"; # It considers the second letter of first_name because we gave space(underscore)

select * from employees
where last_name like "__ee_%"; # It consider 3 and 4th character of last_name

select * from employees
where hire_date in("2023-01-01","2023-01-02","2023-01-03");
# It returns only two employees because no one was hired on 2023-01-01

select * from departments;

select * from students;

select * from students
where hindi=87 or english=54;

select * from students 
where name in ("rakesh","srinu");

select * from students
where hindi in (86,87);

select * from students;




















