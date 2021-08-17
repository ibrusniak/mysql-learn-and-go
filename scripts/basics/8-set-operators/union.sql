
-- use common table expression
with t1 (a, b) as (
  select 1, 2 union
  select 2, 3 union
  select 3, 4),
t2 (b, c) as (
  select 2, 3 union
  select 3, 4 union
  select 4, 5)
select * from t1 union
select * from t2;

-- use derived query
select * from
    (select 1 a, 2 b union
    select 2, 3 union
    select 3, 4) t1 union
select * from
    (select 2 b, 3 c union
    select 3, 4 union
    select 4, 5) t2;

-- union distinct vs union all
-- distinct (the same as simple 'union')
with
  t10 (ch) as (select 'a' union select 'b' union select 'c'),
  t11 (ch) as (select 'b' union select 'd')
select * from t10 union distinct
select * from t11;

-- all
select * from
(select 'f' as ch union select 'd' union select 'q') t21
union all
select * from
(select 'd' as ch union select 'x' union select 'p') t22;

with
  t100 (ch) as (select 'W' union select 'Q' union select 'F'),
  t200 (ch) as (select 'M' union select 'G'),
  t300 (ch) as (select 'R' union select 'W' union select 'F')
select ch, 't100' `derived table name` from t100 union all
select ch, 't200' from t200 union all
select ch, 't300' from t300
order by ch;

