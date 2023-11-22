===== 사용자 관리 실습 =====

CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'djemals';

show grants for 'testuser'@'localhost';

revoke select on board.author from 'testuser'@'localhost';

GRANT SELECT ON author TO 'testuser'@'localhost';

select * from mysql.user;

show grants for 'root'@'localhost';

flush privileges