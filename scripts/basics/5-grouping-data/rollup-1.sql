
USE dbtest0;

DROP TABLE IF EXISTS r0;

CREATE TABLE r0 (
    c0 CHAR(1),
    c1 CHAR(1),
    c2 INT
);

INSERT INTO r0 (c0, c1, c2) VALUES
    ('A', 'B', 1),
    ('A', 'C', 1),
    ('A', 'C', 1),
    ('B', 'B', 1),
    ('B', 'D', 1),
    ('B', 'D', 1);

SELECT c0, c1, c2 FROM r0 GROUP BY c0, c1, c2 ORDER BY c0, c1;

SELECT c0, c1 FROM r0 GROUP BY c0, c1 ORDER BY c0, c1;

SELECT c0, c1, c2 FROM r0 ORDER BY c0, c1, c2;

SELECT c0, c1, SUM(c2) FROM r0 GROUP BY c0, c1 ORDER BY c0, c1;

SELECT c0, c1, SUM(c2) FROM r0 GROUP BY c0, c1 ORDER BY c0, c1;

SELECT c0, c1, SUM(c2) FROM r0 GROUP BY c0, c1 WITH ROLLUP;

SELECT c0, SUM(c2) FROM r0 GROUP BY c0 WITH ROLLUP;
