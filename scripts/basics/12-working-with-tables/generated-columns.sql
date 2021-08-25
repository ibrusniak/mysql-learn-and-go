
create database if not exists use_generated_columns;

use use_generated_columns;

drop temporary table if exists tmp_t1;

create temporary table tmp_t1 (
    pk int not null primary key auto_increment,
    c1 int not null,
    `pi value` double as (pi()),
    `sqr` int generated always as (c1 * c1)
);

insert into tmp_t1 (c1) values (10);

select * from tmp_t1;

