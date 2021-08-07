
# zero as FALSE non-zero as TRUE

SELECT 'TRUE' AS `expression`, TRUE AS `result` UNION ALL
SELECT 'FALSE', FALSE UNION ALL
SELECT 'TRUE = 1', TRUE = 1 UNION ALL
SELECT 'TRUE = 0', TRUE = 0 UNION ALL
SELECT 'FALSE = 1', FALSE = 1 UNION ALL
SELECT 'FALSE = 0', FALSE = 0
;

# logical operator AND returs 1 (MySQL equivalent of Boolean TRUE) if both operands
# are not 0 and not NULL. It returns 0 (MySQL equivalent of Boolean FALSE) if one or
# both operands is zero. Otherwise it returns NULL.

SELECT
  TRUE,
  FALSE,
  NULL,
  TRUE AND TRUE,
  TRUE AND FALSE,
  FALSE AND FALSE,
  FALSE AND TRUE,
  1 AND TRUE,
  "" AND TRUE,
  "f" AND TRUE,
  100 AND TRUE,
  "100" AND TRUE,
  '' AND TRUE,
  200 AND 100,
  NULL AND NULL,
  TRUE AND NULL,
  FALSE AND NULL;

# let us show tables of compinations of TRUE, FALSE, NULL and other zero and non-zero values

SELECT
  'TRUE' AS `'AND' OPERATOR`,
  TRUE AND TRUE AS 'TRUE',
  TRUE AND FALSE AS 'FALSE',
  TRUE AND NULL AS 'NULL'
UNION
SELECT
  'FALSE',
  FALSE AND TRUE AS 'TRUE',
  FALSE AND FALSE AS 'FALSE',
  FALSE AND NULL AS 'NULL'
UNION
SELECT
  'NULL',
  NULL AND TRUE AS 'TRUE',
  NULL AND FALSE AS 'FALSE',
  NULL AND NULL AS 'NULL'
;
  
