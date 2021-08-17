
-- MINUS operation

with
t1 (ch) as (select 'a' union select 'b' union select 'c'),
t2 (ch) as (select 'b' union select 'c' union select 'd')
select
  ch
from 
  t1 left join t2 using (ch)
where
  t2.ch is null;

