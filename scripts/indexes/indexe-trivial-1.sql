
drop database if exists indexes_test;
create database indexes_test;
use indexes_test;

create table t1 (
  pk tinyint unsigned,
  constraint t1_pk_1 primary key (pk) -- PRI
);

describe t1;

alter table t1
add column
  col1 int unsigned not null;

describe t1;

alter table t1
add constraint t1_un_in_1
unique index (col1); -- UNI

describe t1;

alter table t1
add column
  col2 varchar(50);

alter table t1
add constraint t1_key_in_1
unique key (col2); -- UNI

describe t1;

alter table t1
add column
fk1 tinyint unsigned not null;

set @@foreign_key_checks = 0;
alter table t1
add constraint t1_fk_1
foreign key (fk1) references t2 (id); -- MUL
set @@foreign_key_checks = 1;

describe t1;

alter table t1 drop constraint t1_fk_1;
alter table t1 drop column fk1;

describe t1;



