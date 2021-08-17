
create database if not exists test_delete_truncate;
use test_delete_truncate;

drop table if exists t0, t1, t2;

create table t0 (
  pk int not null auto_increment,
  c1 int not null,
  c2 int not null,
  c3 int not null,
  c4 int not null,
  primary key (pk));

set @@cte_max_recursion_depth = 50000000;
set @max_int_value = 1000000;
set @max_counter_value = 50000000;


insert into t0 (c1, c2, c3, c4)
with recursive data_generator (v1, v2, v3, v4, counter) as (
  select
    round(rand() * @max_int_value),
    round(rand() * @max_int_value),
    round(rand() * @max_int_value),
    round(rand() * @max_int_value),
    1
  union
  select
    round(rand() * @max_int_value),
    round(rand() * @max_int_value),
    round(rand() * @max_int_value),
    round(rand() * @max_int_value),
    counter + 1
  from
    data_generator
  where
    counter < @max_counter_value)
select v1, v2, v3, v4 from data_generator;

create table t1 select * from t0;

insert into t1 select * from t0;
insert into t1 select * from t0;
insert into t1 select * from t0;

truncate t0;
