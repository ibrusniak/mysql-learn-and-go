
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

CREATE TABLE IF NOT EXISTS `book` (
  `id` LONG NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `author` LONG NOT NULL,
  `short_description` TEXT DEFAULT 'empty',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`author`) REFERENCES `author` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `author`;
CREATE TABLE IF NOT EXISTS `country`;
CREATE TABLE IF NOT EXISTS `state`;
CREATE TABLE IF NOT EXISTS `city`;
CREATE TABLE IF NOT EXISTS `floor`;
CREATE TABLE IF NOT EXISTS `room`;
CREATE TABLE IF NOT EXISTS `rack`;
CREATE TABLE IF NOT EXISTS `shelf`;

