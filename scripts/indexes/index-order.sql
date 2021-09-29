
drop database if exists db223;
create database db223;
use db223;

create table t1 (
  col1 int not null,
  col2 int not null
);

create table t2 like t1;

alter table t1
add index `col1_asc_col2_asc` (col1 asc, col2 asc);

alter table t1
add index `col1_desc_col2_desc` (col1 desc, col2 desc);

alter table t1
add index `col1_asc_col2_desc` (col1 asc, col2 desc);

alter table t1
add index `col1_desc_col2_asc` (col1 desc, col2 asc);

set @@cte_max_recursion_depth = 100000;
insert into t2
with recursive cte (c) as (
  select 1 union all
  select c + 1 from cte 
  where c < 100000)
select round(rand() * 10000),
  round(rand() * 10000) from cte;

insert into t1 select * from t2;

-- without any index
explain
  select * from t2;

-- with indexes, different order
explain
  select * from t1
  order by col1 asc, col2 asc;
  
explain
  select * from t1
  order by col1 desc, col2 desc;
  
explain
  select * from t1
  order by col1 asc, col2 desc;
  
explain
  select * from t1
  order by col1 desc, col2 asc;
  
-- compare
select * from t2
where col1 > 433 and col1 < 9999
and col2 > 777 and col2 < 3000
order by col1 desc, col2 asc;


select * from t1
where col1 > 433 and col1 < 9999
and col2 > 777 and col2 < 3000
order by col1 desc, col2 asc;

