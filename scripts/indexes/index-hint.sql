
drop database if exists ddd24;
create database ddd24;
use ddd24;


create table t1 (
    pk int unsigned auto_increment primary key,
    c1 int unsigned not null,
    c2 int unsigned not null,
    c3 int unsigned not null,
    index idx1 (c1),
    index idx2 (c1, c2)
);

show indexes from t1; -- Cardinality = 0

explain select * from t1 where c1 = 4000 or (c2 between 2000 and 3000); -- Using where

explain select * from t1 use index (idx1) where c1 = 4000 or (c2 between 2000 and 3000); -- Using where

