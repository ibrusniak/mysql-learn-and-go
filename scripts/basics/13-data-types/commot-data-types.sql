
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


