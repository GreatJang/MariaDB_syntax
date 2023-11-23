-- author_table 생성 = author_address테이블 분리
create table author_table(id INT PRIMARY KEY,
country VARCHAR(255),
state_city VARCHAR(255),
details VARCHAR(255),
zip_code INT,
phonenumber INT,
author_id INT,
FOREIGN KEY(author_id) REFERENCES author(id) on delete cascade);

-- post_author 테이블 생성
create table post_author(id INT PRIMARY KEY,
post_id INT,
author_id INT,
FOREIGN KEY(post_id) REFERENCES post(id), FOREIGN KEY(author_id) REFERENCES author(id));

-- post_author테이블 id 컬럼 auto_increment 설정
ALTER TABLE post_author MODIFY COLUMN id INT AUTO_INCREMENT;

-- post_author 테이블, post 테이블, author 테이블 join하여 데이터 값 추출
select pa.id, pa.post_id, pa.author_id, p.title, p.contents, a.name from post_author as pa inner join post as p on pa.post_id = p.id
inner join author as a on pa.author_id = a.id;

-- author_id 컬럼 unique 설정
ALTER TABLE author_table MODIFY COLUMN author_id int(11) UNIQUE