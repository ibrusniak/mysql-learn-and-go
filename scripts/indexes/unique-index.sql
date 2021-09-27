
drop database if exists db533;
create database db533;
use db533;

create table users (
  id int unsigned auto_increment,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(100) not null,
  constraint users_chk_1 check (first_name != ''),
  constraint users_chk_2 check (last_name != ''),
  constraint users_chk_3 check (email != ''),
  constraint users_pk primary key (id)
);

delimiter $
create trigger user_before_insert_1
before insert on users
for each row
begin
  set new.email = REGEXP_REPLACE(new.email, '[ \t]{0,}', '');
end $

insert into users (first_name, last_name, email)
values
  ('John', 'Doe', 'jdoe@american_mail.com'),
  ('Amily', 'Parker', '_someGirl@'),
  ('Yonko', 'Petryk', 'yonko petryk@polska.com')
;

insert into users (first_name, last_name, email)
value
  ('Some', 'Body', 'jdoe@american_mail.com'); -- dublicate

select * from users;

-- Error Code: 1062 Duplicate entry
-- 'jdoe@american_mail.com' for key 'users.users_idx_1'
-- create unique index users_idx_1
-- on users (email);

update users set email = 'jdoe2@american_mail.com'
where first_name = 'Some' and last_name = 'Body';

create unique index users_idx_1
on users (email);

select * from users;

show indexes from users;

alter table users
add constraint users_idx_2
unique key (first_name, last_name);

show indexes from users;

-- null values in the unique index

create table t2 (
  col1 int unsigned,
  col2 int unsigned,
  col3 varchar(200)
);

alter table t2
add constraint t2_idx_1
unique key (col1, col2, col3);

insert into t2
value
  (null, null, 'hello'),
  (2, null, null),
  (2, null, null),
  (null, null, 'hello'),
  (null, null, null),
  (null, null, null);

select * from t2;


