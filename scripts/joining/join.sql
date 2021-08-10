
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

CREATE TABLE `book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `author_id` INT NOT NULL,
  `short_description` TEXT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
);

/*
CREATE TABLE IF NOT EXISTS `author`;
CREATE TABLE IF NOT EXISTS `country`;
CREATE TABLE IF NOT EXISTS `state`;
CREATE TABLE IF NOT EXISTS `city`;
CREATE TABLE IF NOT EXISTS `floor`;
CREATE TABLE IF NOT EXISTS `room`;
CREATE TABLE IF NOT EXISTS `rack`;
CREATE TABLE IF NOT EXISTS `shelf`;
*/

SET @@foreign_key_checks = 1;
