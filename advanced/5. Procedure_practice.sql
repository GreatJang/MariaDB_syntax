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