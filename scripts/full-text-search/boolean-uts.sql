
drop database if exists fts22;
create database fts22;

use fts22;

create table t1(
    id int unsigned auto_increment,
    c1 varchar(200) not null,
    c2 varchar(200) not null,
    constraint t1_primary_key primary key (id),
    fulltext (c1, c2),
    fulltext (c1),
    fulltext (c2));

delete from t1;

insert into t1 (c1, c2)
select
    productName,
    productLine
from
    classicmodels.products;

select 'distinct c1' as `count`, count(distinct c1) as `table` from t1
union all
select 'distinct c2', count(distinct c2) from t1;

select * from t1;

select
    c1, c2
from
    t1
where
    match (c2)
    against ('Trucks' in boolean mode);
    
select
    c1, c2
from
    t1
where
    match (c2) against ('trucks' in boolean mode) and
    match (c1) against ('Ford' in boolean mode); -- this is great!!!

select * from t1
where
    match (c1) against ('ford,-truck,-mustang' in boolean mode);

