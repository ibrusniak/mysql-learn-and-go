
drop database if exists testdb;
create database testdb;
use testdb;

create table temporal (c1 date);

insert into
  temporal
values
  ('0001-01-01'),
  ('999-01-01'),
  ('0000-00-00'),
  ('1000-01-01'),
  ('23-01-01'), -- 2023
  ('70-01-01'), -- 1970
  ('1995-01-01'),
  ('2018-05-19')
;

select * from temporal;
select * from temporal where c1 is null;
select * from temporal where c1 >= cast(now() as date);

-- cast
select
  cast('-1-1-1' as date), -- null
  cast(150 as date), -- null
  cast('hello world' as date), -- null
  cast('99999-99-99' as date), -- null
  cast("20200101" as date), -- 2020-01-01
  cast('2020$01$01' as date), -- 2020-01-01
  cast('2020/01/01' as date), -- 2020-01-01
  cast('2020 01 01 ' as date), -- null
  cast('2020/01/01 23:59:55' as date), -- 2020-01-01
  cast('2020/01/01 00/00/00' as date) -- 2020-01-01
;

-- comparison
select
  cast('0000-00-00' as date) is null,
  cast('0000-00-00' as date) is not null,
  cast('0000-00-00' as date)
    between cast('0000-00-00' as date) and cast('0000-00-00' as date);
;

select
  '2021-01-02' between '2021-01-02' and '2021-01-02',
  '2021-01-01' between '2021-01-02' and '2021-01-02';

select
  now(),
  cast(now() as date),
  cast(now() as datetime);

select
  '2021-01-01',
  '2021-01-01' + 1, -- 2022
  cast('20221-01-01' as date) + 1, -- null
  adddate('2021-01-01', interval 1 day), -- 2021-01-02
  adddate('2021-01-01', interval 1 year), -- 2022-01-01
  adddate('2021-01-01', interval -2 month) -- 2020-11-01
;

select
  date_format('2021-10-17', '%y/%m/%d');
  
select
  cast(now() as date),
  round(datediff(cast(now() as date), '1986-03-23') / 365) `my age`;

-- and many other interesting functions to work with 'date' type
  