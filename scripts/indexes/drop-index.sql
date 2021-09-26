
drop database if exists db53;
create database db53;
use db53;


create table t1 (
  id int unsigned primary key,
  c int unsigned
);

create table t2 (
  id int unsigned,
  c1 int unsigned,
  c2 int unsigned,
  t1_id int unsigned,
  constraint constr_1 foreign key (t1_id) references t1 (id)
);

create unique index t1_idx_1 on t1 (c);

create index t2_idx_1 on t2 (c1, c2);

show indexes from t1;
show indexes from t2;

describe t1;
describe t2;

drop index t2_idx_1 on t2;
-- drop index `PRIMARY` on t2; -- Error Code: 1091. Can't DROP 'PRIMARY'; check that column/key exists

alter table t2
drop constraint constr_1;

show indexes from t2;


create table t3 (
  pk int primary key
);

drop index `primary` on t3;

