
drop database if exists text_type;
create database text_type;
use text_type;

-- tinytext: 255 Bytes
-- text: 64 KBytes
-- mediumtext: 16 MBytes
-- longtext: 4 GBytes

create table articles (
  id int auto_increment primary key,
  title varchar(255),
  summary tinytext
);

alter table articles
add column body text not null
after summary;

create table whitepapers (
  id int auto_increment primary key,
  body mediumtext not null,
  published_on date not null
);



