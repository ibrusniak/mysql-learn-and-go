
create database if not exists dbtr0;
use dbtr0;
drop table if exists t1;
create table t1 (pk int not null auto_increment primary key, c int);

-- start transaction / begin / begin work
-- commit
-- rollback
-- set autocommit = {0|1}

prepare `insert` from 'insert into t1 (c) values (2), (3)';
prepare `select` from 'select * from t1';
prepare `count` from 'select count(*) from t1';

execute `insert`;
execute `count`; # 2

start transaction;
-- transaction does not work here. Table become empty
truncate t1;
rollback;

execute `count`; # 0

execute `insert`;

begin work;
-- it works!
delete from t1;
rollback;

execute `count`;

