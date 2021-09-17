
drop database if exists testdb;
create database testdb;
use testdb;

delimiter $$

create procedure signal_demo_1()
begin
    signal sqlstate '01146';
end$$

create procedure signal_emiter()
begin
    -- Error number: 1146; Symbol: ER_NO_SUCH_TABLE; SQLSTATE: 42S02
    signal sqlstate '42S02'
        set message_text = 'no such table///', mysql_errno = 1146;
end$$

create procedure signal_handler()
begin
    declare continue handler for 1146
    select 'debug poing 0';
    declare continue handler for sqlexception
    select 'debug poing 1';
    call signal_emiter();
    select 'debug poing 2';
end$$

delimiter ;

-- 0 row(s) affected, 1 warning(s): 1642 Unhandled user-defined warning condition
-- call signal_demo_1();

call signal_handler();

