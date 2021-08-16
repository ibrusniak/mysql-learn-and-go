
CREATE DATABASE IF NOT EXISTS testdb100
DEFAULT CHARACTER SET = utf8mb4;

USE testdb100;

DROP TABLE IF EXISTS grouping1;

CREATE TABLE grouping1 (
    col1 VARCHAR(1),
    col2 VARCHAR(1),
    col3 VARCHAR(1),
    col4 INT,
    col5 INT
) ENGINE = InnoDB;

INSERT INTO grouping1 VALUES
    ('A', 'B', 'C', 1, 1),
    ('A', 'C', 'D', 1, 1),
    ('C', 'D', 'F', 1, 1),
    ('C', 'Z', 'W', 1, 1),
    ('C', 'D', 'Q', 1, 1),
    ('A', 'Q', 'Z', 1, 1),
    ('F', 'D', 'G', 1, 1),
    ('F', 'D', 'G', 1, 1);
    
SELECT
    col1,
    col2,
    col3,
    SUM(col4),
    SUM(col5)
FROM
    grouping1
GROUP BY
    col1,
    col2,
    col3
ORDER BY
    col1,
    col2,
    col3;

SELECT
    col1,
    col2,
    col3,
    SUM(col4),
    SUM(col5),
    GROUPING(col1),
    GROUPING(col2),
    GROUPING(col3)
FROM
    grouping1
GROUP BY
    col1,
    col2,
    col3
WITH ROLLUP
ORDER BY
    col1 DESC,
    col2 DESC,
    col3 DESC;

SELECT
    col1,
    col2,
    SUM(col4)
FROM
    grouping1
GROUP BY
    col1,
    col2
WITH ROLLUP
ORDER BY
    GROUPING(col1) DESC,
    GROUPING(col2) DESC;

SELECT
    col1,
    sum(col5),
    GROUPING(col1)
FROM
    grouping1
GROUP BY
    col1
WITH ROLLUP;

