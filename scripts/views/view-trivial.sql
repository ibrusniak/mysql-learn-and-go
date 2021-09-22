
drop database if exists views_test;
create database views_test;
use views_test;

create view days_of_week (_day) as
    select 'monday' union
    select 'tuesday' union
    select 'wednesday' union
    select 'thursday' union
    select 'friday' union
    select 'saturday' union
    select 'sunday';
    
select _day from days_of_week;
    

