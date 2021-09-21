
drop database if exists triggersdemo;
create database triggersdemo;
use triggersdemo;


create table t1(
    pk int unsigned not null auto_increment,
    col1 int unsigned,
    col2 varchar(50) not null,
    constraint t1_pk primary key (pk),
    constraint t1_ch1 check (char_length(col2) >= 2)
);

insert ignore into t1 (col1, col2)
values
    (20, 'dfdfdffdffd'),
    (10, 'ddd'),
    (4, 's'); -- 3819 Check constraint 't1_ch1' is violated.

    
-- select * from t1;

create table t2 (
    pk int unsigned auto_increment primary key,
    col1 int unsigned,
    col2 varchar(50)
);

set @_count = 0;

delimiter $$

create trigger my_first_trigger
before insert
on t2 for each row
begin
    set @_count = @_count + 1;
end $$

delimiter ;

insert into t2 (col1, col2)
values
    (20, 'fff'),
    (30, 'sss'),
    (40, '444');

select * from t2;

select @_count;  -- 3 for each inserted row
