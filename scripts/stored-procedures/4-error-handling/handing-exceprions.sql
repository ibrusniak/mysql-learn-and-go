
drop database if exists handlers_demo;
create database handlers_demo;
use handlers_demo;

create table t1 (
    pk int unsigned not null auto_increment primary key,
    col1 int
);

insert into t1 (col1) values
(100), (200);

delimiter $$

create procedure h_demo_1(in _pk int unsigned)
begin
    select col1 from t1 where pk = _pk;
end$$

create procedure h_demo_2()
begin

    declare continue handler for 1222
    select 'debung point 1. 1222 occurs';

    declare continue handler for 1054
    select 'debung point 2. 1054 occurs';

    -- Error Code: 1222. 
    -- The used SELECT statements have a different number of columns
    select * into @f from t1;

    -- Error Code: 1054 Unknown column 'col3' in 'field list'
    select col3 into @f from t1;

    select 'debung point 3'; 

end$$

delimiter ;

-- call h_demo_1(1); -- normal
-- call h_demo_1(2); -- normal

call h_demo_2();


