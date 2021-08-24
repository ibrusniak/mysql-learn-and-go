
create database if not exists alter_table_experiments;
use alter_table_experiments;

create table t1 (
  c1 int
);

-- add column
alter table t1 add column c2 int not null after c1;

-- `move forward` column
alter table t1 change column c1 c1 int not null after c2;

-- `move back` column
alter table t1 change column c1 c1 int first;

-- add column, second form (without `column`)
alter table t1 add c3 int first;

-- remove column
alter table t1 add rmv int default null after c2;
alter table t1 drop column rmv;

-- `describe` and `show create table`
describe t1;
show create table t1;

-- update existing column
alter table t1 change column c1 c1 int not null primary key auto_increment;
-- try to add second primary key
-- Error Code: 1068. Multiple primary key defined
alter table t1 add column pk int not null primary key;

-- add multiple columns to the table
alter table t1 drop c3;
alter table t1 drop c2;
-- Error Code: 1090. You can't delete all columns with ALTER TABLE; use DROP TABLE instead
alter table t1 drop c1;
alter table t1
  add c2 int not null,
  add c3 int not null,
  add _name varchar(100);
  
-- multiple remove
alter table t1
  drop _name,
  drop c3,
  drop c2;

-- `modify` is not the same as `change`
-- `change` allows us to rename column
alter table t1
  modify c1 int not null;

-- rename table
alter table t1
  rename to t2;
