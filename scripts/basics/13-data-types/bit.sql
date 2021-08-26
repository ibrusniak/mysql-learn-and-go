
drop schema if exists bit_;
create schema bit_;
use bit_;

create table t1 (
    pk int not null primary key auto_increment,
    c1 bit,
    c2 bit(2),
    c3 bit(64)
);

insert into t1 (c1, c2, c3) values 
    (0b1, 0b11, 0b1111),
    (0b1, 0b11, 0b1111)
;

select
    c1,
    charset(c1)
from
    t1;

select charset(0b1111); -- binary

select charset((B'1111')); -- binary
select B'1100'; -- blob

select bin(B'1100');

select
    bin(B'1111'),
    lpad(bin(B'1111'), 7, 0);


