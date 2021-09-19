
drop database if exists func_demos;
create database func_demos;
use func_demos;

delimiter $$

create procedure p_get_random_int(out r int)
  set r = round(rand() * 1000) $$

create function f_get_random_int() returns int deterministic
  return round(rand() * 1000) $$

delimiter ;

call p_get_random_int(@new_random_value);
select @new_random_value;
set @new_random_value_2 = f_get_random_int();
select @new_random_value_2;

select
  f_get_random_int() 'random 1',
  f_get_random_int() 'random 2',
  f_get_random_int() 'random 3',
  f_get_random_int() 'random 4'
;

delimiter $$


create function factorial(num tinyint) returns bigint deterministic
begin
  if num = 0 then return 1;
  elseif num = 1 then return 1;
  elseif num > 90 then
    signal sqlstate '99999' set message_text = 'Too big input parameter!';
  else
    return num * factorial(num - 1);
  end if;
end $$

delimiter ;

set @initial_max_sp_recursion_depth = @@max_sp_recursion_depth;
set @@max_sp_recursion_depth = 90;

-- select
  -- Error Code: 1424. Recursive stored functions and triggers are not allowed. :(
  -- factorial(5) `factorial 5`;

set @@max_sp_recursion_depth = @initial_max_sp_recursion_depth;


drop table if exists dummy_table_1;

create table if not exists dummy_table_1 (
  col1 int unsigned not null
);

delimiter $$

-- drop function if exists GetRandom;
create function GetRandom() returns int unsigned deterministic
  return round(rand() * 100000) $$

-- drop procedure if exists FillTableWithDummyData;
create procedure FillTableWithDummyData(in count_of_rows int unsigned)
begin
  repeat
    insert into dummy_table_1 values (GetRandom());
    set count_of_rows = count_of_rows - 1;
  until count_of_rows = 0 end repeat;
end $$

delimiter ;

call FillTableWithDummyData(200);

