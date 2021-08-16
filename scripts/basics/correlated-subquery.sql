
# A correlated subquery is evaluated
# once for each row in the outer query.

use classicmodels;

select
  productName,
  productVendor,
  buyPrice
from
  products p1
where buyPrice > 
  (select
    avg(buyPrice)
  from
    products
  where
    products.productLine = p1.productLine)
order by
  buyPrice;

