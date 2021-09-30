
drop database if exists tdb444;
create database tdb444;
use tdb444;

create table t1 (
    col1 int unsigned primary key auto_increment,
    col2 int unsigned not null,
    col3 int unsigned not null,
    col4 int unsigned not null,
    col5 int unsigned not null,
    col6 int unsigned not null
);

alter table t1
add index t1_com_idx
(col2, col3, col4, col5, col6);

explain select * from t1 where col2 = 4;
explain select * from t1 where col2 = 4 and col3 = 5;
explain select * from t1 where col2 = 4 and col3 = 6 and col4 = 7;

explain select * from t1 where col3 = 4;
explain select * from t1 where col4 = 5;
explain select * from t1 where col5 = 10;


explain select * from t1 where col3 = 4 and col2 = 3;



