
# MySQL supports:
#
# Self
# Inner
# Left
# Right
# Cross

# DEMO TABLE for `self join`
/*
CREATE DATABASE IF NOT EXISTS `dbtest0`;
USE `dbtest0`;

DROP TABLE IF EXISTS `employees`;

CREATE TABLE IF NOT EXISTS `employees` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `reportsTo` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`id`) ON DELETE NO ACTION
);

INSERT INTO `employees` (`first_name`, `last_name`, `reportsTo`)
VALUES
    ("Adeeb", "Wilder" , NULL),
    ("Amayah", "Giles" , 1),
    ("Camron", "Rojas" , 1),
    ("Krisha", "Mcdowell" , 1),
    ("Anastasia", "Salgado" , 1),
    ("Holly", "Fuller" , 1),
    ("Emeli", "Coles" , 1),
    ("Kyan", "Quintana" , 1),
    ("Chad", "Griffiths" , 1),
    ("Aayat", "Henson" , 1),
    ("Aasiyah", "Coleman" , 1),
    ("Cassia", "Keeling" , 1),
    ("Christos", "Chandler" , 1),
    ("Terri", "Kaye" , 1),
    ("Belle", "Casey" , 1),
    ("Keanan", "Finney" , 1),
    ("Suhail", "Mccartney" , 1),
    ("Samira", "Gilmour" , 1),
    ("Lana", "Mcfadden" , 1),
    ("Kris", "Lang" , 1);


UPDATE `employees` SET `reportsTo` = 2 WHERE `id` IN (3, 4, 5);

UPDATE `employees` SET `reportsTo` = 6 WHERE `id` IN (7, 8, 9);

# self join

SELECT
    `emp1`.`id` AS `Employee Id`,
    `emp1`.`first_name` AS `Employee first name`,
    `emp1`.`last_name` AS `Employee last name`,
    `emp1`.`reportsTo` AS `Employee reports to`,
    `emp2`.`id` AS `Manager Id`,
    `emp2`.`first_name` AS `Manager first name`,
    `emp2`.`last_name` AS `Manager last name`
FROM
    `employees` AS `emp1`,
    `employees` AS `emp2`
WHERE
    `emp1`.`reportsTo` = `emp2`.`id`
ORDER BY
    `emp1`.`id`
;
*/
# inner join

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