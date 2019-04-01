/*
alter database world default character set utf8;
show variables like 'char%';
create table if not exists address_book (
    no int(4) unsigned not null auto_increment,
    name varchar(10) not null,
    tel varchar(14),
    nickname varchar(20),
    primary key(no)
);
desc address_book;
insert into address_book(name, tel, nickname) values('김태균','010-2345-5432','누구 남편');
update address_book set nickname='석류 남편' where no=10001;

insert into address_book(name, tel, nickname) values('전우치','010-9876-5432','의적');
insert into address_book(name, tel, nickname) values('박씨부인','010-1111-2222','');
insert into address_book(name, tel, nickname) values('이용규','010-4321-1234','용규놀이');
delete from address_book where no=10005;
insert into address_book(name, tel, nickname) values('이용규','010-4321-1234','용규놀이');
insert into address_book(name, tel, nickname) values('흥부','010-0101-1010','가난해');
insert into address_book(name, tel, nickname) values('놀부','010-1010-0101','부자야');
insert into address_book(name, tel, nickname) values('제비','010-8282-8282','은혜갚기'), ('박씨','010-9999-8888','금은보화');
update address_book set nickname='현모양처' where no=10004;

select * from address_book order by name desc;
select * from address_book where (no<10006) order by name desc;

alter table address_book add story varchar(20) not null;

update address_book set story='야구' where no=10001;
update address_book set story='홍길동전' where no=10002;
update address_book set story='전우치전' where no=10003;
update address_book set story='박씨부인전' where no=10004;

insert into city values (default, 'Gimpo', 'KOR', 'Keonggi');
drop table address_book;
*/


update address_book set story='야구' where no=10001;
update address_book set story='홍길동전' where no=10002;
update address_book set story='전우치전' where no=10003;
update address_book set story='박씨부인전' where no=10004;

select * from address_book;
