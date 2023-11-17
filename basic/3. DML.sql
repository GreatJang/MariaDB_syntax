-- insert, select, update, delete
insert into author(id, name, email) values(1, 'kim', 'kim@naver.com');

update author set email='abc2@test.com' where id=1;

DELETE FROM author WHERE author_id=5;

select * from author;
select name from author;
select * from author where id = 1;
select * from author where id > 10;
select * from author where id > 10 and name = 'abc';

-- 이름 중복제거하고 조회
select distinct name from author;

-- order by
select * from author order by name desc;

-- order by 멀티 : 먼저 쓴 컬럼 우선정렬. asc/desc 생략시 asc 적용
select * from author order by name, email desc;

-- limit number : 특정숫자로 결과값 개수 제한
select * from author order by id desc limit 2;

-- alias를 이용한 select문(as는 생략가능)
select name as 이름 from author;
select name, email from author as a;