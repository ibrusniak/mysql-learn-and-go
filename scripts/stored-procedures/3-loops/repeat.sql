
drop database if exists choomba_db;
create database choomba_db;
use choomba_db;

delimiter $$

create procedure repeat_demo()
begin
  declare result varchar(200) default '';
  declare counter tinyint unsigned default 0;
  declare _separator varchar(2) default '';
  declare iterations tinyint default 20;
  
  label_1: repeat
    set counter = counter + 1;
    /*
    if counter = iterations then set _separator = '';
    else set _separator = ', '
    end if;
    */
    case
      when counter = iterations then set _separator = '';
      else set _separator = ', ';
    end case;
    set result = concat(result, counter, _separator);
    until counter = iterations
  end repeat label_1;
  
  select result;
end$$

delimiter ;

call repeat_demo();


