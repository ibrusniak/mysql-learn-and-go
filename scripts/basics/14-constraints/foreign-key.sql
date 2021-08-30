
drop database if exists testdb;
create database testdb;
use testdb;

set @@foreign_key_checks = 0;

create table t4 (
    pk int auto_increment,
    c1 int not null,
    primary key (pk),
    constraint t4_c1 foreign key (c1) references t1 (c1)
);

create table t3 (
    pk int auto_increment,
    c1 int not null,
    primary key (pk),
    constraint t3_c1 foreign key (c1) references t1 (c2)
);

create table t2 (
    pk int auto_increment,
    c1 int not null,
    primary key (pk),
    constraint t2_c1 foreign key (c1) references t1 (c3)
);

create table t1 (
    pk int auto_increment,
    c1 int not null,
    c2 int not null,
    c3 int not null,
    index (c1),
    index (c2),
    index (c3),
    constraint t1_pk primary key (pk)
);

-- `one to many`
create table t_parent (
    pk int primary key auto_increment,
    c1 int
);

create table t_child (
    pk int primary key auto_increment,
    c1 int,
    t_parent_pk int,
    constraint t_child_pk foreign key (t_parent_pk) references t_parent (pk)
);

alter table t_child
change column
c1 ch1_c1 int;

insert into t_parent (c1)
values
    (100), (200), (300)
;

insert into t_child (ch1_c1, t_parent_pk)
values
    ((select round(rand() * 1000)), 100),
    ((select round(rand() * 1000)), 100),
    ((select round(rand() * 1000)), 100),
    ((select round(rand() * 1000)), 300),
    ((select round(rand() * 1000)), 300),
    ((select round(rand() * 1000)), 100),
    ((select round(rand() * 1000)), 100),
    ((select round(rand() * 1000)), 100)
;

select
    t_parent.pk `parent primary key`,
    t_parent.c1 `parent c1`,
    t_child.pk `child primary key`,
    t_child.t_parent_pk `child foreign key`,
    t_child.ch1_c1 `child c1`
from
    t_parent inner join t_child
    on t_parent.c1 = t_child.t_parent_pk;

set @@foreign_key_checks = 1;
