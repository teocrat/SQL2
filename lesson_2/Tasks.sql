use lesson_2;

drop table if exists sales;

create table sales (
	id int primary key auto_increment,
	order_date date not null,
	busket int not null
);

insert sales (order_date, busket)
values
	('2021-01-01', '200'),
	('2021-01-02' ,'240'),
	('2021-01-03', '90'),
	('2021-01-04', '270'),
	('2021-01-05', '400');


select id, order_date, busket,
if (busket < 100,'Маленький заказ',if (busket >= 100 and busket <= 300,'Средний заказ','Большой заказ'))
as amount
from sales;

drop table if exists orders;

create table orders (
	id int primary key auto_increment,
	employeeid varchar(10),
	amount float not null,
	orderstatus varchar(30)
);


insert orders(employeeid, amount, orderstatus)
values
	('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
	('e05', 100.70, 'CLOSED'),
	('e02', 22.18,'OPEN'),
	('e04', 9.50, 'CANCELLED' ),
	('e04', 99.99, 'OPEN');
	
select id, orderstatus,
case orderstatus 
when 'OPEN' then 'Order is in open state'
when 'CLOSED' then 'Order is closed'
when 'CANCELLED' then 'Order is cancelled'
end as order_summary
from orders;
	
	
	
	