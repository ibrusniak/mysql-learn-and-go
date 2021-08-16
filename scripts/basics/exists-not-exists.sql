
select exists (select 1);

select not exists (select null);

select 5 where exists (select 1);

select
    customerNumber,
    customerName
from
    customers c1
where
    exists (
        select
            orderNumber,
            sum(priceEach * quantityOrdered)
        from
            orderdetails
                inner join
            orders
                using(orderNumber)
        where
            customerNumber = c1.customerNumber
        group by
            orderNumber
        having
            sum(priceEach * quantityOrdered) > 60000
    );
