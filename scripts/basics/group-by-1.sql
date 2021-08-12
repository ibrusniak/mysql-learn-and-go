
USE classicmodels;

SELECT
    orderNumber `ORDER`,
    SUM(quantityOrdered * priceEach) `TOTAL`
FROM
    orderdetails
GROUP BY
    orderNumber
ORDER BY
    orderNumber;

SELECT
    YEAR(orderDate) `Year`,
    MONTH(orderDate) `Month`,
    COUNT(orderNumber) `Count of orders`
FROM
    orders
GROUP BY
    YEAR(orderDate),
    MONTH(orderDate)
ORDER BY
    YEAR(orderDate),
    MONTH(orderDate);

SELECT
    o.customerNumber `customer`,
    SUM(d.priceEach * d.quantityOrdered) `total`
FROM
    orders o
    INNER JOIN orderDetails d
    USING(orderNumber)
GROUP BY
    `customer`
HAVING
    `total` > 40000
ORDER BY
    `total`;

SELECT
    state
FROM
    customers
ORDER BY
    state;

# These two queries returns the same result

SELECT
    DISTINCT state
FROM
    customers
ORDER BY
    state;

SELECT
    state
FROM
    customers
GROUP BY
    state
ORDER BY
    state;
