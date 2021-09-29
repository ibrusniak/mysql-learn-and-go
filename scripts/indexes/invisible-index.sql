
drop database if exists db22;
create database db22;
use db22;

/* ...you can make an index invisible to see if it has an impact
 to the performance and mark the index visible again if it does. */

create table tab (
  c1 int unsigned,
  c2 int unsigned,
  c3 int unsigned,
  c4 int unsigned,
  c5 int unsigned
);

alter table tab
add constraint primary key (c1, c2);

alter table tab
add index (c3) invisible;

alter table tab
add index (c4) visible;

-- 1
show indexes from tab;

alter table tab
alter index c4 invisible;

-- 2
show indexes from tab;

alter table tab
drop index c4;

alter table tab
drop primary key;

-- 3
show indexes from tab;

select @@optimizer_switch;

