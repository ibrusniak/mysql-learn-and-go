

CREATE DATABASE IF NOT EXISTS `dbtest0`;

USE `dbtest0`;

DROP TABLE IF EXISTS `is_null_special_cases`;

CREATE TABLE `is_null_special_cases` (
	`id` INT AUTO_INCREMENT,
    `date` DATE NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `is_null_special_cases` (`date`)
VALUES
	('0000-00-00'),
    ('1990-01-01'),
    ('2021-09-08');

# CASE 1. IS null works in WHERE clause with empry date, but not works in SELECT clause

SELECT
	`date` IS NULL # does not work (`empty date value` IS NULL = FALSE)
FROM
	`is_null_special_cases`;

SELECT
	*
FROM
	`is_null_special_cases`
WHERE
	`date` IS NULL; # work (`empty date value` IS NULL)

# CASE 2. IF set variable @@sql_auto_is_null to TRUE (1)...

SET @@sql_auto_is_null = 1;

INSERT INTO `is_null_special_cases` (`date`)
VALUES
	('3031-02-15');

SET @@sql_auto_is_null = 1;

INSERT INTO `is_null_special_cases` (`date`)
VALUES
    ('2024-12-05');
    
SELECT
	*
FROM
	`is_null_special_cases`;

SELECT
	*
FROM
	`is_null_special_cases`
WHERE
	id IS NULL;

SET @@sql_auto_is_null = 0;



