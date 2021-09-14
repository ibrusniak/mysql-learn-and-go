
drop database if exists testdb;
create database testdb;
use testdb;

set @table_num = round(rand() * 10000);

set @creation_script = concat(
    'create table if not exists dummy_table_',
    cast(@table_num as char(10)),
    ' (col1 bigint unsigned, col2 bigint unsigned, col3 bigint unsigned)');

set @insertion_script = concat(
    'insert into dummy_table_',
    cast(@table_num as char(10)),
    ' values (?, ?, ?)');

prepare _cs from @creation_script;
execute _cs;
prepare _is from @insertion_script;

delimiter $$

create procedure dummy_data_generator(in upper_range int unsigned)
begin
    set @rand1 = 0, @rand2 = 0, @rand3 = 0;
    label: loop
        call _get_random(@rand1);
        call _get_random(@rand2);
        call _get_random(@rand3);
        execute _is using @rand1, @rand2, @rand3;
        set upper_range = upper_range - 1;
        if upper_range = 0 then
            leave label;
        end if;
    end loop;
end$$

create procedure _get_random(inout v int unsigned)
begin
    set v = round(rand() * 10000);
end$$

delimiter ;


set @upper_range = 50;
call dummy_data_generator(@upper_range);
