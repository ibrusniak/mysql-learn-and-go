
# MySQL supports:
#
# Self
# Inner
# Left
# Right
# Cross

# DEMO TABLE for `self join`

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





