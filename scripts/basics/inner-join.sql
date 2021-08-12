
CREATE DATABASE IF NOT EXISTS `dbtest0`;

USE dbtest0;

DROP TABLE IF EXISTS T1;
DROP TABLE IF EXISTS T2;

CREATE TABLE T1 (
    id INT,
    color VARCHAR(10)
);

CREATE TABLE T2 (
    id INT,
    color VARCHAR(10)
);

INSERT INTO T1 (id, color)
VALUES
    (1, 'green'),
    (2, 'red'),
    (3, 'blue'),
    (NULL, 'magenta'),
    (NULL, 'pink'),
    (NULL, NULL),
    (NULL, NULL); 
    
INSERT INTO T2 (id, color)
VALUES
    (1, 'green'),
    (2, 'red'),
    (3, 'blue'),
    (NULL, 'magenta'),
    (NULL, 'pink'),
    (NULL, NULL),
    (NULL, NULL); 

SELECT * FROM T1, T2;                           # 7 * 7 = 49 rows selected
SELECT * FROM T1 INNER JOIN T2 ON TRUE;         # 49 rows

SELECT * FROM T1 INNER JOIN T2 ON FALSE;                                # empty set 
SELECT * FROM T1 INNER JOIN T2 ON 0;                                    # empty set 
SELECT * FROM T1 INNER JOIN T2 ON '';                                   # empty set 
SELECT * FROM T1 INNER JOIN T2 ON "";                                   # empty set 
SELECT * FROM T1 INNER JOIN T2 ON CAST('0000-00-00' AS DATE);           # empty set 
SELECT * FROM T1 INNER JOIN T2 ON NULL;                                 # empty set 

SELECT * FROM t1 INNER JOIN t2 USING(color, id); # ONLTY 3 ROWS. Because null can not be compare with true
SELECT * FROM t1 INNER JOIN t2 on (t1.id = t2.id) or (t2.id = 2);
