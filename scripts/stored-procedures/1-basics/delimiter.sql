
delimiter ???

drop database if exists testdb ???
create database testdb ???
use testdb ???

delimiter ;

create table t1 (
    c1 int
);

delimiter _delimiter

insert into t1
values
    (1), (2), (3)
;

_delimiter

delimiter ;

select * from t1;

delimiter `this is delimiter`

insert into t1
values
(4), (5), (6)

`this is delimiter`

select * from t1

`this is delimiter`

delimiter ;

