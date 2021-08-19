
create database if not exists replace_test_db;
use replace_test_db;

drop table if exists t1, t1backup;

create table t1 (
    pk int not null auto_increment,
    c1 int,
    c2 int,
    c3 int,
    primary key (pk)
);

insert into t1 (c1, c2, c3)
with recursive cte (a, b, c, counter) as (
    select
        round(rand() * 100),
        round(rand() * 100),
        round(rand() * 100),
        1
    union
    select
        round(rand() * 100),
        round(rand() * 100),
        round(rand() * 100),
        counter + 1
    from
        cte
    where
        counter < 10)
select a, b, c from cte;

-- backup to compare in future
create table t1backup select * from t1;
-- copy from select works without keys (new table does not have the same keys
-- as source table)
alter table t1backup change column pk pk int not null primary key auto_increment;

select * from t1;

replace into t1 (pk, c2, c3) values
    (1, 2, 3),
    (2, 4, 10);
    
replace t1
set
    pk = 5,
    c1 = 500,
    c2 = 500,
    c3 = 500;

replace into t1 select * from t1backup;

-- help replace in mysql cli :)

