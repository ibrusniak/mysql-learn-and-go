
drop database if exists testdb;
create database testdb;
use testdb;

-- self-referencing key

set @@foreign_key_checks = 0;

create table sr0 (
  pk int auto_increment,
  fk int,
  constraint const1 primary key (pk),
  constraint const2 foreign key (fk) references sr0 (pk)
);

insert into sr0 (pk, fk)
values
  (100, 100),
  (500, 200),
  (300, 200);

-- hierarchical categories of products
create table product_categories (
  `id` int unsigned auto_increment,
  `title` varchar(150) not null,
  `parent_category_id` int unsigned,
  constraint `product_categories_constraint_1` primary key (`id`),
  constraint `product_categories_constraint_2` foreign key (`parent_category_id`) references product_categories (`id`)
);

insert into product_categories (id, title, parent_category_id) -- root category
values
  (1, 'root category', null);  


insert into product_categories (id, title, parent_category_id) -- first level
values
  (2, 'Fashion', 1),
  (3, 'Books', 1),
  (4, 'Electronics', 1),
  (5, 'Collectibles', 1),
  (6, 'Home & Garden', 1),
  (7, 'Sporting Goods', 1),
  (8, 'Toys & Hobbies', 1),
  (9, 'Health & Beauty', 1),  
  (10, 'Others', 1)
;

insert into product_categories (title, parent_category_id) -- second level
values
  ("Women's Dresses- Women's Clothing", 2),
  ("Women's Tops- Women's Clothing", 2),
  ("Women's Intimates & Sleepwear- Women's Clothing", 2)
;

insert into product_categories (title, parent_category_id) -- second level
values
  ("Computer Components & Parts- Computers, Tablets & Network Hardware", 4),
  ("Laptops & Netbooks- Computers, Tablets & Network Hardware", 4),
  ("Laptop & Desktop Accessories- Computers, Tablets & Network Hardware", 4),
  ("Computer Printers, Scanners & Supplies- Computers, Tablets & Network Hardware", 4)
;

with recursive cte (parent_category_id, id, title) as (
  select
    p.parent_category_id,
    p.id,
    p.title
  from
    product_categories p
  where
    p.parent_category_id is null
  union all
  select
    p.parent_category_id,
    p.id,
    p.title
  from
    product_categories p
    inner join
    cte
    on
    p.parent_category_id = cte.id
)
select
  *
from
  cte
;

set @@foreign_key_checks = 1;

