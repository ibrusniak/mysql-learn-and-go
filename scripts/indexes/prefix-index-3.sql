
use classicmodels;

show tables;

select count(*) from products;

select count(distinct left(productName, 16)) unique_names from products;

create index product_idx_productName
on products(productName(20));

explain
select
    productName,
    buyPrice
from
    products
where
    productName like '1970%';

