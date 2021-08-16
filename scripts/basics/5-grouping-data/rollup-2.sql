
USE dbtest0;

DROP TABLE IF EXISTS r1;

CREATE TABLE r1 (
    col1 VARCHAR(1),
    col2 VARCHAR(2),
    col3 VARCHAR(3),
    col4 INT,
    col5 INT,
    col6 INT
);

INSERT INTO r1 (col1, col2, col3, col4, col5, col6) VALUES
    ('A', 'B', 'C', 1, 1, 1),
    ('A', 'B', 'Z', 1, 1, 1),
    ('A', 'Z', 'X', 1, 1, 1),
    ('V', 'Y', 'Q', 1, 1, 1),
    ('V', 'Y', 'Q', 1, 1, 1),
    ('A', 'B', 'C', 1, 1, 1),
    ('C', 'S', 'Q', 1, 1, 1),
    ('V', 'Z', 'S', 1, 1, 1),
    ('A', 'B', 'C', 1, 1, 1);

SELECT * FROM r1 ORDER BY col1 DESC, col2 DESC, col3 DESC;

SELECT
    col1,
    col2,
    col3,
    SUM(col4),
    SUM(col5),
    SUM(col6)
FROM
    r1
GROUP BY
    col1,
    col2,
    col3
ORDER BY
    col1 DESC,
    col2 DESC,
    col3 DESC;

SELECT
    col1,
    col2,
    col3,
    SUM(col4),
    SUM(col5),
    SUM(col6)
FROM
    r1
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
    col3,
    SUM(col4),
    SUM(col5),
    SUM(col6)
FROM
    r1
GROUP BY
    col1,
    col2,
    col3
WITH ROLLUP
HAVING (col1 IS NULL AND col2 IS NULL AND col3 IS NULL) OR (col1 IS NOT NULL AND col2 IS NOT NULL AND col3 IS NOT NULL)
ORDER BY
    col1 DESC,
    col2 DESC,
    col3 DESC;

