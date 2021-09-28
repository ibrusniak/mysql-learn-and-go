
drop database if exists testdb2;
create database testdb2;
use testdb2;


create table t1 (
  id int unsigned auto_increment,
  col1 int unsigned,
  col2 int unsigned,
  col3 int unsigned,
  col4 int unsigned,
  primary key (id),
  index (col1),
  index (col2),
  index (col3),
  index (col4)
);

set @count_of_rows = 1000000;
set @@cte_max_recursion_depth = @count_of_rows;
set @max_int_value = 1000000;

insert into t1 (col1, col2, col3, col4)
with recursive cte (counter) as (
  select 1 union all
  select counter + 1
  from cte
  where counter < @count_of_rows)
select
  round(rand() * @max_int_value),
  round(rand() * @max_int_value),
  round(rand() * @max_int_value),
  round(rand() * @max_int_value)
from
  cte;

select * from t1 limit 50, 10;

alter table t1
add column
col5 varchar(250);

delimiter $$
create procedure fill_col5()
begin

  declare done int default 0;
  declare id int unsigned;
  declare my_cursor cursor for
        select id
        from t1
        order by id;
  declare continue handler for not found set done = true;
  
  open my_cursor;
  
  l: loop
    fetch my_cursor into id;
    if done then
      leave l;
    end if;
    update t1 set col5 = concat(cast(col1 as char(15)), '_', cast(col2 as char(15)));
  end loop;
  
  close my_cursor;
  
end $$
delimiter ;

call fill_col5;
drop procedure fill_col5;

select
  col5,
  count(col5)
from t1
  group by col5
having
  count(col5) > 1; -- slower

alter table t1
add index (col5);

select
  col5,
  count(col5)
from t1
  group by col5
having
  count(col5) > 1; -- faster



