-- 논리연산자 실습
-- author 테이블의 id가 1,2,4는 아닌 데이터 조회(NOT IN 사용)
select * from author where id NOT IN(1,2,4);

-- post 테이블의 id가 2~4까지 데이터 조회
-- between 활용
select * from post where id between 2 and 4;

-- and 조건 활용
select * from post where (id >= 2 and id <= 4);

-- or 조건 활용
select * from post where not (id < 2 or id > 4);

-- LIKE 검색패턴 실습
select * from author where name like 'a%';
select * from author where name not like 'a%'; -- NOT LIKE
select * from author where name like '%c';
select * from author where name like '%a%';

-- 타입변환 실습
-- CAST
SELECT CAST(20200101 AS DATE);
-- CONVERT
SELECT CONVERT('2020-01-01', DATETIME);
-- DATE_FORMAT
SELECT DATE_FORMAT('2020-01-01 17:12:00', '%Y-%m-%d');