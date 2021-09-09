
drop database if exists storegames;
create database storegames;
use storegames;

delimiter $$
create procedure do_something()
begin
    select 'first wersion of procedure' `message to user`;
end$$
delimiter ;

call do_something();

-- 'alter' operation

drop procedure do_something;


delimiter $$
create procedure do_something()
begin
    select 'new wersion of procedure' `message to user`;
end$$
delimiter ;

call /* altered */ do_something();


