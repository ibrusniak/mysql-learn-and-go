
# SELECT select_list
# FROM table_name;

DESCRIBE `classicmodels`.`employees`;

# SHOW CREATE TABLE `classicmodels`.`employees`;

SELECT
    `employeeNumber`,
    `reportsTo`,
    `lastName`,
    `firstName`
FROM
    `classicmodels`.`employees`;
    
SELECT
    concat_ws(', ', 'Dog', 'Frog', 'Cat');
    
SELECT
    concat('Cat', 'Dog', 'Frog');

SELECT NOW();

SELECT NOW() - 60;

