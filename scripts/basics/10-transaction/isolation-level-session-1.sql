
/*  ACID
    A - atomicity
    C - consistency
    I - isolation
    D - durability
    
    Problems
    1. Lost update
    2. Dirty read
    3. Non-repeatable read
    4. Phantom reads
    
    Transaction isolation levels (according to SQL:1992)
    1. READ UNCOMMITED
    2. READ COMMITED
    3. REPEATABLE READ
    4. SERIALIZABLE */

-- SESSION 1

drop database if exists work_with_isolation_level;
create database work_with_isolation_level;
use work_with_isolation_level;

create table t1 (
  pk int not null primary key auto_increment,
  c1 int not null
);



