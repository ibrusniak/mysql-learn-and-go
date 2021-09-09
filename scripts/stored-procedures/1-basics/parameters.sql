
drop database if exists storegames;
create database storegames;
use storegames;

set @a = 0;
set @b = 2;

delimiter $$
create procedure show_debug()
begin
    select @a, @b;
end$$
delimiter ;

call show_debug(); -- 0, 2

delimiter $$
create procedure change_a(in a int)
begin
    set a = a + 200;
end$$
delimiter ;

call change_a(@a);

call show_debug(); -- still 0, 2

delimiter $$
create procedure change_a_inout(inout a int)
begin
    set a = a + 300;
end$$
delimiter ;

call change_a_inout(@a);

call show_debug(); -- 300, 2

delimiter $$
create procedure change_b_in(in b int)
begin
    set b = b * 6;
end$$
delimiter ;

call show_debug();
call change_b_in(@b); -- still 300, 2
call show_debug();

delimiter $$
create procedure change_b_out(out b int)
begin
    set b = b * 6; -- b is null
end$$
delimiter ;

call show_debug();
call change_b_out(@b); -- 300, null
call show_debug();

delimiter $$
create procedure change_b_out_2(out b int)
begin
    set b = 600;
end$$
delimiter ;

call show_debug();
call change_b_out_2(@b); -- 300, null
call show_debug();


-- one more

set @var_a = 100;
set @var_b = 200;
set @var_c = 300;

delimiter $$
create procedure wo(in a int, inout b int, out c int)
begin
    set a = 120; -- does not change outer value
    set b = 220; -- does change (inout)
    set c = 400; -- chang but does not know outer value
end$$
delimiter ;

select @var_a, @var_b, @var_c;

call wo(@var_a, @var_b, @var_c);

select @var_a, @var_b, @var_c;




