alter table author ADD column age tinyint unsigned;

insert into author(id, name, age) values(1, 'abc', 255);
insert into author(id, name, age) values(1, 'abc', 256);

alter table post ADD column price DECIMAL(10,3)

update post set price = 100.123 where id=1;
update post set price = 100.1255 where id=2;
-- 소수점 아래 4번째 숫자 반올림 되어서 100.126이 값으로 들어간다.

create table table_blob(id int, myimg longblob);

-- ENUM 타입 실습
-- role타입 enum타입으로 변경하고, ‘user’, ‘admin’으로 enum타입 지정.
-- not null로 설정하되, 입력이 없을시에는 ‘user’로 세팅되도록 default 설정
alter table author modify column role ENUM('user','admin') not null default 'user';

-- admin으로 데이터 세팅 후 insert
insert into author(id, name, role) values(1, 'abc', 'admin')

-- super-user 데이터로 insert
insert into author(id, name, role) values(3, 'abc', 'super-user')

-- role데이터 없이 insert
insert into author(id, name) values(1, 'abc')

-- DATETIME 타입 실습
alter table post ADD column created_time DATETIME DEFAULT current_timestamp;

