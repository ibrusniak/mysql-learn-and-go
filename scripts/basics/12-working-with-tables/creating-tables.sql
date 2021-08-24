
create database if not exists creating_tables_experiments;
use creating_tables_experiments;

drop table if exists tempt;

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

