
drop database if exists vd200;
create database vd200;
use vd200;

create table t1 (
    id int unsigned auto_increment primary key,
    column_1 int unsigned not null,
    column_2 int unsigned not null
);

create table t2 like t1;

delimiter $$

create function get_random_int() returns int unsigned
deterministic
    return round(rand() * 100) $$

create procedure load_dummy_data()
begin

    declare _counter int default 1000;
    repeat
        insert into t1 (column_1, column_2) values (get_random_int(), get_random_int());
        insert into t2 (column_1, column_2) values (get_random_int(), get_random_int());
        set _counter = _counter - 1;
    until _counter = 0
    end repeat;
    
end $$

delimiter ;

call load_dummy_data();

select 't1' as _table_name, count(*) as _count from t1
union
select 't2', count(*) from t2;

/****
select count(*) from
    t1 inner join t2
    using (column_1, column_2);
****/

create or replace view inner_join_t1_t2 (
    t1_id,
    t1_col_1,
    t1_col_2,
    t2_id,
    t2_col_1,
    t2_col_2
) as

    select
        t1.id as t1_id,
        t1.column_1 as t1_col_1,
        t1.column_2 as t1_col_2,
        t2.id as t2_id,
        t2.column_1 as t2_col_1,
        t2.column_2 as t2_col_2
    from
        t1 inner join t2
        using (column_1, column_2)
;


select count(*) from inner_join_t1_t2;
select * from inner_join_t1_t2;

create or replace view view_on_view (t1_id, t2_id, col1, col2) as
    select
        t1_id,
        t2_id,
        t1_col_1,
        t1_col_2
    from
        inner_join_t1_t2
    limit 10;
        
show full tables;

select * from view_on_view;

