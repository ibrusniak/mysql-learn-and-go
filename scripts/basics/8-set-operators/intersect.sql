
-- emulate INTERSECT operation with join
with
  t1 (ch) as (select 'W' union select 'Q' union select 'D' union select 'D'),
  t2 (ch) as (select 'Q' union select 'D' union select 'F')
select distinct
  *
from t1 inner join t2 using (ch);

-- emulate INTERSECT operation with `IN`
with
  t21 (c) as (select 'a' union select 'b' union select 'a'),
  t22 (c) as (select 'b' union select 'a' union select 'f' union select 'a')
select distinct
  c
from
  t21
where
  c in (select * from t22);


