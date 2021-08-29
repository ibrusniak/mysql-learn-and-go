
drop database if exists testdb;
create database testdb;
use testdb;

create table t1 (
  pk int primary key auto_increment,
  en enum('one', 'two', 'three') not null
);

insert ignore into t1 (en)
values
  ('one'),
  ('four');

insert into t1 (en) values
  (1);

-- get enum list

select
  column_type
from
  information_schema.columns
where
  table_name = 't1' and column_name = 'en';


