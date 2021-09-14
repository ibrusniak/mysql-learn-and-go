drop database if exists testdb;
create database testdb;
use testdb;

delimiter $$

create procedure factorial(in base tinyint unsigned)
begin
    declare f bigint unsigned;
    case
        when base = 0 then set f = 1;
        when base = 1 then set f = 1;
        else
            begin
                set f = base;
                label: loop
                    set base = base - 1;
                    set f = f * base;
                    if base = 1 then
                        leave label;
                    end if;
                end loop;
            end;
    end case;
    select f;
end$$

delimiter ;

-- Error Code: 1264. Out of range value for column 'base' at row 1
-- set @base = -100;
-- call factorial(@base);

set @base = 0;
call factorial(@base);
set @base = 1;
call factorial(@base);
set @base = 5;
call factorial(@base);
set @base = 20;
call factorial(@base);

delimiter $$

create procedure loop_use()
begin
    declare a, counter int unsigned;
    set counter = 0;
    start_label: loop
        set a = round(rand() * 1000);
        set counter = counter + 1;
        select a, counter;
        if counter = 10 then
            leave start_label;
        end if;
    end loop;
end$$

delimiter ;

call loop_use();

