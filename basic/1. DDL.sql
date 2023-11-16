-- 데이터베이스 생성
CREATE DATABASE board;
-- 데이터베이스 선택
USE board;
-- author 테이블 신규 생성
-- PRIMARY KEY 설정은 두가지 방법(테이블차원, 컬럼차원)
CREATE TABLE author(id INT, name VARCHAR(255),
email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255), PRIMARY KEY (id));
-- 테이블 목록조회
SHOW TABLES:
-- 테이블 컬럼조회
DESCRIBE author;
-- post 테이블 신규 생성
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255), content VARCHAR(255), author_id INT, FOREIGN KEY(author_id)
REFERENCES author(id));