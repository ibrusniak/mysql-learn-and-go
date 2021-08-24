
create database if not exists creating_tables_experiments;
use creating_tables_experiments;

drop table if exists
  tempt,
  t1,
  table_without_indexes,
  table_with_indexes;

create temporary table tempt (
  pk int not null auto_increment primary key,
  c1 int not null,
  c2 int not null,
  c3 int not null,
  c4 int not null
);

set @@cte_max_recursion_depth = 1500;

insert into tempt (c1, c2, c3, c4)
with recursive generator (counter) as (
  select 1 union select counter + 1 from generator where counter < @@cte_max_recursion_depth
)
select round(rand() * 10000), round(rand() * 10000), round(rand() * 10000), round(rand() * 10000)
from generator;

select count(*) from tempt;

truncate tempt;

create table t1 (
  pk int not null auto_increment primary key,
  c1 int not null,
  c2 int default null,
  index (c1),
  index (c2)
);

-- without indexes
create table table_without_indexes (
  c1 int,
  c2 int,
  c3 int,
  c4 int
);

set @@cte_max_recursion_depth = 1000000;

-- insert operation into table without indexes is much
-- more quicker than insert into table with indexes...

insert into table_without_indexes (c1, c2, c3, c4)
with recursive generator (counter) as (
  select 1 union select counter + 1 from generator where counter < @@cte_max_recursion_depth
)
select round(rand() * 10000), round(rand() * 10000), round(rand() * 10000), round(rand() * 10000)
from generator;

create table table_with_indexes (
  c1 int,
  c2 int,
  c3 int,
  c4 int,
  index (c1),
  index (c2),
  index (c3),
  index (c4)
);

insert into table_with_indexes (c1, c2, c3, c4)
with recursive generator (counter) as (
  select 1 union select counter + 1 from generator where counter < @@cte_max_recursion_depth
)
select round(rand() * 10000), round(rand() * 10000), round(rand() * 10000), round(rand() * 10000)
from generator;

-- delete operation comparison
-- the same situation as when create table with and without indexes
-- table with indexex is very slow in delete operation
delete from table_without_indexes limit 100000;
delete from table_with_indexes limit 100000;
