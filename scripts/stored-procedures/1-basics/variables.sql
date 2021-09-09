
create database if not exists routinegames;
use routinegames;

-- select database();

drop procedure if exists show_routines;
drop procedure if exists mul;
drop procedure if exists p1;
drop procedure if exists p2;
drop procedure if exists p3;

delimiter $$
create procedure show_routines()
begin
        select
            *
        from
            information_schema.routines
        where
            information_schema.routines.routine_schema = database();
end$$
delimiter ;

call show_routines;

delimiter $$
create procedure mul(in a int unsigned, in b int unsigned, out mul int unsigned)
begin
    declare _mul int unsigned default 0;
    set _mul = a * b;
    set mul = _mul;
end$$
delimiter ;

set @var = 0;

call mul(100, 20, @var);

select @var;

set @v2 = 0;

select count(*) into @v2 from (select 100) as t; -- 'select into' syntax

select @v2;

delimiter $$
create procedure p1()
begin
    declare var_a int unsigned default 0;
    declare var_b int unsigned default 100;
    declare x_coord, y_coord, z_coord float default 0.0;
    select count(*) into var_b from (select 1) as t;
    select var_a, var_b;
end$$
delimiter ;

call p1;

delimiter $$
create procedure p2()
begin
    declare a int default 0;
    declare b int default 0;
    declare c int default 15;
    set a = 100;
    set b = 300;
    begin
        set c = a * b;
    end;
    select c;
end$$
delimiter ;

call p2;

