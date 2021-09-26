
drop database if exists indexes_test;
create database indexes_test;
use indexes_test;

create table t1 (
  pk tinyint unsigned,
  constraint t1_pk_1 primary key (pk) -- PRI
);

describe t1;

alter table t1
add column
  col1 int unsigned not null;

describe t1;

alter table t1
add constraint t1_un_in_1
unique index (col1); -- UNI

describe t1;

alter table t1
add column
  col2 varchar(50);

alter table t1
add constraint t1_key_in_1
unique key (col2); -- UNI

describe t1;

alter table t1
add column
fk1 tinyint unsigned not null;

set @@foreign_key_checks = 0;
alter table t1
add constraint t1_fk_1
foreign key (fk1) references t2 (id); -- MUL
set @@foreign_key_checks = 1;

describe t1;

alter table t1 drop constraint t1_fk_1;
alter table t1 drop column fk1;

describe t1;

-- testing select with index and without it

create table table_without_indexed_column (
  column_1 int unsigned not null
);

create table table_with_indexed_column (
  column_1 int unsigned not null,
  index (column_1)
);

set @@cte_max_recursion_depth = 1000001;

insert ignore into
table_with_indexed_column (column_1)
with recursive cte (_counter) as (
  select 1 union all
  select _counter + 1
  from cte where _counter < 1000000)
select
  round(rand() * 1000000) as column_1
from
  cte;

insert into table_without_indexed_column
select column_1 from table_with_indexed_column;

select 'table_with_indexed_column' as _table_name, count(*) as rows_count
from table_with_indexed_column
union all
select 'table_without_indexed_column' as _table_name, count(*) as rows_count
from table_without_indexed_column;

insert into table_without_indexed_column values
  (round(rand() * 1000000));

insert into table_with_indexed_column values
  (round(rand() * 1000000));

select *
from table_with_indexed_column
limit 50000, 10;

delete from table_without_indexed_column; -- faster

delete from table_with_indexed_column; -- slower


