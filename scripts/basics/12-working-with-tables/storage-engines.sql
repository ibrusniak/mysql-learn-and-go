
create database if not exists sten;
use sten;

drop table if exists
    t_innodb,
    t_myisam,
    t_merge,
    t_memory,
    t_archive,
    t_csv,
    t_federated;

-- create tables with various engines

-- engines
-- myisam
-- innodb
-- merge
-- memory (heap)
-- archive
-- csv
-- federated

create table t_innodb (
    pk int not null auto_increment primary key,
    c1 int
) engine = innodb;

create table t_myisam (
    pk int not null auto_increment primary key,
    c1 int
) engine = myisam;

create table t_merge (
    pk int not null auto_increment primary key,
    c1 int
) engine = merge;

create table t_memory (
    pk int not null auto_increment primary key,
    c1 int
) engine = memory;

create table t_archive (
    pk int not null auto_increment primary key,
    c1 int
) engine = archive;

create table t_csv (
    pk int not null,
    c1 int not null
) engine = csv;

create table t_federated (
    pk int not null auto_increment primary key,
    c1 int
) engine = federated;

