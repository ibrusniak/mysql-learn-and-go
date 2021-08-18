
create database if not exists test2;

use test2;

drop tables if exists child_table_1, child_table_2, parent_table;

-- create tables

set @@foreign_key_checks = 0;

create table parent_table (
  pk int not null auto_increment,
  c1 int not null,
  c2 int not null,
  c3 int not null,
  fk1 int not null,
  fk2 int not null,
  primary key (pk),
  foreign key (fk1) references child_table_1 (pk) on delete cascade,
  foreign key (fk2) references child_table_2 (pk) on delete cascade
);

create table child_table_1 (
  pk int not null auto_increment,
  c1 int not null,
  c2 int not null,
  primary key (pk)
);

create table child_table_2 (
  pk int not null auto_increment,
  c1 int not null,
  c2 int not null,
  primary key (pk)
);

set @@foreign_key_checks = 1;

-- generate sample data

set @row_count = 5000000;
set @@cte_max_recursion_depth = @row_count;

insert into child_table_1 (c1, c2)
with recursive data_generator (a, b, counter) as (
  select
    round(rand() * 1000),
    round(rand() * 1000),
    1
  union
  select
    round(rand() * 1000),
    round(rand() * 1000),
    counter + 1 from data_generator
  where
    counter < @row_count
)
select a, b from data_generator;

insert into child_table_2 (c1, c2) select c1, c2 from child_table_1;

insert into parent_table (c1, c2, c3, fk1, fk2)
with data_from_both_child_tables (a, b, c, fk1, fk2) as (
  select
    round(rand() * 1000),
    round(rand() * 1000),
    round(rand() * 1000),
    child_table_1.pk,
    child_table_2.pk
  from
    -- keys in both tables begins from 1
    child_table_1 inner join child_table_2 using (pk)
)
select a, b, c, fk1, fk2
from data_from_both_child_tables;

set @@cte_max_recursion_depth = 1000;

-- try `delete` and `truncate`

delete from child_table_1 limit 10;
delete from child_table_2 limit 10;

-- Error Code: 1701. Cannot truncate a table referenced in a foreign key constraint
-- (`test2`.`parent_table`, CONSTRAINT `parent_table_ibfk_2`)
truncate child_table_2;

delete from child_table_2;
