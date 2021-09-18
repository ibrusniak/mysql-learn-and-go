
drop database if exists cursor_demo;
create database cursor_demo;
use cursor_demo;

delimiter $$

create procedure create_bulk_data_table()
begin
  
  -- Error Code: 1050. Table 't1' already exists
  declare exit handler for 1050 begin /* do nothing, just exit procedure */ end;
  
  create table t1 (
    pk int unsigned auto_increment primary key,
    col1 int unsigned default 0
  );
  
end $$

create procedure clean_bulk_data_table()
begin

  -- ERROR 1146 (42S02): Table 'cursor_demo.t1' doesn't exist
  declare exit handler for 1146
  begin
    -- create new empty table 't1' if not exists yet
    call create_bulk_data_table();
  end;

  truncate t1;

end $$

create procedure bulk_data_generator(in _row_count int unsigned)
begin

  declare
    ERR_MESSAGE_TO_LARGE_PARAMETER varchar(200)
    default concat('To large value of input parameter \'_row_count\' - ', _row_count);

  declare continue handler for 1146
  begin
    call create_bulk_data_table();
    set @@max_sp_recursion_depth = 1;
    call bulk_data_generator(_row_count); -- recursive call
  end;
  
  if _row_count > 50 then
    signal sqlstate 'MY001' set message_text = ERR_MESSAGE_TO_LARGE_PARAMETER;
  end if;
  
  repeat
    insert into t1 (col1) values (round(rand() * 100000));
    set _row_count = _row_count - 1;
    until _row_count = 0
  end repeat;
  
end $$

call bulk_data_generator(10) $$
-- call bulk_data_generator(52) $$ -- testing

-- call create_bulk_data_table() $$
-- call create_bulk_data_table() $$

-- call clean_bulk_data_table() $$

create procedure use_cursor_1()
begin

  declare end_reached int default 0;

  declare var1 int;

  declare my_cursor cursor for
    select col1 from t1;

  declare continue handler for not found
    set end_reached = 1;

  open my_cursor;
  
  label1: loop
    fetch my_cursor into var1;
    if end_reached = 1 then
      select 'debug point 1' debug;
      close my_cursor;
      leave label1;
    end if;
  end loop;
  
  select var1;

end $$

call use_cursor_1() $$



