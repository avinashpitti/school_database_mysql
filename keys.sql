use school;

create table city(
city_id int auto_increment primary key,
cityname varchar(20) not null
);

insert into city(cityname)
values
("mumbai"),
("delhi"),
("kolkata"),
("bangalore"),
("chennai"),
("hyderabad");

select * from city;

create table customers(
customer_id int primary key auto_increment,
firstname varchar(20) not null,
lastname varchar(20) not null,
city_id int not null,
foreign key (city_id) references city(city_id))
auto_increment=24;

insert into customers(firstname,lastname,city_id)
values
("avinash","avi",6),
("rohith","sinha",6),
("akash","verma",1),
("abhishek","gupta",3),
("amar","yadav",5),
("sakshi","sinha",1);

select * from customers;


SELECT 
  customers.customer_id,
  customers.firstname,
  customers.lastname,
  city.cityname
FROM customers
JOIN city ON customers.city_id = city.city_id;

SELECT 
  c.firstname,
  c.lastname,
  ci.cityname
FROM customers AS c # Here c as alias for customers and ci as alias for city for better readabilty
JOIN city AS ci ON c.city_id = ci.city_id
WHERE ci.cityname = 'hyderabad';

SELECT 
  c.firstname,
  c.lastname,
  ci.cityname
FROM customers AS c
JOIN city AS ci ON c.city_id = ci.city_id
WHERE c.customer_id > 26;

delete from city where city_id=6; # can't delete or update a parent row; a foreign key constraint fails

# delete from customers where customer_id=24; # It gets deleted because it's a child row



