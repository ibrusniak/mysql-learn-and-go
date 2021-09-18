
drop database if exists signal_demo;
create database signal_demo;
use signal_demo;

delimiter ^^

create procedure sd1(in inp int)
begin

  declare zero_input_parameter condition for sqlstate '99990';
  declare input_parameter_more_than_3 condition for sqlstate '99991';

  declare continue handler for zero_input_parameter
    select 'zero input parameter' debug;
    
  declare continue handler for input_parameter_more_than_3
    select 'input parameter more than 3' debug;

  case
    when inp = 0 then
      signal sqlstate '99990' set message_text = 'input parameter equals zero!';
    when inp > 3 then
      signal sqlstate '99991' set message_text = 'input parameter more than 3!';
    else
      select concat('normal input parameter: ', inp) debug; 
  end case;
  
  select 'end of procedure' debug;
  
end ^^

-- call sd1(1) ^^
-- call sd1(0) ^^
-- call sd1(2) ^^
-- call sd1(3) ^^
-- call sd1(10) ^^

create procedure sd2()
begin

  signal sqlstate '99999' set message_text = 'Hello world', mysql_errno = 9999;

end ^^

-- call sd2() ^^

create procedure inner_p()
begin
  signal sqlstate '99999' set message_text = 'sql state is 99999';
end ^^

create procedure outer_p()
begin

  declare my_condition condition for sqlstate '99999';
  
  declare continue handler for my_condition
  begin
    resignal sqlstate '77777' set message_text = 'debut 1';
  end;

  call inner_p();

  select 'debug 2' debug;

end ^^

call outer_p() ^^

delimiter ;

