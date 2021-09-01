
drop database if exists testdb;
create database testdb;
use testdb;

create table t1 (
    pk int unsigned auto_increment,
    c1 int not null,
    c2 int not null,
    constraint t1c1 unique(c1),
    constraint t1c2 primary key (pk)
);

create table crm_users (
    id int unsigned auto_increment,
    email varchar(150) not null,
    constraint crm_users_c1 primary key (id),
    constraint crm_users_c2 unique (email)
);

create table indextest (
    pk int unsigned auto_increment primary key,
    col1 varchar(100) not null,
    col2 tinyint unsigned not null,
    constraint indextest_col1 unique (col1),
    constraint indextest_col2 unique (col2)
);

show index from indextest;

drop index `indextest_col2` on indextest;

show index from indextest;

alter table indextest
drop index
    `indextest_col1`;
    
show index from indextest;

alter table indextest
add constraint `indextest_col_3`
unique (col1);

alter table indextest
drop constraint `indextest_col_3`;

alter table indextest
add constraint `indextest3`
unique (col1);

drop table if exists t2;

create table t2 (
    col1 int
);

alter table t2
change column col1 pk int unsigned auto_increment primary key;

alter table t2
add column
    email varchar(150) not null
after
    pk;

alter table t2
add constraint
unique (email);

