
drop database if exists triggersdemo;
create database triggersdemo;
use triggersdemo;

create table portal_users (
    id int unsigned primary key auto_increment,
    email varchar(100) not null unique,
    first_name varchar(100) not null,
    last_name varchar(100) not null
);

delimiter $$

create trigger tr1
before insert
on portal_users
for each row
begin
end $$

create trigger tr2
before update
on portal_users
for each row
begin
end $$

create trigger tr3
before delete
on portal_users
for each row
begin
end $$

delimiter ;

drop trigger tr1;
drop trigger tr2;
drop trigger tr3;

create table debug_table (
    msg_num int unsigned auto_increment,
    msg varchar(200) not null,
    constraint debug_table_pk primary key (msg_num)
);

delimiter $$

create trigger debug_table_on_insert
before insert
on debug_table for each row
begin
    if new.msg = '' then
        signal sqlstate '99999' set message_text = 'Message can not be empty!';
    end if;
end $$

create procedure write_log(in message varchar(200))
    insert into debug_table (msg) values (message) $$
    
create procedure show_log()
    select * from debug_table $$

create trigger tr_1_1
before insert
on portal_users
for each row
begin
    call write_log('before insert trigger for \'portal_users\' called');
end $$

create trigger tr_1_2
after insert
on portal_users
for each row
begin
    call write_log('after insert trigger \'portal_users\' called');
end $$

delimiter ;

insert into portal_users (email, first_name, last_name) values
    ('johndoe@servermail.com', 'John', 'Doe');

call show_log();


