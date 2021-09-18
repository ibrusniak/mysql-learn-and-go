
drop database if exists repeat_handing;
create database repeat_handing;
use repeat_handing;

delimiter &&

create procedure my_own_named_sqlstate_demo()
begin

  declare My_own_named_condition condition for sqlstate '42S02'; -- 42S02 - 1146 - no such table
  
  declare continue handler for My_own_named_condition
    select 'My_own_named_condition occurs' Message;
    
  select * from nonono;

  select 'End of procedure' Message;

end &&

call my_own_named_sqlstate_demo() &&

delimiter ;
