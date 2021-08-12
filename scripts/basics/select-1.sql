
SELECT
    100 AS `int`,
    'c' AS `char`,
    'string s' AS `string`,
    "one more" AS `one more string`,
    2 + 5 / 3 AS `number`;

SELECT
    NULL AS `NULL representation`,
    TRUE AS 'TRUE representation',
    FALSE AS "FALSE representation";

# TERNARY LOGIC!

SELECT 'TERNARIUS LOGIC. NULL, TRUE, FALSE' AS 'BELOW YOU CAN SEE';

SELECT
    NULL AS 'AND',
    NULL AND NULL AS `NULL`,
    TRUE AND NULL AS `TRUE`,
    FALSE AND NULL AS `FALSE`;
    
SELECT
    NULL AS 'OR',
    NULL OR NULL AS `NULL`,
    TRUE OR NULL AS `TRUE`,
    FALSE OR NULL AS `FALSE`;
    
SELECT
    '' AS 'NOT',
    NOT NULL AS `NULL`,
    NOT TRUE AS `TRUE`,
    NOT FALSE AS `FALSE`;
    
SELECT
    "STR1" + "STR2" AS "CONCATENATION"; # 0 - int value

SELECT
    @@SQL_MODE AS '@@SQL_MODE';
    