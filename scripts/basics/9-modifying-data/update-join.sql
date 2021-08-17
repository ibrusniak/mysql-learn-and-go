
create schema if not exists testdb500;
use testdb500;

drop table if exists t1;

create table t1 (
  c1 int not null,
  c2 int default 0);
  
create table t2 (
  c1 int not null,
  c2 int default 0);
  
insert into t1 (c1, c2) values
  ((select round(rand() * 10)), (select round(rand() * 10000)))
; 

insert into t2 (c1, c2) values
  ((select round(rand() * 10)), (select round(rand() * 10000)))
;

-- update table with the same values
update t1
  inner join t1 _t1 using (c1)
set
  t1.c2 = _t1.c2;
  
-- copying values from t1 to t2
update t2
  inner join t1 using (c1)
set
  t2.c2 = t1.c2;
  

  

