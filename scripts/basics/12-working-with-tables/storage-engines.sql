
create database if not exists sten;
use sten;

drop table if exists
    table_source,
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

create table table_source (
    pk int not null auto_increment primary key,
    c1 int
) engine = innodb;

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

-- generating data

set @row_count = 5000000;
set @@cte_max_recursion_depth = @row_count;

insert into table_source (c1)
with recursive g (a, counter) as (
    select
        round(rand() * 100000),
        1
    union all
    select
        round(rand() * 100000),
        counter + 1
    from
        g
    where
        counter < @row_count
)
select a from g;

insert into t_csv (pk, c1) select c1, c1 from table_source;

set @@max_heap_table_size = 1024 * 1024 * 1024 * 1024 * 10;

insert into t_memory (c1) select c1 from table_source;
truncate t_memory;

select count(*) from t_memory;

