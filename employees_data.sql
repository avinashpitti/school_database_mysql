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

delimiter ;

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

select * from employees; 

