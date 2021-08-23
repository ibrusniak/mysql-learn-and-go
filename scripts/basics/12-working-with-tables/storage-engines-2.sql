
drop database if exists merge_engine_test;

create database merge_engine_test;

use merge_engine_test;

create table s1 (
  c1 int not null,
  c2 int not null
) engine = myisam;

create table s2 (
  c1 int not null,
  c2 int not null
) engine = myisam;

set @row_count = 1000;
set @@cte_max_recursion_depth = @row_count;

insert into s1 (c1, c2)
with recursive cte (counter) as (
    select 1
    union all
    select counter + 1
    from cte
    where counter < @row_count
)
select
  round(rand() * 100),
  round(rand() * 100)
from
  cte;

insert into s2 (c1, c2) select c1, c2 from s1;

create table merge_t (
  c1 int not null,
  c2 int not null
) engine = merge union (s1, s2) insert_method = last;

select count(*) from s1;
select count(*) from s2;
select count(*) from merge_t;

