select * from tab;
-- 시퀀스 생성
create sequence person_idx_seq;
-- 테이블 생성
create table person(
	idx number primary key, -- 오라클은 primary key를 sequence 통해서 생성하는게 좋음
	name varchar2(20) not null,
	age number default 0,
	gender char(1) CONSTRAINT gender_chk check(gender IN ('F','M')) -- CONSTRAINT : 제약조건
);

select * from tab;

select * from person;
insert into person (idx, name, gender) values (person_idx_seq.nextval,'한사람', 'M'); -- person_idx_seq.nextval : 하나씩 늘어남
insert into person (idx, name, gender) values (person_idx_seq.nextval,'두사람', 'F');
select * from person;

insert into person values (person_idx_seq.nextval, '네사람', 34, 'F');
select * from person;
commit;

