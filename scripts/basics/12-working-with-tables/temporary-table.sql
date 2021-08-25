
create database if not exists use_temporary_tables;
use use_temporary_tables;

create /* permanent */ table test (
  c1 int
);

-- `oveloaded`. Afrer create temp table with
-- same name as permanent - can not acces to
-- permanent table...
create temporary table test (
  c1 varchar(10),
  c2 int
);

describe test; # temporary

drop temporary table test;
