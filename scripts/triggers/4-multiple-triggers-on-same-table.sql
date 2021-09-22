
drop database if exists trigger_games;
create database trigger_games;
use trigger_games;

create table table_1 (
    id int unsigned auto_increment,
    column_1 varchar(50) not null,
    constraint table_1_pk primary key (id)
);

create table debug_table (
    debug_message_num int unsigned auto_increment primary key,
    message varchar(200) not null
);

delimiter $$

-- first trigger
create trigger after_insert_trigger_1_on_table_1
after insert on table_1 for each row
begin
    insert into debug_table set
        message = "called 'after_insert_trigger_1_on_table_1' trigger";
end $$

-- second
create trigger after_insert_trigger_2_on_table_1
after insert on table_1 for each row
follows after_insert_trigger_1_on_table_1
begin
    insert into debug_table set
        message = "called 'after_insert_trigger_2_on_table_1' trigger";
end $$

-- third
create trigger after_insert_trigger_3_on_table_1
after insert on table_1 for each row
follows after_insert_trigger_2_on_table_1
begin
    insert into debug_table set
        message = "called 'after_insert_trigger_3_on_table_1' trigger";
end $$

delimiter ;

insert into table_1 (column_1)
values
    ('Hello'),
    ('MySQL'),
    ('scripting');
    
select *
from
   debug_table; 

