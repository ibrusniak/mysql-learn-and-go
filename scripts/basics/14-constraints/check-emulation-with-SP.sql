
drop database if exists testdb;
create database testdb;
use testdb;

-- emulation of check constraints (Version < 8.0.16)
-- using triggers `before insert` and `before update`
-- `CHECK` constraint available from 8.0.16

create table person (
  id int unsigned not null auto_increment,
  driver_license_id int unsigned not null,
  first_name varchar(150) not null,
  last_name varchar(150) not null,
  constraint person_pk primary key (id),
  constraint person_c1 unique index (driver_license_id)
);

delimiter $

create procedure check_name (in _name varchar(150))
begin
  -- only for understand principle
  -- dummy code
  if char_length(_name = 1) then
    signal sqlstate '45000'
    set message_text = 'name is too short (only > 3 allowed)';
  end if;
end$

delimiter ;

delimiter $

create trigger person_before_insert before insert on person
for each row
begin
  call check_name (new.first_name);
  call check_name (new.last_name);
end$

delimiter ;

insert into person (driver_license_id, first_name, last_name)
values
  (100, 'John', 'Doe'),
  (200, 'Fo', 'Yang'),
  (300, 'Y', 'T');

