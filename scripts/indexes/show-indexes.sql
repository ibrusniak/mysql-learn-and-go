
drop database if exists db533;
create database db533;
use db533;

create table t1 (
  id int primary key auto_increment,
  col1 int unique,
  col2 int,
  col3 int,
  index (col2, col3)
);

create table t2 (
  id int primary key ,
  t1_id int,
  foreign key (t1_id) references t1 (id)
);

show indexes from t1;
show indexes from t2;

drop index `PRIMARY` on t2;

show indexes from t2;


