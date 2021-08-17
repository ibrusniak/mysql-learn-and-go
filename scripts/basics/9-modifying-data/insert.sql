
create schema if not exists testdb5;
use testdb5;

drop table if exists t1;

create table t1(
  col1 char(1),
  col2 int default 100,
  col3 int auto_increment,
  primary key (col3));

-- common use
insert into t1 (col1, col2, col3)
values
  ('a', 200, null),
  ('b', default, null);

insert into t1 (col1, col2) select 'f', 300;

insert into t1
with t0 (c1, c2, c3) as (select 'g', 3, null)
select * from t0;

-- insert dates
drop table if exists t2;

create table t2(
  d date default '2021-01-01',
  k int not null auto_increment,
  primary key (k));
  
insert into t2 (d) values
  ('2021-08-17'),
  (default),
  (cast('2021-08-18' as date));

insert into t2 (d) values (current_date());

-- insert into select
drop table if exists ta, tb;

create table ta (
  c1 int not null,
  c2 char(1) not null,
  primary key (c1, c2));
  
create table tb (
  c1 int not null,
  c2 char(1) not null);
  
insert into tb values
  (1, 'a'),
  (2, 'b'),
  (3, 'c'),
  (4, 'f');
  
insert into ta (
  c1,
  c2
)
select
  c1,
  c2
from
  tb;

-- SELECT statement as values list

drop table if exists stats;

create table stats (
  val int
);

insert into stats (val)
values (
  (select 4),
  (select 5),
  (select 6)
);


