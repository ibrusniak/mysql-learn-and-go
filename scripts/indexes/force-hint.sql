
drop database if exists ddd234;
create database ddd234;
use ddd234;

delimiter $$

create procedure init_data(rows_count int, in max_value bigint unsigned)
begin

    set @@cte_max_recursion_depth = rows_count;

    create table t1 (
        pk int unsigned auto_increment primary key,
        c1 bigint unsigned not null,
        c2 bigint unsigned not null,
        c3 bigint unsigned not null);
    
    create table t2 like t1;
    
    alter table t1
    add index t1_idx_c1 (c1);
    
    alter table t1
    add index t1_idx_c1c2 (c1, c2);
    
    alter table t1
    add index t1_idx_c1c2c3 (c1, c2, c3);
    
    insert into t1 (c1, c2, c3)
    with recursive int_generator(c) as (
        select 1 union all
        select c + 1
        from int_generator
        where c < rows_count
    )
    select
        floor(1 + rand() * (max_value - 1)),
        floor(1 + rand() * (max_value - 1)),
        floor(1 + rand() * (max_value - 1))
    from
        int_generator;
    
    insert into t2 (c1, c2, c3)
    select c1, c2, c3 from t1;
    
end $$

delimiter ;

-- 2M rows for each table.
-- First table with indexes
call init_data(2000000, 18446744073709551615);

-- Using where; Using index
explain select * from t1
where
    c1 between 3395043883962759680 and 9202088678586944512
    and
    c2 < 5030194680180726784;

-- Using where
explain select * from t1
use index (t1_idx_c1)
where
    c1 between 3395043883962759680 and 9202088678586944512
    and
    c2 < 5030194680180726784;

-- Using index condition; Using where
explain select * from t1
force index (t1_idx_c1)
where
    c1 between 3395043883962759680 and 9202088678586944512
    and
    c2 < 5030194680180726784;


