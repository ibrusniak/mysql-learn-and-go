
USE `classicmodels`;

# SHOW TABLES;

DESCRIBE `employees`;
SELECT * FROM `employees`;
SELECT * FROM `employees` ORDER BY `employeeNumber` DESC;
SELECT * FROM `employees` ORDER BY `employeeNumber` DESC LIMIT 3 OFFSET 2;

SELECT
	orderNumber,
    status
FROM
	orders
# ORDER BY FIELD(status, (SELECT DISTINCT status FROM orders) AS statusesList); # does not work. FIELD() is native function
ORDER BY FIELD(status,
	'In Process',
    'On Hold',
    'Cancelled',
    'Resolved',
    'Disputed',
    'Shipped');

# In MySQL, NULL comes before non-NULL values. Therefore, when you the ORDER BY clause with the ASC option,
# NULL appear first in the result

SELECT 2 AS someValue UNION ALL
SELECT 8 UNION ALL
SELECT 'STRING1' UNION ALL
SELECT TRUE UNION ALL
SELECT FALSE UNION ALL
SELECT NULL UNION ALL
SELECT 'STRING2'
ORDER BY someValue;


SELECT `date`
FROM
	(SELECT CAST('2021-08-09 23:59:59' AS DATETIME) AS `date` UNION ALL
    SELECT CAST('2021-09-09 00:00:00' AS DATETIME) UNION ALL
    SELECT CAST('2021-09-09' AS DATETIME) UNION ALL
    SELECT CAST('2021-09-09 00:00:01' AS DATETIME) UNION ALL
    SELECT DATE('2021-09-09 00:00:01') UNION ALL
    SELECT TIME('2021-09-09 00:00:01')) AS T
ORDER BY
	`date`;



