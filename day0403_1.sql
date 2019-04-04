/* 연습문제 1 */
create table member (
	id int(6) unsigned not null auto_increment primary key,
	password varchar(10) not null,
	name varchar(10) not null,
	birth int(6) unsigned not null default 0,
	address varchar(50)
) auto_increment=100001 DEFAULT CHARSET=UTF8;

select * from member;
desc member;

insert into member (password, name, birth, address) values ('asdf', '홍길동', 870101, '서울특별시 강남구');
insert into member (password, name, birth, address) values ('qwert', '전우치', 910321, '대전광역시 서구');
insert into member (password, name, birth, address) values ('1234', '박씨부인', 891231, '대전광역시 유성구');
insert into member (password, name, birth, address) values ('zxcv', '옹고집', 900708, '대전광역시 동구');
insert into member (password, name, birth, address) values ('4321', '흥부', 930921, '대전광역시 대덕구');
insert into member (password, name, birth, address) values ('fdsa', '놀부', 920524, '대전광역시 대덕구');
insert into member (password, name, birth, address) values ('12', '12', 920524, '12');

/* ************************************************************************ */
/* 연습문제 2 */
create table bbs (
	bbs_id int(6) unsigned not null auto_increment primary key,
	memberId int(6) unsigned not null,
	title varchar(50) not null,
	date datetime not null default current_timestamp,
	content varchar(400),
	FOREIGN KEY (memberId) REFERENCES member(id) on update cascade
) auto_increment=1 DEFAULT CHARSET=UTF8;

select * from bbs;
desc bbs;

UPDATE bbs SET title='자바강의', content='19년도 하기계절 계획서' where bbs.memberId = 100001;

UPDATE bbs SET title='하이', content='안녕하세요 자바 세상' WHERE memberId=100001 and bbs_id=3;

UPDATE bbs SET title='하이', date=date_format(now(), '%y-%m-%d %H:%i'), content='안녕하세요 자바 세상' WHERE memberId=100001 and bbs_id=3;

insert into bbs (memberId, title, content) values (100001, '자바2','자바2 강의');

insert into bbs (memberId, title, content) values (100005, '박씨','고전소설');
DELETE from bbs where bbs_id=6 and memberId=100005;

insert into bbs values(1, 100001, '자바 강의안', date_format(now(), '%y-%m-%d %H:%i'), '2019년도 자바 강의 계획안과 ppt 자료입니다.');

/* bbs_id 로 조회 */
select bbs.bbs_id, member.name, bbs.title, bbs.date, bbs.content
 from bbs inner join member on bbs.memberId = member.id
 order by date desc;
 
select bbs.bbs_id, member.name, bbs.title, bbs.date, bbs.content
 from bbs inner join member on bbs.memberId = member.id
 where bbs.bbs_id=1;