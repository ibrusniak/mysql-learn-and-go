
drop database if exists db204;
create database db204;
use db204;

create table t1 (
  pk int unsigned auto_increment,
  w varchar(50) not null,
  primary key (pk),
  index (w)
);

create table t2 like t1;
drop index w on t2;

show indexes from t1;
show indexes from t2;

insert into t1 (w) values
('It'), ('is'), ('a'), ('long'), ('established'), ('fact'), ('that'), ('a'), ('reader'), ('will'), ('be'), ('distracted'),
('by'), ('the'), ('readable'), ('content'), ('of'), ('a'), ('page'), ('when'), ('looking'), ('at'), ('its'), ('layout'),
('The'), ('point'), ('of'), ('using'), ('Lorem'), ('Ipsum'), ('is'), ('that'), ('it'), ('has'), ('a'), ('more-or-less'),
('normal'), ('distribution'), ('of'), ('letters'), ('as'), ('opposed'), ('to'), ('using'), ('Content'), ('here'), ('content'),
('here'), ('making'), ('it'), ('look'), ('like'), ('readable'), ('English'), ('Many'), ('desktop'), ('publishing'),
('packages'), ('and'), ('web'), ('page'), ('editors'), ('now'), ('use'), ('Lorem'), ('Ipsum'), ('as'), ('their'), ('default'),
('model'), ('text'), ('and'), ('a'), ('search'), ('for'), ('lorem'), ('ipsum'), ('will'), ('uncover'), ('many'), ('web'), ('sites'),
('still'), ('in'), ('their'), ('infancy'), ('Various'), ('versions'), ('have'), ('evolved'), ('over'), ('the'), ('years'), ('sometimes'),
('by'), ('accident'), ('sometimes'), ('on'), ('purpose'), ('injected'), ('humour'), ('and'), ('the'), ('like');

insert into t2 (w) select w from t1;


select w as word, count(w) as occurs
from t1 group by (w) order by pk;

explain select pk from t1 where w = 'a';
explain select pk from t2 where w = 'a';

explain select pk from t1 where w in ('a', 'the', 'content');
explain select pk from t2 where w in ('a', 'the', 'content');
  

create table t3 (
  c int unsigned not null
);

create table t4 like t3;

create index idx_1 on t3 (c);

set @@cte_max_recursion_depth = 10000001;
insert into t3 (c)
with recursive cte (c) as (
  select 1 union all
  select c + 1 from cte where c < 10000000)
select round(rand() * 1000)
from cte;

insert into t4 select * from t3;

select count(c) from t3 where (c >= 555 and c <= 1000) or (c >= 2000 and c <= 2700);
select count(c) from t4 where (c >= 555 and c <= 1000) or (c >= 2000 and c <= 2700); 



