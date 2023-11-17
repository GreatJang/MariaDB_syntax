-- ===== INSERT 실습 =====

-- author 데이터 5개 추가
-- - address는 데이터 넣지 말것

-- post 데이터 5개 추가
-- - 2개는 저자가 있는 데이터
-- - 2개는 저자가 비어있는 데이터 → author_id에 NOT NULL 조건 없다는 사실 확인
-- - 1개는 저자가 author테이블에 없는 데이터 추가 → 에러 발생 확인하기

insert into author(id, name, email) values(1, 'kim', 'kim@naver.com');
insert into author(id, name, email) values(2, 'jang', 'jang@naver.com');
insert into author(id, name, email) values(3, 'yang', 'yang@naver.com');
insert into author(id, name, email) values(4, 'back', 'back@naver.com');
insert into author(id, name, email) values(5, 'you', 'you@naver.com');

insert into post(id, title, contents, author_id) values(1, 'kim', 'kim123', 1);
insert into post(id, title, contents, author_id) values(2, 'jang', 'jang123', 2);
insert into post(id, title, contents) values(3, 'yang', 'yang123');
insert into post(id, title, contents) values(4, 'back', 'back123');
insert into post(id, title, contents, author_id) values(10, 'jang', 'jang123', 10);

-- author데이터 중 id가 4인 데이터를 email을 abc@naver.com, name을 abc로 변경
-- post에 글쓴적이 없는 author 데이터 1개 삭제
-- post에 글쓴적이 있는 author 데이터 1개 삭제 →에러 → 조치 후 삭제

update author set email='abc@naver.com', name='abc' where id=4;
delete from author where id=3;
delete from author where id=1;
UPDATE post set author_id=null where id=1;
delete from author where id=1;



drop table post;
drop table board;
create table author(id INT, name VARCHAR(100) NOT NULL, email VARCHAR(255), password VARCHAR(255), role VARCHAR(50), address VARCHAR(255), PRIMARY KEY(id));
create table post(id INT, title VARCHAR(255), contents VARCHAR(3000), author_id INT, PRIMARY KEY(id), FOREIGN KEY(author_id) REFERENCES author(id));


insert into author(id, name, email) values(1, 'abc', 'abc@naver.com');
insert into author(id, name, email) values(2, 'abd', 'abd@naver.com');
insert into author(id, name, email) values(3, 'abe', 'abe@naver.com');
insert into author(id, name, email) values(4, 'abf', 'abf@naver.com');
insert into author(id, name, email) values(5, 'abg', 'abg@naver.com');

insert into post(id, title, contents, author_id) values(1, 'hello1', 'hhhhh', 1);
insert into post(id, title, contents, author_id) values(2, 'hello2', 'ggggg', 2);
insert into post(id, title, contents, author_id) values(3, 'hello3', 'fffff', 3);
insert into post(id, title, contents) values (4, 'hello4', 'ddddd');
insert into post(id, title, contents) values (5, 'hello5', 'sssss');

update post set author_id = null where author_id is not null;
delete from author;
select * from post order by title ASC, contents DESC limit 3;