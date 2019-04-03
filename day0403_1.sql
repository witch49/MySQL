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

