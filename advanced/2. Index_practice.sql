===== index 생성 실습 =====

CREATE INDEX author_name ON author(name);

create index author_name_email ON author(name,email);

describe author;

show index from author;