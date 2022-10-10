use lesson_5;

drop table if exists cars;

create table cars(
	id int primary key auto_increment,
	name varchar(20),
	cost int
);

insert cars (name, cost)
values
	('Audi', 52642),
	('Mercedes', 57127),
	('Scoda', 9000),
	('Volvo', 29000),
	('Bentley', 350000),
	('Citroen', 21000),
	('Hummer', 41400),
	('Volkswagen', 21600);

-- 1
	
create view cars_min as
select name, cost
from cars
where cost < 25000;

-- 2

alter view cars_min as
select name, cost
from cars 
where cost < 30000;

-- 3 

create view sc_au as
select name, cost
from cars 
where name in ('Scoda', 'Audi');

-- 4

drop table if exists analysis;

create table analysis (
	an_id int primary key auto_increment,
	an_name varchar (30),
	an_cost int,
	an_price int,
	an_group varchar(30)
);

insert analysis( an_name, an_cost, an_price )
values 
	('an_1', 300, 450),
	('an_2', 450, 550),
	('an_3', 200, 300),
	('an_4', 100, 150),
	('an_5', 600, 760),
	('an_6', 230, 300),
	('an_7', 500, 800),
	('an_8', 250, 350),
	('an_9', 400, 450),
	('an_10', 700, 850),
	('an_11', 100, 250);

drop table if exists orders;

create table orders (
	ord_id int primary key auto_increment,
	ord_datatime date,
	ord_an int
);


insert orders (ord_datatime, ord_an)
values
	('2020-02-01', 2),
	('2020-02-01', 1),
	('2020-02-02', 3),
	('2020-02-02', 6),
	('2020-02-03', 1),
	('2020-02-04', 11),
	('2020-02-05', 2),
	('2020-02-06', 9),
	('2020-02-07', 4),
	('2020-02-08', 2),
	('2020-02-09', 6),
	('2020-02-10', 7),
	('2020-02-12', 2),
	('2020-02-12', 10),
	('2020-02-13', 5),
	('2020-02-14', 2),
	('2020-02-15', 7),
	('2020-02-15', 8),
	('2020-02-16', 2);


select a.an_name, a.an_price, o.ord_datatime  
from analysis a
join orders o 
on o.ord_an = a.an_id 
where o.ord_datatime between '2020-02-05' and '2020-02-12';

-- 5

drop table if exists train_schedule;

create table train_schedule (
	train_id int,
	station varchar(20),
	station_time time
);

insert train_schedule (train_id, station, station_time)
values
	(110, 'San Francisco', '10:00:00'),
	(110, 'Redwood City', '10:54:00'),
	(110, 'Palo Alto', '11:02:00'),
	(110, 'San Jose', '12:35:00'),
	(120, 'San Francisco', '11:00:00'),
	(120, 'Palo Alto', '12:49:00'),
	(120, 'San Jose', '13:30:00');

select *, timediff(lead(station_time)
over(partition by train_id order by train_id), station_time) 
as time_to_next_station
from train_schedule;























