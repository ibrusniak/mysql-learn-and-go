
/*
	http://www.mysqltutorial.org
    MySQL Sample Database classicmodels
    Initialization script
*/

DROP DATABASE IF EXISTS `classicmodels`;

CREATE DATABASE IF NOT EXISTS `classicmodels` DEFAULT CHARACTER SET utf8mb4;

USE `classicmodels`;

# This need to create tables with foreign keys on other tables which does not exist yet
# Save initial value of system variable '@@foreign_key_checks' to local variable, named
# '@original_foreign_key_checks'
SET @original_foreign_key_checks=@@foreign_key_checks;
SET @@foreign_key_checks=0;

CREATE TABLE `customers` (
	`customerNumber` int NOT NULL,
    `customerName` varchar(50) NOT NULL,
    `contactFirstName` varchar(50) NOT NULL,
    `contactLastName` varchar(50) NOT NULL,
    `phone` varchar(50) NOT NULL,
    `addressLine1` varchar(50) NOT NULL,
    `addressLine2` varchar(50) DEFAULT NULL,
    `city` varchar(50) NOT NULL,
    `state` varchar(50) DEFAULT NULL,
    `postalCode` varchar(15) DEFAULT NULL,
    `country` varchar(50) NOT NULL,
    `salesRepEmployeeNumber` int DEFAULT NULL,
    `creditLimit` decimal(10,2) DEFAULT NULL,
    PRIMARY KEY (`customerNumber`),
    KEY `salesRepEmployeeNumber` (`salesRepEmployeeNumber`),
    CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `employees` (
	`employeeNumber` int NOT NULL,
    `lastName` varchar(50) NOT NULL,
    `firstName` varchar(50) NOT NULL,
    `extension` varchar(10) NOT NULL,
    `email` varchar(100) NOT NULL,
    `officeCode` varchar(10) NOT NULL,
    `reportsTo` int NOT NULL,
    `jobTitle` varchar(50) NOT NULL,
    PRIMARY KEY (`employeeNumber`),
    KEY `reprostTo` (`reportsTo`),
    KEY `officeCode` (`officeCode`),
    CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
    CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `offices` (
	`officeCode` varchar(10) NOT NULL,
    `city` varchar(50) NOT NULL,
    `phone` varchar(50) NOT NULL,
    `addressLine1` varchar(50) NOT NULL,
    `addressLine2` varchar(50) DEFAULT NULL,
    `state` varchar(50) DEFAULT NULL,
    `country` varchar(50) NOT NULL,
    `postalCode` varchar(15) NOT NULL,
    `territory` varchar(10) NOT NULL,
    PRIMARY KEY (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# Set initial value back to environment variable
SET @@foreign_key_checks=@original_foreign_key_checks;





