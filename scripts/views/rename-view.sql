
drop database if exists rename_view_test;
create database rename_view_test;
use rename_view_test;

create view random_nums (rn) as
  with recursive _generator (_counter) as (
    select 0 as _counter union all
    select _counter + 1 from _generator
    where _counter < 10
  )
  select round(rand() * 1000) from _generator;
  
select * from random_nums;

-- Error Code: 1347. 'rename_view_test.random_nums' is not BASE TABLE
-- create table if not exists t1 like random_nums;

create table t1 (col1 int unsigned not null);

insert into t1 select * from random_nums;

rename table random_nums to rnd_nums;

show create view rnd_nums;

select * from rnd_nums limit 3;

