
drop database if exists tdb4500;
create database tdb4500;
use tdb4500;

create table loren_table (
  id int unsigned auto_increment primary key,
  _string varchar(250)
);

create temporary table t_temp (
  _string varchar(250)
);

load data
infile "D:/learn/mysql/mysql-learn-and-go/scripts/indexes/lorenipsum.txt"
into table t_temp
lines terminated by '\r\n';

insert into loren_table (_string) select _string from t_temp;

drop table t_temp;

select * from loren_table;

select count(*) from loren_table
  where _string like 'Donec%' or _string like '%quis%';

select
  count(*)
from
  loren_table as l1
  inner join
  loren_table as l2 on l1._string like l2._string
  inner join
  loren_table as l3 on l1._string like l3._string
  inner join
  loren_table as l4 on l1._string like l4._string;




