
drop schema if exists encodings;
create schema encodings;
use encodings;

create table t1 (
  col1 varchar(100) not null
) character set = utf8;

insert into t1
values
  ('маєток'),
  ('Ємність'),
  ('Ёмкость'),
  ('ёмкость')
;

select * from t1;

create table t2 (
  c1 char(1) not null
) character set = koi8u;

insert into t2
values
  ('Є'),
  ('Ё'),
  ('F'),
  ('Ж')
;

select
  c1,
  hex(c1),
  convert(c1 using 'cp1256'),
  'ґ',
  hex(convert('ґ' using koi8u)),
  convert('ґ' using koi8u)
from t2;

select
  cast(_koi8u'Привіт усім. Маєток' as char character set koi8u);

set @ch1 = 'Є';
set @ch2 = 'І';
set @ch3 = 'Ґ';

select
  @ch1 `char`,
  hex(convert(@ch1 using koi8u)) `koi8u`,
  hex(convert(@ch1 using koi8r)) `koi8r`,
  hex(convert(@ch1 using koi8r)) `utf8`,
  hex(convert(@ch1 using koi8r)) `cp1251`,
  hex(convert(@ch1 using koi8r)) `cp1256`
union
select
  @ch2 `char`,
  hex(convert(@ch2 using koi8u)) `koi8u`,
  hex(convert(@ch2 using koi8r)) `koi8r`,
  hex(convert(@ch2 using utf8)) `utf8`,
  hex(convert(@ch2 using cp1251)) `cp1251`,
  hex(convert(@ch2 using cp1256)) `cp1256`
union
select
  @ch3 `char`,
  hex(convert(@ch3 using koi8u)) `koi8u`,
  hex(convert(@ch3 using koi8r)) `koi8r`,
  hex(convert(@ch3 using utf8)) `utf8`,
  hex(convert(@ch3 using cp1251)) `cp1251`,
  hex(convert(@ch3 using cp1256)) `cp1256`;

select
  hex(_koi8u'і'),
  hex(_koi8r'і'),
  convert('і' using koi8u),
  convert('і' using koi8r),
  hex(convert('і' using koi8u)),
  hex(convert('і' using koi8r));

drop table if exists t10;

create table t10 (
  col1 varchar(50) not null
) character set = koi8u;

insert into t10
values
  (_koi8u'набір символів'),
  (_koi8u'Така таблиця зіставляє'),
  (_koi8u'Гнат Ґалаґан');

set names utf8;
select * from t10;

set names koi8r;
select * from t10;

set names koi8u;
select * from t10;
  



