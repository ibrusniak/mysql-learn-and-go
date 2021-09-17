
drop database if exists handlers_demo;
create database handlers_demo;
use handlers_demo;

delimiter $$

create procedure to_debug_log(in _debug_message varchar(100))
begin
    create temporary table if not exists debug_log (
        _message_number int unsigned auto_increment primary key,
        _debug_message varchar(100) default ''
    );
    insert into debug_log (_debug_message) values (_debug_message);
end$$

create procedure show_log()
begin
    declare exit handler for 1146
        select 'debug log table is not initialized yet' `err`;
    select * from debug_log;
end$$

create procedure h_demo_3()
begin
    declare exit handler for 1146
    call to_debug_log('1146 occurs. No such table');
    -- declare continue handler for
    -- Error Code: 1146. Table 'handlers_demo.no_such_table' doesn't exist
    select * from no_such_table;
end$$

delimiter ;

call h_demo_3();

call show_log();




-- drop temporary table if exists debug_log;

