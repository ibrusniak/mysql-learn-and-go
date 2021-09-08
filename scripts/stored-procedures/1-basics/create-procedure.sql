
delimiter >>>

>>> drop database if exists testdb
>>> create database testdb
>>> use testdb


>>> select database()


>>> create procedure p1()
begin
    select database();
    select now();
end

>>> call p1
>>> delimiter ()))

create procedure p2(in a int)
begin
    select a;
end
()))

delimiter ;

call p2(200);

