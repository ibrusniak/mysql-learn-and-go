
create database if not exists test1;

use test1;

drop tables if exists t1, t2;

create table t1 (
  pk int not null auto_increment,
  c int,
  primary key (pk)
);

create table t2 (
  pk int not null auto_increment,
  c int,
  fk int not null,
  primary key (pk),
  foreign key (fk) references t1 (pk) on delete cascade
);

insert into t1 (pk, c) values
  (100, 1), (200, 2), (300, 3);
  
insert into t2 (c, fk) values
  (400, 100), (200, 300);
  
delete from t1 where pk = 300;

USE information_schema;

