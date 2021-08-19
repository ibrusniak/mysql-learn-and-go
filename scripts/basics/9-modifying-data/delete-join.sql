
create database if not exists test2;
use test2;
drop table if exists t1, t2, t1_backup;

create table t1 (
    pk int not null auto_increment,
    c1 int not null,
    primary key (pk)
);

create table t2 (
    pk int not null auto_increment,
    c1 int not null,
    primary key (pk)
);

create table t1_backup (
    pk int not null auto_increment,
    c1 int not null,
    primary key (pk)
);

set @row_count = 30;
set @max_random = 10;

-- genereting distinct data (c1) for t1
insert into t1 (c1)
with recursive data_generator (num, counter) as (
    select
        round(rand() *  @max_random),
        1
    union
    select
        round(rand() *  @max_random),
        counter + 1
    from
        data_generator
    where
        counter < @row_count
)
select distinct num from data_generator;

-- genereting distinct data (c1) for t2
insert into t2 (c1)
with recursive data_generator (num, counter) as (
    select
        round(rand() *  @max_random),
        1
    union
    select
        round(rand() *  @max_random),
        counter + 1
    from
        data_generator
    where
        counter < @row_count
)
select distinct num from data_generator;

-- backup of t1 for second experiment
insert into t1_backup select * from t1;

-- initial stat
select
    (select count(*) from t1) `t1 count`,
    (select count(*) from t2) `t2 count`,
    (select count(*) from t1 inner join t2 on t1.c1 = t2.c1) `rows from t1 and t2 with matching c1 value`;


-- experiment 1. will delete only from t1
delete t1
from
    t1 inner join t2
    on t1.c1 = t2.c1;

-- t1 count = t1 initial - matching rows
-- t2 count = initial
select
    (select count(*) from t1) `t1 count`,
    (select count(*) from t2) `t2 count`,
    (select count(*) from t1 inner join t2 on t1.c1 = t2.c1) `rows from t1 and t2 with matching c1 value`;

-- restore t1 from backup
truncate t1;
insert into t1 select * from t1_backup;

-- will delete from both tables
delete t1, t2
from
    t1 inner join t2
    on t1.c1 = t2.c1;

-- t1 count = t1 initial - matching rows
-- t2 count = t2 initial - matching rows
select
    (select count(*) from t1) `t1 count`,
    (select count(*) from t2) `t2 count`,
    (select count(*) from t1 inner join t2 on t1.c1 = t2.c1) `rows from t1 and t2 with matching c1 value`;


