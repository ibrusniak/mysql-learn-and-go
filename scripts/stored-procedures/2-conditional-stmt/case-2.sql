
drop database if exists testdb;
create database testdb;
use testdb;

create temporary table if not exists  debug_data (
  tstamp timestamp default current_timestamp(),
  _val int,
  _comment varchar(200)
);

truncate debug_data;

delimiter $$

create procedure write_debug(in val int, in message varchar(200))
begin
  insert into debug_data (_val, _comment)
  values (val, message);
end$$

create procedure p1(in a int)
begin
  call write_debug(a, 'p1. in');
end$$

create procedure p2(out b int)
begin
  call write_debug(a, 'p2. out');
end$$

create procedure p3(inout c int)
begin
  call write_debug(c, 'p3. inout');
end$$

delimiter ;




