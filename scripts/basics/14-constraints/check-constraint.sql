
drop database if exists testdb;
create database testdb;
use testdb;

-- column constraints

create table t1 (
  pk int unsigned auto_increment,
  col1 int not null,
  col2 varchar(20) not null,
  constraint t1_pk1 primary key (pk),
  constraint t1_chk1 check (col1 > 100 and col1 < 200),
  constraint t2_chk2 check (col2 like 'hello%')
);

insert into t1 (col1, col2)
values
  (150, 'hello world');

create table t2 (
  col1 int not null,
  constraint t2_c1 check (col1 > 100) not enforced,
  constraint t2_c2 unique index (col1)
);

insert into t2
values
  (120),
  (60);

-- table constraints

set @@foreign_key_checks = 0;

create table t3 (
  part_id int unsigned not null,
  price int unsigned not null,
  cost int unsigned not null,
  constraint t3_c1 foreign key (part_id) references parts (id),
  constraint t3_c2 check (price > 0),
  constraint t3_c3 check (cost > 0),
  constraint t3_c4 check (price > cost) -- table constraints
);

set @@foreign_key_checks = 1;

