
drop database if exists common_types;
create database common_types;
use common_types;

-- 'boolean'

select
  1,
  true,
  false,
  1 = 1,
  1 = 0,
  1 is true,
  0 is true,
  (1 = 0) is not true,
  (1 = 1) is not false
  # , (1 = 0) is not 1
;

-- char

create table t1 (
  c1 char(20),
  c2 char(10)
);

insert ignore into t1 (c1, c2) values
  ('1234567890', '1234567890'),
  ('1234567890123456789012345', '1234567890123456789012345')
;

-- When you query the CHAR value,
-- MySQL removes the trailing spaces.
select
  concat('/', c1, '/'),
  concat('/', c2, '/')
from
  t1;

set @old_sql_mode = @@sql_mode;
set @@sql_mode = 'PAD_CHAR_TO_FULL_LENGTH'; # deprecated

select
  concat('/', c1, '/'),
  concat('/', c2, '/')
from
  t1;

set @@sql_mode = @old_sql_mode;

select
  char_length(c1),
  char_length(c2)
from
  t1;

alter table t1 add column t3 char(100);

select
  '122234' regexp '[0-9]',
   regexp_substr('loren ipsum 23 years 233', ' [1-9]', 1);

select
 cast('  1234F   ' as char(20)) = cast('1234F' as char(20)),
 '  1234F ' LIKE '1234F';

create table chars0 (
  c1 char(20) not null,
  unique index (c1)
);

insert into chars0 values
  ('loren  ');

-- error. duplicate
-- unique index
insert into chars0 values
  ('loren');

