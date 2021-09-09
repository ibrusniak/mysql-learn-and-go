
drop database if exists adb;
drop database if exists bdb;

create database adb;
create database bdb;

use adb;

delimiter $$

create procedure _proc()
begin
    declare current_db_name varchar(100);
    set current_db_name = database();
    select concat('i am called from \'', current_db_name , '\' database');
end$$

delimiter ;

use bdb;

call adb._proc(); -- i am called from 'adb' database


