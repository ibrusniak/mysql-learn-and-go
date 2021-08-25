
create database if not exists trunc_test;

use trunc_test;

drop table if exists t1, t2, t3, t4;

create table if not exists t1 (
    pk int not null primary key auto_increment,
    c1 int not null,
    c2 int not null
);

create table if not exists t2 like t1;
create table if not exists t3 like t1;
create table if not exists t4 like t1;

drop procedure load_dummy_data;

-- stored procedure to fill tables with dummy data
delimiter $$

create procedure load_dummy_data(in number_of_rows int, in table_name varchar(10))
begin
    declare counter int default 0;
    
    set @sql_script = concat('insert into ', table_name, ' (c1, c2) values (?, ?)');
    
    prepare poc from @sql_script;
    
    while counter < number_of_rows do
        set counter = counter + 1;
        set @rnd1 = round(rand() * 1000);
        set @rnd2 = round(rand() * 1000);
        execute poc using @rnd1, @rnd2;
    end while;
    deallocate prepare poc;
end$$

delimiter ;

-- loading

set @row_count = 10000;

call load_dummy_data(@row_count, 't1');
call load_dummy_data(@row_count, 't2');
call load_dummy_data(@row_count, 't3');
call load_dummy_data(@row_count, 't4');

delete from t1;
truncate table t2;

-- works normally
select count(*) from t3;
begin;
delete from t3;
rollback;

-- but this trick does not work
select count(*) from t4;
start transaction;
truncate t4;
rollback;

