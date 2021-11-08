
-- use sample database 'classicmodels'
-- (project_root\scripts\initialization-scripts)

use classicmodels;

show tables;

describe products;
show indexes from products;
show create table products;

/*
alter table
    products
add fulltext (productLine);
*/

select count(*) from products;

select productName, productLine from products
order by productLine, productName;

select
    productName,
    productLine
from
    products
where
    match(productLine)
    against('classic,vintage'); -- 'classic' or 'vintage'

/*
alter table
    products
add fulltext (productName);
*/

select
    productName,
    productLine
from
    products
where
    match (productName)
    against ('1932, ford'); -- names contain '1932' and/or 'ford'


