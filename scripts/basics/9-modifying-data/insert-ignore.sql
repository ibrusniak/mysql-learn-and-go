
-- show schemas;

create schema if not exists testdb5;

use testdb5;

drop table if exists ins0;

create table ins0 (
  fname varchar(50) not null,
  lnmae varchar(50) not null,
  email varchar(100) not null,
  -- email as user login (unique value)
  primary key (email) 
);

-- alter table ins0 change column lnmae lname varchar(50) not null;

insert into  ins0 (fname, lname, email)
values
  ('John', 'Smith', 'jsmith@maeler.su'),
  ('Johnatan', 'Matews', 'fellow@g_ofmail.cg');

update ins0
set
  email = 'jsmith@maler.su'
where
  email = 'jsmith@maeler.su';

insert into ins0
values
  -- Error Code: 1062. Duplicate entry 'jsmith@maler.su' for key 'ins0.PRIMARY'
  ('some', 'person', 'jsmith@maler.su'),
  -- normal - PK is unique but crashes whole operation because of first not unique key 'jsmith@...'
  ('yonko', 'budka', 'yonko_1985@polska_mail.pl');

-- use `INSERT IGNORE` to insert all what can be inserted
insert ignore into ins0
values
  -- these two cause warning
  -- 2 row(s) affected, 1 warning(s): 1062 Duplicate entry 'fellow@g_ofmail.cg' for key 'ins0.PRIMARY' Records: 3  Duplicates: 1  Warnings: 1
  ('John', 'Smith', 'jsmith@maeler.su'),
  ('Johnatan', 'Matews', 'fellow@g_ofmail.cg'),
  -- this is normal
  ('Matew', 'Devis', 'm_devis@myown.org');
  
  
