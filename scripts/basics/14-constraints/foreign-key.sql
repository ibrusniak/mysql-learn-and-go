
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


set @@foreign_key_checks = 1;
