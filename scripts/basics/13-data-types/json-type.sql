
drop database if exists testdb;
create database testdb;
use testdb;

create table jsontest (
  pk int auto_increment primary key,
  c1 int not null,
  doc1 json,
  c2 mediumtext as (doc1)
);

create table doucuments (
  doc json
);

insert into doucuments
with recursive gen (counter) as (
  select 1 union select counter + 1 from gen where counter < 5
)
select
  concat(
    '{"value":',
    round(rand() * 10000),
    '}'
  )
from
  gen
;

select * from doucuments limit 10;

select
  sum(doc->>'$.value')
from
  doucuments;

insert into
  doucuments (doc)
values
  ('{"os_type":"microsoft windows","version":10,"comment":null,"devices":["printer","mouse","monitor"]}'),
      ('{
        "os_type": "microsoft windows",
        "version": 10,
        "comment": null,
        "devices": [
            "printer",
            "mouse",
            "monitor"
        ]
    }')
;

select
  doc->>'$.version',
  doc->>'$.devices'
from
  doucuments
;

create table j2 (
  doc json
);

insert into j2
values
  ('{"salary":5000,"position":"programmer"}'),
  ('{"salary":12000,"position":"accountant"}')
;
