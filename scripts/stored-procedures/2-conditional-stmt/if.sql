
drop database if exists testdb;
create database testdb;
use testdb;

-- if cond then ... end if;

delimiter $$

create procedure gen()
begin
    declare val int unsigned;
    declare more_or_less varchar(50);
    set val = round(rand() * 1000);
    if val > 500 then
        set more_or_less = 'more then 500';
    else
        set more_or_less = 'less then 500';
    end if;
    select
        val `random value`,
        more_or_less `more 500 or less`;
end$$

create procedure give_random(out r int unsigned, in multiplier int unsigned)
begin
    set r = round(rand() * multiplier);
end$$

create procedure _case(inout _number int unsigned, out _res varchar(30))
begin
    if _number = 0 then set _res = 'zero';
    elseif _number = 1 then set _res = 'one';
    elseif _number > 1 and _number < 20 then set _res = 'between 1 and 20';
    elseif _number = 20 then set _res = 'twenty';
    elseif _number > 20 and _number < 60 then set _res = 'between 20 and 60';
    elseif _number = 60 then set _res = 'sixty';
    elseif _number > 60 and _number < 100 then set _res = 'between 60 and 100';
    else
        set _res = '100 or more';
    end if;
end$$

delimiter ;

call gen();

set @a = 0;
set @m = 100;

call give_random(@a, @m);

select @a, @m;

set @res = '';

call _case(@m, @res);

select @res;




