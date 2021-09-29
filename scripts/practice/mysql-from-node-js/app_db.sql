
drop database if exists app_db;
create database app_db;
use app_db;

create table app_users (
    id int unsigned auto_increment primary key,
    fname varchar(50) not null,
    lname varchar(50) not null,
    email varchar(100) not null
);

insert into app_users (fname, lname, email)
values
    ('Ivan', 'Zubov', 'ivan.zubov@gmail.com'),
    ('John', 'Doe', 'john.doe@gmail.com'),
    ('Maryl', 'Strip', 'm.strip@bingmail.com')
;

select * from app_users;

