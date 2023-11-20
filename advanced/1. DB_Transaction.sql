===== 트랜잭션 예시 =====
- insert into author(id, name, email) values(5, 'test', 'test@naver,com');
- commit;
- insert into author(id, name, email) values(6, 'test', 'test@naver,com');
- insert into post(title, contents, author_id) values('hello', 'hello is', 10);
- rollback;

-- 1번째 줄 쿼리는 2번째 줄 commit으로 DB 영구저장 됌
-- 3번째 줄 쿼리는 트랜잭션으로 실행되었지만 commit은 안된상태(영구저장 X)
-- 4번째 줄 쿼리는 적용X DB fk때문에 일부로 안들어가는 쿼리
-- rollback 시 3번째줄 쿼리만 rollback.(4번째 쿼리는 이미 실패, 1번째 쿼리는 이미 Commit 완료