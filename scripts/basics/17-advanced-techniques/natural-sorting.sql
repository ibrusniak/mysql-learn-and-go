
drop database if exists nsorttest;
create database nsorttest;
use nsorttest;

create table t1 (
    pk int unsigned auto_increment primary key,
    col1 varchar(20) not null
);

insert into t1 (col1)
values
    ('x2'),
    ('z2'),
    ('a4'),
    ('y1'),
    ('l10'),
    ('q6');

select
    col1,
    left(col1, 1) `char`,
    right(col1, char_length(col1) - 1) `number`,
    cast(right(col1, char_length(col1) - 1) as unsigned) `unsigned number`
from
    t1;

-- standard sorting
select col1 from t1 order by col1;
    
-- natural. In this case i need to sort fir of all
-- by number (descend) and then by char (ascend) (dummy example)
select
    col1
from
    t1
order by
    cast(right(col1, char_length(col1) - 1) as unsigned) desc,
    left(col1, 1) asc;


