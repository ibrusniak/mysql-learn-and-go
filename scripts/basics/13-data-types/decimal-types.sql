
drop schema if exists decimal_types;
create schema decimal_types;
use decimal_types;

create table _dec (
  pk int not null auto_increment primary key,
  c1 dec unsigned,
  c2 dec(2) unsigned,
  c3 dec(5, 3) signed,
  c4 decimal(15, 2) unsigned,
  c5 numeric(65, 30),
  c6 fixed
);

insert into _dec (c1, c2, c3, c4, c5, c6) values (
  1/3,
  1/3,
  1/3,
  1/3,
  1/3,
  1/3
);

select
  c1 `dec unsigned`,
  c2 `dec(2) unsigned`,
  c3 `dec(2, 3) signed`,
  c4 `decimal(15, 2) unsigned`,
  c5 `numeric(65, 30)`,
  c6 `fixed`
from
  _dec;

alter table _dec add column salary decimal(19, 4) not null first;

insert into _dec (salary) values (125000 / 12); # 10416.6667 (Generally Accepted Accounting Principles)

select * from _dec;


