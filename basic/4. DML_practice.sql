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


-- ALTER문을 써서 post의 title을 not null 조건 변경
alter table post modify column title VARCHAR(255) not null;

-- auto_increment 실습
-- id컬럼에 auto_increment 설정
 alter table post modify column id INT AUTO_increment;
-- 새로운 데이터 추가(8 low)
 insert into post(title, contents) values('you', 'ggggggg');
-- 새로 넣은 데이터 삭제(8 low)
 delete from post where id = 8;
-- 다시 데이터 추가
 insert into post(title, contents) values('you', 'ggggggg');
-- 다시 데이터 추가 시 9 low로 추가 확인


-- UNIQUE 실습
-- 방법 1
ALTER TALBE 테이블이름 MODIFY COLUMN 필드이름 필드타입 UNIQUE
-- 방법 2
ALTER TABLE 테이블 이름 ADD CONSTRAINT 제약조건이름 UNIQUE(필드이름)

-- author 테이블 email에 unique 제약조건 추가
-- 컬럼 제약 조건으로 추가
ALTER TABLE author MODIFY COLUMN email VARCHAR(255) UNIQUE;
-- 제약 조건 제거 및 index제거
ALTER TABLE author DROP CONSTRAINT email;
-- 테이블 제약조건 추가형식으로 추가
ALTER TABLE author ADD CONSTRAINT email2 UNIQUE(email);
