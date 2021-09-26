
/**************************************
* Generates sample data for training db 'logn_db'
* Please run script 'create_structure.sql' before this
* to create database and tables structure
* Espesially for man, named 'Long'
***************************************/

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

