use lesson_3;

-- 1

select salary from staff 
order by salary desc;

select salary from staff 
order by salary;

-- 2

select salary from staff 
order by salary desc
limit 5;

-- 3

select name, surname, specialty
from staff 
where specialty = 'рабочий' and salary > 20000
group by specialty;
