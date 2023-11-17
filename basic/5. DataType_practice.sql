alter table author ADD column age tinyint unsigned;

insert into author(id, name, age) values(1, 'abc', 255);
insert into author(id, name, age) values(1, 'abc', 256);

alter table post ADD column price DECIMAL(10,3)

update post set price = 100.123 where id=1;
update post set price = 100.1255 where id=2;
-- 소수점 아래 4번째 숫자 반올림 되어서 100.126이 값으로 들어간다.


create table table_blob(id int, myimg longblob);