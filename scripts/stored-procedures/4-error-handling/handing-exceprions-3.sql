
drop database if exists handlers_demo;
create database handlers_demo;
use handlers_demo;

delimiter $$

create procedure handl_demo_1()
begin
    declare continue handler for sqlexception, sqlwarning
    begin
        select 'point 1' debug;
    end;
    select * from no_such_table;
    select 'point 2' debug;
end$$

-- ER_NO_SUCH_TABLE 1146
create procedure handl_demo_2()
begin
    declare MY_OWN_CONDITION_ER_NO_SUCH_TABLE condition for 1146; -- 1146 - real error number for 'table not found'
    declare continue handler for MY_OWN_CONDITION_ER_NO_SUCH_TABLE
    begin
        select 'point 3' debug;
    end;
    select * from no_such_table;
    select 'point 4' debug;
end$$

delimiter ;

-- call handl_demo_1();
call handl_demo_2();


