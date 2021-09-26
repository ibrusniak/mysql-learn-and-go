
drop database if exists db204;
create database db204;
use db204;

create table t1 (
  col1 int not null,
  col2 int not null,
  col_pk int not null primary key,
  index (col1, col2)
);

create table t2 (
  col1 int
);

create index t2_idx_1 on t2 (col1);

alter table t2 add column
  col2 int unique;

alter table t2 add column
  col3 int;
  
alter table t2 add column
  col4 int;
  
create index t2_idx_2 on t2 (col3, col4);

describe t2;

drop index t2_idx_1 on t2;

describe t2;

explain
select * from t2;

show indexes from t2;




