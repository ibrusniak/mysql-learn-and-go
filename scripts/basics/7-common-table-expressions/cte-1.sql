
# Commin Table Expression (MySQL version 8+)

# Similar to a derived table, a CTE is not stored as an
# object and last only during the execution of a query.

# Unlike a derived table, a CTE can be self-referencing (a recursive CTE)
# or can be referenced multiple times in the same query.

with tab1 (n, m) as (
    select 2 num, 'c' m union all
    select 3, 'd' union all
    select 1, 'q'
)
select
    *
from
    tab1;

with cte1 (a, p, ctename) as (
    select 2, 'st', 'cte1'
),
cte2 (q, d, ctename) as (
    select 100, 'dd', 'cte2'
),
cteN (f, h, ctename) as (
    select 300 , 'f', 'cteN'
)
select a, p, ctename from cte1 union all
select q, d, ctename from cte2 union all
select f, h, ctename from cteN;

use classicmodels;

with cte0 (a, b) as (select 2, 3),
cte1 (a, b) as (select a, b from cte0),
cte2 (a, b) as (select a, b from cte1)
select * from cte2;

/*
-- error "no database selected"
with cte5 (a) as (select a from cte6),
cte6 (a) as (select 2)
select * from cte5; */

create database if not exists dbtest0;

use dbtest0;

drop table if exists ctevariants;

create table ctevariants (a int, b varchar(50));

insert into ctevariants (a, b) values
    (2, 'sf'),
    (1, 'sd'),
    (7, 'i');
    
select * from ctevariants;

with cte1 (p, q) as (select a, b from ctevariants)
select * from cte1;

insert into ctevariants (a, b)
with cte1 (g, h) as (select a, b from ctevariants) select * from cte1;
