-- insert, select, update, delete
insert into author(id, name, email) values(1, 'kim', 'kim@naver.com');

update author set email=’abc2@test.com’ where id=1;

DELETE FROM author WHERE author_id=5;

select * from author;
select name from author;
select * from author where id = 1;
select * from author where id > 10;
select * from author where id > 10 and name = 'abc';