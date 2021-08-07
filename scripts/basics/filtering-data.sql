
# In MySQL, a predicate is a Boolean expression that evaluates to TRUE, FALSE, of UNKNOWN
# Besides the SELECT statement, you can use the WHERE clause in the UPDATE or DELETE statement to
# specify which rows to update or delete

# FROM -> WHERE -> SELECT -> ORDER BY

SELECT `field`
FROM
	(SELECT NULL AS `field` UNION ALL
	SELECT 1 UNION
	SELECT 2) AS `someTable`
WHERE `field` IS NOT NULL
ORDER BY `field` DESC
LIMIT 2;


SELECT
	orderNumber,
	orderDate
FROM
	`classicmodels`.`orders`
ORDER BY
	orderDate DESC;

SELECT
	orderNumber,
    orderDate
FROM
	`classicmodels`.`orders`
ORDER BY
	orderDate DESC
LIMIT 5;

SELECT
	lastName,
    firstName,
    jobTitle,
    officeCode
FROM
	`classicmodels`.`employees`
WHERE
	jobTitle = 'Sales Rep'
ORDER BY FIELD(jobTitle,
	'President',
    'Sales Rep',
    'Sales Manager (NA)',
    'Sale Manager (EMEA)',
    'Sales Manager (APAC)',
    'VP Sales', 'VP Marketing');

SELECT
	officeCode,
    city
FROM
	`classicmodels`.`offices`
WHERE
	TRUE OR NULL;
    
SELECT 1 AS `number` WHERE TRUE;
SELECT 1 AS `number` WHERE NULL;
SELECT 1 AS `number` WHERE TRUE OR NULL;
SELECT 1 AS `number` WHERE TRUE AND NULL;

