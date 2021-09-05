
drop database if exists importing_data_test;
create database importing_data_test;
use importing_data_test;

create table cpus (
  model varchar(100) not null,
  cores tinyint unsigned not null,
  threads tinyint unsigned not null,
  base_frequency float not null,
  turbo_frequency float not null,
  l1_cashe_size varchar(10) not null default 'N/A',
  l2_cashe_size varchar(10) not null default 'N/A',
  l3_cashe_size varchar(10) not null default 'N/A',
  tdp smallint unsigned not null,
  code_name varchar(100) default null,
  socket varchar(100) default null,
  constraint cpus_c1 check (char_length(model) > 3),
  constraint cpus_c2 check (cores > 0)
);

-- Error Code: 1290. The MySQL server is running with the
-- --secure-file-priv option so it cannot execute this statement
-- load data infile 'd:/learn/mysql/mysql-learn-and-go/scripts/basics/16-import-and-export/intel-cpus.csv'

select @@secure_file_priv;

load data infile 'd:/learn/mysql/mysql-learn-and-go/scripts/basics/16-import-and-export/intel-cpus.csv'
into table cpus
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

