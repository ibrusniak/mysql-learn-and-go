
drop database if exists testdb;
create database testdb;
use testdb;

delimiter $$

create procedure p1(in a int, inout b int, out c int)
begin end $$

create function f1(a int, b int) returns int deterministic
  return 0 $$

create definer = _unknown function f2() returns int deterministic
  return 2 $$

create definer = `user` procedure p2()
begin end $$

create definer = `fake_user` procedure p3()
sql security invoker
  select 'it works, because invoker has privileges!' msg $$

delimiter ;

-- show procedure status where db = database();
-- show function status where db = database();

select
  i.definer,
  i.routine_name,
  i.routine_type
from
  information_schema.routines i
where
  i.routine_schema = database();

-- Error Code: 1370. execute command denied
-- to user 'user'@'%' for routine 'testdb.p2'
-- call p2();

-- Error Code: 1449. The user specified
-- as a definer ('_unknown'@'%') does not exist
-- select f2();

call p3();
