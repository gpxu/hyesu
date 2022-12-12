show tables;
drop table address;
show tables;

-- 테이블 생성
create table person(
	idx int primary key auto_increment, -- 기본키에 자동 증가
	name varchar(20) not null,
	age int default 0, -- 나이는 입력 안하면 0
	gender char(1) not null check(gender in ('F','M')) -- check : 어떤것만 저장하겠다고 지정 
);

show tables;
select * from person ;
insert into person (name, gender) values ('한사람', 'M');
insert into person (name, gender) values ('두사람', 'F');
insert into person (name, gender) values ('세사람', 'A'); -- 에러 체크제약에 걸린다.
select * from person ;

insert into person values (0, '네사람', 34 ,'F'); -- idx는 자동증가이기 때문에 0주면 알아서 들어감
select * from person;










