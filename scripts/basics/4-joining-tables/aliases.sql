
# aliases can not be used in WHERE clause, because
# MySQL evaluates the WHERE clause earlier than SELECT clause

SELECT
  CONCAT_WS(', ', 'John', 'Doe') AS `Full name`;
  
SELECT
  Sub_querry.`Full name`,
  Sub_querry.Field,
  Sub_querry.`Date of birth`
FROM
  (SELECT
    CONCAT_WS(',', 'Peter', 'Pen') AS `Full name`,
    FIELD(2, 2, 3, 5) AS Field,
    CAST('1986-02-23' AS DATE) AS 'Date of birth') AS `Sub_querry`;

SELECT
  CAST('1990-12-31 23:59:59' AS DATETIME) AS `some date`
UNION
SELECT
  CAST('1991-01-01 00:00:00' AS DATETIME)
ORDER BY
  `some date` DESC;
  
SELECT 2 AS `some number`
UNION ALL
  SELECT 3
UNION ALL
  SELECT 4;
# WHERE - no way to use WHERE clause, because i not have a table alias
# `Some number` > 3; # Error Code: 1054. Unknown column 'Some number' in 'where clause'

# Error Code: 1052. Column 'number' in field list is ambiguous

SELECT
  tab1.`number` AS tab1number,
  `string1`,
  tab2.`number` AS tab2number,
  `string2`
FROM
(SELECT
  5 AS `number`,
  'str2' AS `string1`) AS tab1 INNER JOIN
(SELECT
  10 AS `number`,
  'str2' AS `string2`) AS tab2 ON tab1.`string1` = tab2.`string2`;
  