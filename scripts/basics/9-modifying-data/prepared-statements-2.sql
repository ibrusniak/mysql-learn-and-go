
create database if not exists tprpre;
use tprpre;
drop table if exists t1;

create table t1 (
  pk int not null auto_increment primary key,
  c1 int not null
);

set @stmt1 = 'insert into t1 (c1) values (5), (2), (4)';

prepare p1 from @stmt1; 

execute p1;

-- enough for prepared stmts for this time
