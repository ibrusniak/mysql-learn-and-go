
drop database if exists testdb;
create database testdb;
use testdb;

create temporary table if not exists  debug_log (
  _message_num int unsigned auto_increment primary key,
  _timestamp timestamp default current_timestamp(),
  _val int,
  _comment varchar(200)
);

truncate debug_log;

delimiter $$

create procedure debug_writer(in val int, in message varchar(200))
begin
  insert into debug_log (_val, _comment)
  values (val, message);
end$$

create procedure p1(in a int)
begin
  call debug_writer(a, 'p1. in 1');
  -- outer 'a' is read only because of 'in a'
  set a = a + 150;
  call debug_writer(a, 'p1. in 2');
end$$

create procedure p2(out b int)
begin
  call debug_writer(b, 'p2. out. \'b\' before increment');
  set b = b + 500;
  call debug_writer(b, 'p2. out. \'b\' after increment');
end$$

create procedure p3(inout c int)
begin
  call debug_writer(c, 'p3. inout. \'c\' before increment');
  set c = c + 1000;
  call debug_writer(c, 'p3. inout. \'c\' after increment');
end$$

delimiter ;

set @va = 100;
call debug_writer(@va, '@va initial');
call p1(@va);
call debug_writer(@va, '@va after call p1 (in a)');

set @vb = 200;
call debug_writer(@vb, '@vb initial');
call p2(@vb);
-- initial value of @vb lost inside of 'p2' :(
call debug_writer(@vb, '@vb after call p2 (out b)');

set @vc = 50;
call debug_writer(@vc, '@vc initial');
call p3(@vc);
call debug_writer(@vc, '@vc after call pc (inout c)');


select * from debug_log;


