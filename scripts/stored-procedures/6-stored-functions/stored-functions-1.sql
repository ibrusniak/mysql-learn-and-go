
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



