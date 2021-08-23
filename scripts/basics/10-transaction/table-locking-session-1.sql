
create database if not exists locktest;
use locktest;

drop table if exists t1;

create table t1 (
    pk int not null auto_increment primary key,
    c1 int
);

select connection_id();

insert into t1 (c1) values (1), (2), (3);

select * from t1;

lock tables t1 read;

lock tables t1 write;

insert into t1 (c1) values (4);

unlock tables;

show processlist;
