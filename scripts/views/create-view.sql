
drop database if exists view_demo;
create database view_demo;
use view_demo;

create table t1 (
    col1 tinyint unsigned not null,
    col2 enum (
        'one',
        'two',
        'three',
        'four',
        'five',
        'six',
        'seven',
        'eight'
    ) not null,
    constraint t1_chk1 check (col1 < 8)
);

show tables;
show full tables;

insert into t1 values
    (1, 'one'),
    (2, 'two'),
    (3, 'three')
;

select * from t1;

create or replace view digits (digin, digin_name) as
select
    col1 as digit,
    col2 as digit_name
from
    t1
order by
    col1;

show full tables;

select * from digits
order by digit desc;
;

delete from digits; -- delet from base table t1 !!

select * from digits; -- empty
select * from t1; -- empty! oh no!


/**** Error Code: 1347. 'view_demo.digits' is not BASE TABLE

delimiter $$
create trigger digits_before_deletes
before delete
on digits for each row
begin
    signal sqlstate '99999' set message_text = 'Not allowed to delete from view!';
end $$
delimiter ;

****/

insert into t1 values
    (4, 'four'),
    (5, 'five'),
    (6, 'six');


select * from digits;


