
drop database if exists repeat_handing;
create database repeat_handing;
use repeat_handing;

delimiter $$

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
  
end $$

-- call dh1()$

-- Error number: 1146; Symbol: ER_NO_SUCH_TABLE; SQLSTATE: 42S02
create procedure dh2()
begin
  declare OCCURS_1146, OCCURS_42S02 int default 0;
  declare continue handler for 1146 set OCCURS_1146 = 1;
  declare continue handler for sqlstate '42S02' set OCCURS_42S02 = 1;
  
  select * from no_such_table;
  
  if OCCURS_1146 = 1 then
    select 'OCCURS_1146 = 1' debug;
  end if;
  
  if OCCURS_42S02 = 1 then
    select 'OCCURS_42S02 = 1' debug;
  end if;
  
end $$

call dh2() $$

delimiter ;
