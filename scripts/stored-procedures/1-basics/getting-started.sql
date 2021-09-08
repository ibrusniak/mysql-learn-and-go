
drop database if exists testdb;
create database testdb;
use testdb;

create table person (
    driver_license_id int unsigned not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    constraint person_pk primary key (driver_license_id)
);

insert into person
values
    (200, 'John', 'Doe');

select * from person;

delimiter $$

create procedure getPersons()
begin
    select * from person;
end$$

delimiter ;

call getPersons;
call getPersons;
call getPersons;

