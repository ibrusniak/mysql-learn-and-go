
drop database if exists testdb;
create database testdb;
use testdb;

-- use `while` loop

delimiter :)

create procedure get_fibonacci(in _count tinyint unsigned)
begin
    declare _current, _prev, _pprev bigint unsigned;
    declare final_str mediumtext;
    set final_str = '0 1 2';
    set _prev = 2;
    set _pprev = 1;
    while _count != 0 do
        set _current = _prev + _pprev;
        set _count = _count - 1;
        set final_str = concat(final_str, ' ', _current);
        set _pprev = _prev;
        set _prev = _current;
    end while;
    select final_str;
end :)

delimiter ;

set @it_c = 90;

-- call get_fibonacci(@it_c);

delimiter ¯\_(ツ)_/¯

create procedure i_dont_know()
begin
    declare c int default 0;
    start_label: while c < 10 do
        set c = c + 1;
        if c < 5 then
            iterate start_label;
        else
            leave start_label;
        end if;
    end while; 
end ¯\_(ツ)_/¯

delimiter ;

call i_dont_know();

