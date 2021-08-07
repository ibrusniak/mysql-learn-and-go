
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

SELECT word
FROM
	(SELECT "case" AS `word` UNION
	SELECT "exemplar" UNION
	SELECT "exemplification" UNION
	SELECT "illustration" UNION
	SELECT "instance" UNION
	SELECT "prototype" UNION
	SELECT "representative" UNION
	SELECT "sample") AS `words`

WHERE
	word LIKE '%ion' OR word LIKE '_a%';
    
SELECT word
FROM
	(SELECT 'Why' AS `word` UNION
	SELECT 'do' UNION
	SELECT 'we' UNION
	SELECT 'use' UNION
	SELECT 'it?' UNION
	SELECT 'It' UNION
	SELECT 'is' UNION
	SELECT 'long' UNION
	SELECT 'established' UNION
	SELECT 'fact' UNION
	SELECT 'that' UNION
	SELECT 'reader' UNION
	SELECT 'will' UNION
	SELECT 'be' UNION
	SELECT 'distracted' UNION
	SELECT 'by' UNION
	SELECT 'the' UNION
	SELECT 'readable' UNION
	SELECT 'content' UNION
	SELECT 'of' UNION
	SELECT 'page' UNION
	SELECT 'when') AS `words`
WHERE
	word REGEXP 'b(e|y)' or
	word REGEXP '^.{3}t$';

SELECT
    f_char,
    s_char,
    t_char
FROM
    (SELECT 'A' AS `f_char`, 'B' AS `s_char`, 'Z' AS `t_char` UNION
    SELECT 'A', 'C', 'Q' UNION
    SELECT 'B', 'A', 'X' UNION
    SELECT 'D', 'Z', 'F' UNION
    SELECT 'A', 'C', 'H' UNION
    SELECT 'B', 'Z', 'P' UNION
    SELECT 'B', 'A', 'V' UNION
    SELECT 'W', 'H', 'M'
    ) AS `combination`
WHERE
    (f_char, s_char) IN (('B', 'A'), ('B', 'Z'));


