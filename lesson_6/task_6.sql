use lesson_6;

-- 1`

delimiter //

create function sec_to_dd_hh_mm_ss (num int)
returns varchar(30)
deterministic
begin
	declare s int;
	declare m int;
	declare h int;
	declare d int;
	set s = num mod 60;
	set m = num div 60;
	set h = num div 3600;
	set d = num div 86400;
	if  m > 60 then set m = m mod 60;
	end if;
	if  h > 24 then set h = h mod 24;
	end if;
	return concat(d,'days', h, 'hours', m, 'minutes', s, ' sec.' );
	
end //
delimiter ;

select sec_to_dd_hh_mm_ss(437655);

-- 2


delimiter //

create procedure even_numbers()
begin
	declare x int;
	declare str varchar(255);
	set x = 2;
	set str = '';
	while x <= 10 do
		set str = concat(str, x, ',');
		set x = x + 2;
	end while;

	select str;
end //

delimiter ;

call even_numbers();

