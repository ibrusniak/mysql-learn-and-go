
USE `classicmodels`;

# SHOW TABLES;

DESCRIBE `employees`;
SELECT * FROM `employees`;
SELECT * FROM `employees` ORDER BY `employeeNumber` DESC;
SELECT * FROM `employees` ORDER BY `employeeNumber` DESC LIMIT 3 OFFSET 2;
