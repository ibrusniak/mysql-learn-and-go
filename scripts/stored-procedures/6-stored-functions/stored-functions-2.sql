
drop database if exists func_demos;
create database func_demos;
use func_demos;

-- set global log_bin_trust_function_creators = 0;

delimiter $$

create function Func1(val int unsigned)
returns int unsigned deterministic
  return val * round(rand() * 1000) $$

delimiter ;

select
  Func1(20),
  Func1(20),
  Func1(20),
  Func1(20),
  Func1(20),
  Func1(20);

show function status where db = database();

drop function if exists Func1;

delimiter $$

create function FFF1() returns int deterministic
begin
  declare ret int;
  select 5 into ret;
  return ret;
end $$

delimiter ;

show function status like 'F___'


