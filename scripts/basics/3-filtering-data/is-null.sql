
SELECT
    4 IS NULL,
    4 IS NOT NULL,
    1/0 IS NULL,
    FIELD(2, 3, 4),
    FIELD(2, 3, 4) IS NULL;
    
SELECT
    CAST('0000-00-00' AS DATE);
#### test ####

DROP DATABASE IF EXISTS `test-empty-date-is-null`;

CREATE DATABASE `test-empty-date-is-null`;

CREATE TABLE `test-empty-date-is-null`.`test-table` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `test-empty-date-is-null`.`test-table` (`date`) VALUES
 ('0000-00-00'),
 ('2021-08-09'),
 ('1960-10-10');
 
SELECT 
    `id`,
    `date`,
    `date` IS NULL
FROM
    `test-empty-date-is-null`.`test-table`;

SELECT
    *
FROM
    `test-empty-date-is-null`.`test-table` AS tab
WHERE
    tab.`date` IS NULL;

DROP DATABASE IF EXISTS `test-empty-date-is-null`;
