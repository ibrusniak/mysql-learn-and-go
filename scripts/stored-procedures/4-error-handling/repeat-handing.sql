
drop database if exists repeat_handing;
create database repeat_handing;
use repeat_handing;

delimiter $

create procedure dh1()
begin

  declare timeToInterrupt int default 0;
  declare divider int default 10;
  declare continue handler for sqlstate '99000'
  begin
    select '\'MY_OWN_001\' state occurs...' debug;
    set timeToInterrupt = 1;
  end;
  
  label: loop
    if divider = 0 then
      signal sqlstate '99000' set message_text = 'my own sql state 99000';
    end if;
    if timeToInterrupt = 1 then
      leave label;
    end if;
    set divider = divider - 1;
  end loop;
  
  select 'point 1' debug;
  
end$

call dh1()$

delimiter ;
