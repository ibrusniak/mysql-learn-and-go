
/******************************************************
* Create training database structure and generates data
* Espesially for man, named 'Long'
******************************************************/

-- DB STRUCTURE

DROP DATABASE IF EXISTS long_db;

CREATE DATABASE long_db DEFAULT CHARACTER SET = utf8mb4;

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

-- DATA

USE long_db;

SET @@foreign_key_checks = 0;

INSERT INTO `countries` (`country`) VALUES
  ('Украина'),
  ('Китай'),
  ('Германия'),
  ('США'),
  ('Турция'),
  ('Румыния');

INSERT INTO `manufacturers` (`brand`, `country_id`) VALUES
  ('Lenovo', 2),
  ('Apple', 4),
  ('Asus', 2),
  ('Dell', 2),
  ('Beko', 5),
  ('Arctic', 6);

INSERT INTO `products` (
  `model`,
  `quantity`,
  `price`,
  `m_id`,
  `summa`)
VALUES
  ('Ноутбук IdeaPad L340-15', 5, 10000, 1, 50000),
  ('Ноутбук ROG Zefurus S', 3, 15000, 3, 15000),
  ('Телефон iPhone 11 Pro', 21, 25000, 2, 525000),
  ('Ноутбук IdeaPad L340-15', 12, 6000, 4, 72000),
  ('Холодильник ', 4, 36000, 5, 144000),
  ('Ноутбук IdeaPad L340-15', 2, 18000, 6, 36000);
  
INSERT INTO `phones` (`phone_number`, `user_id`) VALUES
  ('+380735528402', 1),
  ('+380675577408', 1),
  ('+380976671417', 3),
  ('+380734478412', 5);

INSERT INTO `users` (`name`, `email`, `age`) VALUES
  ('Александр', 'alex@gmail.com', 25),
  ('Владимир', 'vlad@gmail.com', 45),
  ('Любовь', 'lyba@gmail.com', 34),
  ('Андрей', 'andrea@gmail.com', 18),
  ('Александр', 'alex2@gmail.com', 27)
;

INSERT INTO `orders` (`user_id`, `product_id`) VALUES
  (1, 2),
  (1, 3),
  (3, 4),
  (5, 1),
  (4, 1),
  (2, 6),
  (5, 4),
  (3, 6),
  (4, 3)
;

SET @@foreign_key_checks = 1;


