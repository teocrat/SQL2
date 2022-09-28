use lesson_3;

drop table if exists salepeople;

create table salepeople(
   snum int,
   sname varchar(30),
   city varchar(40),
   comm varchar(10)
);

insert salepeople(snum, sname, city, comm)
values
	(1001, 'Peel', 'London', '.12'),
	(1002, 'Serres', 'San Jose', '.13'),
	(1004, 'Motika', 'London', '.11'),
	(1007, 'Rifkin', 'Barcelona', '.15'),
	(1003, 'Axelrod', 'New York', '.10');
	
drop table if exists customers;

create table customers(
	cnum int,
	cname varchar(30),
	city varchar(40),
	rating int,
	snum int
);

insert customers(cnum, cname, city, rating, snum)
values
	(2001, 'Hoffman', 'London', 100, 1001),
	(2002, 'Giovanny', 'Rome', 200, 1003),
	(2003, 'Liu', 'San Jose', 200, 1002),
	(2004, 'Grass', 'Berlin', 300, 1002),
	(2006, 'Clemens', 'London', 100, 1001),
	(2008, 'Cisneros', 'San Jose', 300, 1007),
	(2007, 'Pereira', 'Rome', 100, 1004);

drop table if exists orders;

create table orders(
	onum int primary key,
	amt decimal(7,2),
	odate varchar(30),
	cnum int,
	snum int
);
 insert orders(onum, amt, odate, cnum, snum)
 values
 	(3001, 18.69, '10/03/1990', 2008, 1007),
 	(3003, 767.19, '10/03/1990', 2001, 1001),
 	(3002, 1900.10, '10/03/1990', 2007, 1004),
 	(3005, 5160.45,'10/03/1990', 2003, 1002),
 	(3006, 1098.16, '10/03/1990', 2008, 1007),
 	(3009, 1713.23, '10/04/1990', 2002, 1003),
 	(3007, 75.75, '10/04/1990', 2004, 1002),
 	(3008, 4723.00, '10/05/1990', 2006, 1001),
 	(3010, 1309.95, '10/06/1990', 2004, 1002),
 	(3011, 9891.88, '10/06/1990', 2006, 1001);


-- 1

select city, sname, snum, comm
from salepeople;

-- 2

select rating, cname
from customers
where city = 'San Jose';

-- 3

select distinct snum 
from salepeople;

-- 4

select cname from customers
where cname like 'G%';

-- 5

select onum, amt from orders  
where amt > 1000;

-- 6

select onum, min(amt) from orders;

-- 7

select cname, rating from customers c 
where rating > 100 and city != 'Rome';




























