
use locktest;

select * from t1;

insert into t1 (c1) values (20);

select connection_id();
