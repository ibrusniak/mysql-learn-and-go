
/*
    http://www.mysqltutorial.org
    MySQL Sample Database classicmodels
    Initialization script
*/

DROP DATABASE IF EXISTS `classicmodels`;

CREATE DATABASE IF NOT EXISTS `classicmodels` DEFAULT CHARACTER SET UTF8MB4;

USE `classicmodels`;

# This need to create tables with foreign keys on other tables which does not exist yet
# Save initial value of system variable '@@foreign_key_checks' to local variable, named
# '@original_foreign_key_checks'
SET @original_foreign_key_checks=@@foreign_key_checks;
SET @@foreign_key_checks=0;

CREATE TABLE `customers` (
    `customerNumber` INT NOT NULL,
    `customerName` VARCHAR(50) NOT NULL,
    `contactFirstName` VARCHAR(50) NOT NULL,
    `contactLastName` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `addressLine1` VARCHAR(50) NOT NULL,
    `addressLine2` VARCHAR(50) DEFAULT NULL,
    `city` VARCHAR(50) NOT NULL,
    `state` VARCHAR(50) DEFAULT NULL,
    `postalCode` VARCHAR(15) DEFAULT NULL,
    `country` VARCHAR(50) NOT NULL,
    `salesRepEmployeeNumber` INT DEFAULT NULL,
    `creditLimit` DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (`customerNumber`),
    KEY `salesRepEmployeeNumber` (`salesRepEmployeeNumber`),
    CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `employees` (
    `employeeNumber` INT NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `firstName` VARCHAR(50) NOT NULL,
    `extension` VARCHAR(10) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `officeCode` VARCHAR(10) NOT NULL,
    `reportsTo` INT NOT NULL,
    `jobTitle` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`employeeNumber`),
    KEY `reprostTo` (`reportsTo`),
    KEY `officeCode` (`officeCode`),
    CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
    CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `offices` (
    `officeCode` VARCHAR(10) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `addressLine1` VARCHAR(50) NOT NULL,
    `addressLine2` VARCHAR(50) DEFAULT NULL,
    `state` VARCHAR(50) DEFAULT NULL,
    `country` VARCHAR(50) NOT NULL,
    `postalCode` VARCHAR(15) NOT NULL,
    `territory` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`officeCode`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `orderdetails` (
    `orderNumber` INT NOT NULL,
    `productCode` VARCHAR(15) NOT NULL,
    `quantityOrdered` INT NOT NULL,
    `priceEach` DECIMAL(10,2) NOT NULL,
    `orderLineNumber` SMALLINT NOT NULL,
    PRIMARY KEY (`orderNumber`, `productCode`),
    KEY `productCode` (`productCode`),
    CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`),
    CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `orders` (
    `orderNumber` INT NOT NULL,
    `orderDate` DATE NOT NULL,
    `requiredDate` DATE NOT NULL,
    `shippedDate` DATE DEFAULT NULL,
    `status` VARCHAR(15) NOT NULL,
    `comments` TEXT,
    `customerNumber` INT NOT NULL,
    PRIMARY KEY (`orderNumber`),
    KEY `customerNumber` (`customerNumber`),
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `payments` (
    `customerNumber` INT NOT NULL,
    `checkNumber` VARCHAR(50) NOT NULL,
    `paymentDate` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`customerNumber`, `checkNumber`),
    CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
) ENGINE INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `productlines` (
    `productLine` VARCHAR(50) NOT NULL,
    `textDescription` VARCHAR(4000) DEFAULT NULL,
    `htmlDescription` MEDIUMTEXT,
    `image` MEDIUMBLOB,
    PRIMARY KEY (`productLine`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `products` (
    `productCode` VARCHAR(15) NOT NULL,
    `productName` VARCHAR(70) NOT NULL,
    `productLine` VARCHAR(50) NOT NULL,
    `productScale` VARCHAR(10) NOT NULL,
    `productVendor` VARCHAR(50) NOT NULL,
    `productDescription` TEXT NOT NULL,
    `quantityInStock` SMALLINT NOT NULL,
    `buyPrice` DECIMAL(10,2) NOT NULL,
    `MSRP` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`productCode`),
    KEY `productLine` (`productLine`),
    CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

# Set initial value back to environment variable
SET @@foreign_key_checks=@original_foreign_key_checks;





