
create database if not exists testdb5;
use testdb5;

drop table if exists t0;

create table t0 (
  pk int not null auto_increment,
  c1 int not null default 0,
  c2 varchar(10),
  primary key (pk));
  
insert into t0 (c1, c2) values
  (1, 'a'),
  (2, 'b'),
  -- ((select 3, 'g')),
  (4, 'q');
  
insert into t0 (c1, c2) values (
  (select 2),
  (select 'f')
);

update t0 set
  -- every row will be affected
  c2 = 'g';

-- two rows at the end of table will be affected (if pk sorted ascend)
update t0 set
  c2 = 'updated'
order by
  pk desc
limit 2;

-- select replace ('some string with miteke', 'miteke', 'mistake');

-- select round(rand() * 100);

drop table if exists rndnums;
create table rndnums (
  num int not null
);

delete from rndnums;

insert into rndnums (num)
  (with recursive generator (num, counter) as (
    select round(rand() * 10), 1 union
    select round(rand() * 10), counter + 1 from generator where counter < 100
  )
  select num from generator);

-- something crazy
with recursive generator (num, counter) as (
    select round(rand() * 10), 1 union
    select round(rand() * 10), counter + 1 from generator where counter < 50)
update rndnums set num = (select num from generator limit 1) limit 1;


