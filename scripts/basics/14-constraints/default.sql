
drop database if exists testdb;
create database testdb;
use testdb;

create table t1 (
  pk int unsigned auto_increment,
  col1 int unsigned default 100,
  col2 datetime not null default now(), -- the same as current_timestamp
  col3 timestamp not null default current_timestamp,
  constraint t1_c1 primary key (pk))
;

describe t1;

insert into t1 (col1, col2)
values
  (default, default),
  (200, default)
;

select * from t1;

alter table t1
add column col0 varchar(50) not null
after pk;

alter table t1
alter column col0
set default 'hello';

describe t1;

alter table t1
alter column col3
drop default;

