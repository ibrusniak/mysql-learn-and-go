
drop database if exists choomba_db;
create database choomba_db;
use choomba_db;

delimiter $$

create procedure debug_log(
  in _point tinyint unsigned, in val tinyint unsigned
)
begin
  select _point `debug point`, val `'val' value`;
end$$

create procedure leave_demo_1(in val tinyint unsigned)
label: begin
    if 2 = val
      then
        call debug_log(1, val);
        leave label;
    end if;
    call debug_log(2, val);
end$$

create procedure leave_demo_2()
label_3: begin
    label_2: begin
        label_1: begin
            call debug_log(1, null);
            leave label_2;
        end;
        call debug_log(2, null);
    end;
    call debug_log(3, null);
end$$

create procedure leave_demo_3()
begin
    declare _counter tinyint unsigned default 0;
    declare _result varchar(50) default '';
    label_0: loop
        set _counter = _counter + 1;
        set _result = concat(_result, ' ', _counter);
        if _counter = 10 then
            leave label_0;
        end if;
    end loop;
    select _result;
end$$

delimiter ;

-- call leave_demo_1(2);
-- call leave_demo_1(3);

-- call leave_demo_2();

call leave_demo_3();

