
/**************************************
* Create training database structure
* Espesially for man, named 'Long'
***************************************/

DROP DATABASE IF EXISTS long_db;

CREATE DATABASE long_db;

USE long_db;

CREATE TABLE `users` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `age` TINYINT UNSIGNED,
  CONSTRAINT `user_chk_1` CHECK (`age` > 0 AND `age` < 110)
);

CREATE TABLE `phones` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `phone_number` VARCHAR(15),
  `user_id` INT UNSIGNED,
  CONSTRAINT `phones_fk_1` FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`)
);

CREATE TABLE `countries` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `country` VARCHAR(100) NOT NULL
);

CREATE TABLE `manufacturers` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `brand` VARCHAR(100) NOT NULL,
  `country_id` INT UNSIGNED,
  CONSTRAINT `manufacturers_fk_1` FOREIGN KEY (`country_id`)
  REFERENCES `countries` (`id`)
);

CREATE TABLE `products` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `model` VARCHAR(200) NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  `price` FLOAT NOT NULL,
  `m_id` INT UNSIGNED,
  `summa` FLOAT NOT NULL,
  CONSTRAINT `products_fk_1` FOREIGN KEY (`m_id`)
  REFERENCES `manufacturers` (`id`)
);

CREATE TABLE `orders` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user_id`  INT UNSIGNED NOT NULL,
  `product_id`  INT UNSIGNED NOT NULL,
  CONSTRAINT `orders_fk_1` FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`),
  CONSTRAINT `orders_fk_2` FOREIGN KEY (`product_id`)
  REFERENCES `products` (`id`)
);

