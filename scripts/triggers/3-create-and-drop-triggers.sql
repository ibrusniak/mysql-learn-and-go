
drop database if exists tdb2;
create database tdb2;
use tdb2;

create table table_for_audit (
    _id int unsigned primary key auto_increment,
    _column_name varchar(100) not null,
    _action enum ('insert', 'update', 'delete') not null,
    _timing enum ('before', 'after') not null,
    old_value varchar(100),
    new_value varchar(100)
);

create table table_for_tests (
    pk int unsigned auto_increment primary key,
    column_1 int unsigned,
    column_2 varchar(50)
);

delimiter $$

create trigger table_for_audit_before_insert_1
before insert on table_for_audit for each row
label1: begin
    case new._action
        when 'insert' then
            begin
                if new.new_value is null then
                    signal sqlstate 'HY000' set message_text = '\'new_value\' could not be null when action is \'insert\'!';
                end if;
            end;
        when 'update' then
            begin
                if new.old_value is null then
                    signal sqlstate 'HY000' set message_text = '\'old_value\' could not be null when action is \'update\'!';
                end if;
                if new.new_value is null then
                    signal sqlstate 'HY000' set message_text = '\'new_value\' could not be null when action is \'update\'!';
                end if;
            end;
        when 'delete'
            then leave label1;
     end case;
end $$

create trigger table_for_tests_after_insert_1
after insert on table_for_tests for each row
begin
    insert into table_for_audit(
        _column_name,
        _action,
        _timing,
        new_value
    )
    values
        ('column_1', 'insert', 'after', new.column_1),
        ('column_2', 'insert', 'after', new.column_2);
end $$

create trigger table_for_tests_after_update_1
after update on table_for_tests for each row
begin
    insert into table_for_audit(
        _column_name,
        _action,
        _timing,
        old_value,
        new_value
    )
    values
        ('column_1', 'update', 'after', old.column_1, new.column_1),
        ('column_1', 'update', 'after', old.column_2, new.column_2);
end $$

create trigger table_for_tests_after_delete_1
after delete on table_for_tests for each row
begin
    insert into table_for_audit(
        _column_name,
        _action,
        _timing,
        old_value
    )
    values
        ('column_1', 'delete', 'after', old.column_1);
end $$

delimiter ;

insert into table_for_tests (column_1, column_2)
values
    (100, 'hello'),
    (200, 'sql'),
    (300, 'scripting');

-- Error Code: 1644. 'new_value' could not be null when action is 'insert'!
-- insert into table_for_tests (column_2) values ('test');

update table_for_tests set
    column_2 = 'learning'
where
    column_1 = 300;

insert into table_for_tests (column_1, column_2)
values
    (500, 'to delete');

delete from table_for_tests
where
    column_1 = 500;

show triggers;

drop trigger table_for_tests_after_insert_1;
drop trigger table_for_tests_after_update_1;
drop trigger table_for_tests_after_delete_1;

show triggers;

