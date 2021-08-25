
drop database if exists data_types;
create database if not exists data_types;
use data_types;

create table int_1 (
  pk int unsigned not null auto_increment,
  c1 int,
  primary key (pk)
);

insert into int_1 values (100, 20);
insert into int_1 (c1) values (21);
insert into int_1 values (300, 22);
insert into int_1 (c1) values (23);
insert into int_1 values (1, 24);
insert into int_1 (c1) values (25);

select * from int_1;

create table int_2 like int_1;

-- warning
-- 1681 Integer display width is deprecated and will be removed in a future release.
alter table int_2 change column c1 c1 int(4) unsigned;

-- warning
-- 1681 The ZEROFILL attribute is deprecated and will be removed in a future release.
-- Use the LPAD function to zero-pad numbers, or store the formatted numbers in a CHAR column.
alter table int_2 change column c1 c1 int zerofill;
