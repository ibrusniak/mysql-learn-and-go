
drop database if exists testdb;
create database testdb;
use testdb;

-- NOT NULL

create table t1 (
  pk int auto_increment primary key,
  nullable int,
  notnullable int not null
);

insert into t1 (notnullable) values
  (10), (2), (3), (5)
;

select * from t1;

-- Error Code: 1364. Field 'notnullable'
-- doesn't have a default value
insert into t1 (nullable) values
  (3), (4), (5)
;

insert ignore t1 (nullable) values (111);

select * from t1;

create table t2 (
  c1 int,
  c2 int,
  c3 int
);

alter table
  t2
change column
  c1 c1 int not null
;

describe t2;

alter table
  t2
change column
  c1 c1 int;

show create table t2;

-- PRIMARY KEY

create table orders (
  created datetime not null,
  customer int unsigned not null,
  primary key (created, customer)
);

create table orderitems (
  created datetime not null,
  customer int unsigned not null,
  line_number smallint unsigned,
  product int unsigned,
  foreign key (created, customer) references orders (created, customer)
);


