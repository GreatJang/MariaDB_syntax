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

--테이블 컬럼상세조회
SHOW FULL COLUMNS FROM author;

--테이블 생성문 조회
SHOW CREATE TABLE posts;
--  CREATE TABLE `posts` (
--    `id` int(11) NOT NULL,
--    `title` varchar(255) DEFAULT NULL,
--    `content` varchar(255) DEFAULT NULL,
--    `author_id` int(11) DEFAULT NULL,
--    PRIMARY KEY (`id`),
--    KEY `author_id` (`author_id`),
--    CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

-- 테이블 제약조건 조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'posts';

-- 테이블 index 조회
-- 제약조검 정보조회와 인덱스조회는 상당수 일치(pk, fk 제약조건은 인덱스를 생성)
-- 인덱스란 조회의 성능을 높이기 위한 별도 페이지라 이해하면 될것
-- 제약조건을 걸면 index도 같이 조회된다.
SHOW INDEX FROM posts;

-- ALTER 문
-- 테이블 이름 변경
ALTER TABLE posts RENAME post;

-- 테이블 컬럼추가
ALTER TABLE author ADD COLUMN role VARCHAR(50)

-- 테이블 컬럼 변경
ALTER TABLE author MODIFY COLUMN name VARCHAR(100) NOT NULL;

-- 컬럼 이름 변경
ALTER TABLE post CHANGE COLUMN content contents VARCHAR(255);

-- 컬럼 삭제
ALTER TABLE author DROP COLUMN test1;