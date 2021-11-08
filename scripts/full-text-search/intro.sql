
drop database if exists fts01;
create database fts01;
use fts01;

create table news (
    id int unsigned not null auto_increment,
    article mediumtext,
    constraint news_c1_pk primary key (id),
    fulltext index (article)
);

create table posts (
    id int unsigned not null auto_increment,
    post mediumtext,
    constraint posts_c1_pk primary key (id)
);

alter table
    posts
add fulltext (post);

create table t3 (
    id int unsigned,
    c1 varchar(150) not null
);

create fulltext index t3_idx1
on t3(c1);

alter table t3
drop index t3_idx1;
