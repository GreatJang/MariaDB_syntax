-- ===== VIEW 실습 =====

create view author_for_view as select name, email FROM author

SELECT * FROM board.author_for_view;

grant select on board.author_for_view TO 'testuser'@'%';

show grants for 'testuser'@'%';