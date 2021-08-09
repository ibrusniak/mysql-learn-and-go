
SELECT
  f, s, t, ID
FROM
  (SELECT 'A' AS `f`, 'B' AS `s`, 'C' AS `t`, 1 AS `ID` UNION ALL
    SELECT 'B', 'C', 'D', 2 UNION ALL
    SELECT 'B', 'D', 'D', 3 UNION ALL
    SELECT 'B', 'A', 'D', 4 UNION ALL
    SELECT 'B', 'E', 'D', 5 UNION ALL
    SELECT 'F', 'C', 'Z', 6 UNION ALL
    SELECT 'B', 'Z', 'D', 7 UNION ALL
    SELECT 'B', 'Q', 'D', 8 UNION ALL
    SELECT 'B', 'C', 'D', 9 UNION ALL
    SELECT 'B', 'D', 'D', 10 ) AS `combinations`
WHERE
  (f, s) IN (('B', 'Q'), ('B', 'D'))
ORDER BY
  ID;
  
SELECT
  f, s, t, ID
FROM
  (SELECT 'A' AS `f`, 'B' AS `s`, 'C' AS `t`, 1 AS `ID` UNION ALL
    SELECT 'B', 'C', 'D', 2 UNION ALL
    SELECT 'B', 'D', 'D', 3 UNION ALL
    SELECT 'B', 'A', 'D', 4 UNION ALL
    SELECT 'B', 'E', 'D', 5 UNION ALL
    SELECT 'F', 'C', 'Z', 6 UNION ALL
    SELECT 'B', 'Z', 'D', 7 UNION ALL
    SELECT 'B', 'Q', 'D', 8 UNION ALL
    SELECT 'B', 'C', 'D', 9 UNION ALL
    SELECT 'B', 'D', 'D', 10 ) AS `combinations`
WHERE
  # (f, s) IN (('B', 'Q'), ('B', 'D'));
  (f = 'B') AND (s = 'Q') OR
  (f = 'B') AND (s = 'D')
ORDER BY
  ID; # could be the same result
  
# NULL and IN-operator

SELECT
  `number`
FROM
  (SELECT 100 AS `number` UNION SELECT 200) AS nums
WHERE
  `number` IN (200, 400, NULL); # OK! BECAUSE `TRUE OR NULL` works!
                                # [200 = 200 OR 200 = 400 OR 200 = NULL] => [1 OR 0 OR NULL] => [1 OR NULL] => 1 !
                                
SELECT
  smth
FROM
  (SELECT NULL AS smth UNION ALL SELECT 2) AS s
WHERE
  smth IN (NULL); # EMPTY response because NULL = NULL is NULL. NULL can not be compare with null
  
SELECT 2 AS num
WHERE
  (NULL IN (2, 3, NULL)) IS NULL;
  
SELECT NULL IN (2, 3);
SELECT 0 IN (2, 3, NULL);
SELECT NULL IN (1, 2, 3, NULL);


