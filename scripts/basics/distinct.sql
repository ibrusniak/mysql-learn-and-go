
SELECT
    f, s, t
FROM
    (SELECT 'A' AS f, 'B' AS s, 'Z' AS t UNION
    SELECT 'A', 'C', 'Q' UNION
    SELECT 'B', 'A', 'X' UNION
    SELECT 'D', 'Z', 'F' UNION
    SELECT 'A', 'C', 'H' UNION
    SELECT 'B', 'Z', 'P' UNION
    SELECT 'B', 'A', 'V' UNION
    SELECT 'W', 'H', 'M'
    ) AS combination
ORDER BY
  f, s, t;
  
SELECT DISTINCT
    f, s
FROM
    (SELECT 'A' AS f, 'B' AS s, 'Z' AS t UNION
    SELECT 'A', 'C', 'Q' UNION
    SELECT 'B', 'A', 'X' UNION
    SELECT 'D', 'Z', 'F' UNION
    SELECT 'A', 'C', 'H' UNION
    SELECT 'B', 'Z', 'P' UNION
    SELECT 'B', 'A', 'V' UNION
    SELECT 'W', 'H', 'M'
    ) AS combination
ORDER BY
  f, s, t;

SELECT DISTINCT
  `number`
FROM
  (SELECT 2 AS `number` UNION ALL
  SELECT 3 UNION ALL
  SELECT 3 UNION ALL
  SELECT NULL UNION ALL
  SELECT 4 UNION ALL
  SELECT 5 UNION ALL
  SELECT 4 UNION ALL
  SELECT NULL) AS `numbers`
ORDER BY `number`;

