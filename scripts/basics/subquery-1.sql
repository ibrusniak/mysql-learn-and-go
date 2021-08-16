
use classicmodels;

select * from employees;
select * from offices where country = 'USA';

select
  *
from
  employees e
where
  e.officeCode in
    (select distinct
    officeCode
    from
    offices
    where
    country = 'USA');

select
  *
from
  employees inner join
  offices using (officeCode)
where
  offices.country = 'USA';
  
select
  *
from
  customers
where
  customers.creditLimit =
    (select
      max(creditLimit)
    from
      customers);
      
select
  *
from
  customers
order by
  creditLimit DESC
limit 1;

select
  *
from
  customers
where
  customers.creditLimit >
  (select
    avg(customers.creditLimit)
  from
    customers)
order by
  customers.creditlimit;

select
  *
from
  customers
where
  customers.customerNumber not in
  (select
    orders.customerNumber
  from
    orders);

select
  max(`lines`) `max`,
  min(`lines`) `min`,
  avg(`lines`) `avg`
from
  (select
    orderNumber,
    count(orderNumber) as `lines`
  from
    orderDetails
  group by
    orderNumber) as lineItems;
  
  
