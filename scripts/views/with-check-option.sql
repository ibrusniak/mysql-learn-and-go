
drop database if exists vt300;
create database vt300;
use vt300;

create table t1 (
    col1 int unsigned not null,
    col3 varchar(20)
);

delimiter $$
create procedure pr0()
begin
    declare _c tinyint default 20;
    declare _varchar varchar(20) default '';
    declare _next_rand int;
    repeat
        set _next_rand = round(rand() * 10);
        if _next_rand >= 5 then
            set _varchar = '5_or_more';
        else
            set _varchar = 'less_then_5';
        end if;
        insert into t1 values
            (_next_rand, _varchar);
        set _c = _c - 1;
    until _c = 0
    end repeat;
end $$
delimiter ;

call pr0;

select * from t1;

create or replace view v0 (_int, _str) as
    select
        col1,
        col3
    from
        t1;

select * from v0;

create or replace view v1 (_int, _str) as
    select
        col1,
        col3
    from
        t1
    where
        col3 = '5_or_more';

select * from v1;

-- without check i can insert 'invalid' row through view
insert into v1 values (6, 'less_than_5'); -- case 1
select * from t1; -- look to base table

create view v2 (_int, _str) as
    select col1, col3
    from t1
    where
        col3 = '5_or_more'
    with check option; -- now i can not insert invalid value (as in case 1)


-- Error Code: 1369. CHECK OPTION failed 'vt300.v2'
-- insert into v2 values (8, 'less_than_five');

insert into v2 values (9, '5_or_more'); -- normal

select * from t1;


