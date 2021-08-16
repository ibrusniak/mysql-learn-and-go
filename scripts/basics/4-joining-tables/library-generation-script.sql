
# Self join (one table)
#
# Inner join
# Left join
# Right join
# Cross join

# MySQL does not support FULL OUTER JOIN

# to play with joins i create "library" database
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARSET = utf8mb4;

USE `library`;

SET @@foreign_key_checks = 0;

DROP TABLE IF EXISTS `book`;
DROP TABLE IF EXISTS `author`;
DROP TABLE IF EXISTS `country`;
DROP TABLE IF EXISTS `booklocation`;

CREATE TABLE `book` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `author_id` INT NOT NULL,
    `short_description` TEXT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `author`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `middle_name` VARCHAR(100) DEFAULT NULL,
    `date_of_birth` DATETIME NOT NULL,
    `date_of_death` DATETIME DEFAULT NULL,
    `country_of_birth_id` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`country_of_birth_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `country` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `short_description` TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `booklocation` (
    `book_id` INT NOT NULL,
    `floor_number` INT NOT NULL,
    `rack_number` INT NOT NULL,
    `shelf_number` INT NOT NULL,
    FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
);

SET @@foreign_key_checks = 1;
