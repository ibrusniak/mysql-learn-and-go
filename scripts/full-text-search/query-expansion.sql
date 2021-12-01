
-- use data from classicmodels db

drop database if exists tdb88;
create database tdb88;
use tdb88;

create table t1
like classicmodels.products;

insert into t1
select * from classicmodels.products;

show indexes from t1;

alter table t1
add fulltext (productName);

alter table t1
add fulltext (productLine);

show indexes from t1;

select
	productLine,
    productName
from
	t1
order by
	productLine,
    productName;

-- 1
select productName from t1 where productName like '%1992%';

-- 2
select productName from t1 where match (productName) against ('1992');

-- 3 magic!
select productName from t1
where
	match (productName) against ('1992' with query expansion);

