use lesson_4;

-- 1

select MARK, COLOR, count(COLOR) as res
from auto a 
where MARK in ("BMW", "LADA")
group by COLOR,MARK;

-- 2

select distinct MARK, count(MARK) as amt_this_brand,
(select count(MARK)
from auto a1 where a1.MARK != a.MARK) as amt_not_this_brand
from auto a
group by MARK;

-- 3

select * from test_a ta 
left join test_b tb on ta.id = tb.id
where tb.id is null;


