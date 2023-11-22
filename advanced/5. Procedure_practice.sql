-- ===== 프로시저 실습 1 =====

delimiter //
create procedure getUser(IN userid INT)
BEGIN
select * from author where id = userid;
end //
delimiter ;

call getUser(1);


-- ===== 프로시저 실습 2 =====
-- post 테이블에 쉽게 insert할 수 있는 post 관련 프로시저 생성

delimiter //
create procedure getinsert(IN i_title VARCHAR(255), IN i_contents VARCHAR(3000), IN i_author_id INT)
BEGIN
insert into post(title, contents, author_id) values(i_title, i_contents, i_author_id);
end //
delimiter ;

select * from post;

call getinsert('Hello', 'HelloHello', 1);

-- ===== 프로시저 실습 3 =====
-- 프로시저 if문 실습 정답
DELIMITER //
CREATE PROCEDURE getif2(IN i_id INT)
BEGIN
  DECLARE i INT DEFAULT 0;

  SELECT avg(price) INTO i
  FROM post
  WHERE author_id = i_id;

  IF i >= 30000 THEN
    SELECT "고액 원고료 작가입니다." AS result;
  ELSE
    SELECT "고액 원고료 작가가 아닙니다." AS result;
  END IF;

END //
DELIMITER ;

SELECT avg(price)
FROM post
where author_id =3 ;

call getif2(4);

-- 내풀이
delimiter //
create procedure getif(IN i_id INT)
BEGIN
	DECLARE i INT DEFAULT 0
	select i_id into i
	if price >= 30000 THEN
    "고액 원고료 작가입니다."
	ELSE
	"고액 원고료 작가가 아닙니다."
END IF;

end //
delimiter ;

select * from post;

call getinsert('Hello', 'HelloHello', 1);

show create procedure getinsert;
"고액 원고료 작가입니다."
"고액 원고료 작가가 아닙니다."

-- ===== while문 실습 =====
DECLARE a int DEFAULT 0;

while a<10 DO

SELECT “ HELLO WORLD”;

END WHILE;


-- ===== 프로시저 while 문 실습 =====

DELIMITER //
CREATE PROCEDURE getwhile()
BEGIN
DECLARE counter INT DEFAULT 1;
WHILE counter <= 1000 DO
-- while 문으로 counter 올리기
insert into post(title) values(concat("hello",counter));

-- 반복할 작업 = post테이블 title 컬럼에 hello를 counter번호에 맞게 추가 ex.) hello1~hello1000
SET counter = counter + 1;

-- 종료 조건 = while 문으로 counter 올리기
END WHILE;

END //
DELIMITER ;