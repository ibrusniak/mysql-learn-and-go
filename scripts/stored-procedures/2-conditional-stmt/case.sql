
drop database if exists testdb;
create database testdb;
use testdb;

-- case _value_ wher _condition_ then _statements else _statements end case

delimiter $$

create procedure which_is_num(in val int unsigned, out num_c varchar(50))
begin
    case val
        when val = 0 then set num_c = 'zero';
        when val = 1 then set num_c = 'one';
        when val > 1 and val < 50 then set num_c = 'from 1 to 50';
        when val = 50 then set num_c = 'twenty';
        else set num_c = 'more than fifty';
    end case;
end$$

create procedure which_is_random()
begin
    declare val int unsigned;
    declare num_c varchar(50);
    set val = round(rand() * 100);
    call which_is_num(val, num_c);
    select val, num_c;
end$$

delimiter ;

call which_is_random();

