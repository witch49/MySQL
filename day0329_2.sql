/*
create table if not exists Eagles (
    player_back_number int(4) unsigned not null,
    player_name varchar(20) not null,
    player_position varchar(20),
    player_hometown varchar(20),
    player_throwing_hand varchar(20),
    player_hit_hand varchar(20),
    primary key(player_back_number)
);

insert into Eagles values(30,'자레드 호잉','좌익수','미국 오하이오주 포트로라미','우투', '좌타');
insert into Eagles values(52,'김태균','1루수','대한민국 충청남도 천안시','', '');
insert into Eagles values(8,'정근우','2루수','대한민국 부산광역시','우투', '우타');
insert into Eagles values(57,'정우람','투수','대한민국 부산광역시','좌투', '좌타');
insert into Eagles values(15,'이용규','외야수','대한민국 전라북도 군산시','좌투', '좌타');
insert into Eagles values(7,'송광민','내야수','대한민국 대전광역시','우투', '우타');
insert into Eagles values(50,'이성열','좌익수','대한민국 전라남도 순천시','우투', '좌타');
insert into Eagles values(1,'하주석','유격수','대한민국','우투', '좌타');
insert into Eagles values(46,'송은범','투수','대한민국 인천광역시','우투', '우타');
insert into Eagles values(22,'이태양','투수','대한민국 전라남도 여수시','우투', '좌타');
insert into Eagles values(13,'최재훈','포수','대한민국 서울특별시','우투', '우타');
insert into Eagles values(25,'최진행','좌익수','대한민국 서울특별시','우투', '우타');
insert into Eagles values(14,'강경학','유격수','대한민국 광주광역시','우투', '좌타');
insert into Eagles values(38,'안영명','투수','대한민국 충청남도 천안시','우투', '우타');

alter table Eagles add player_birth varchar(20) not null;
update Eagles set player_birth='19890518' where player_back_number=30;
update Eagles set player_birth='19820529' where player_back_number=52;
update Eagles set player_birth='19821002' where player_back_number=8;
update Eagles set player_birth='19850601' where player_back_number=57;
update Eagles set player_birth='19850826' where player_back_number=15;
update Eagles set player_birth='19830624' where player_back_number=7;
update Eagles set player_birth='19840713' where player_back_number=50;
update Eagles set player_birth='19940225' where player_back_number=1;
update Eagles set player_birth='19840317' where player_back_number=46;
update Eagles set player_birth='19900703' where player_back_number=22;
update Eagles set player_birth='19890827' where player_back_number=13;
update Eagles set player_birth='19850817' where player_back_number=25;
update Eagles set player_birth='19920811' where player_back_number=14;
update Eagles set player_birth='19841119' where player_back_number=38;

ALTER TABLE eagles ADD player_salary INT(20) AFTER player_hit_hand;
ALTER TABLE eagles CHANGE player_salary player_salary VARCHAR(20);
UPDATE eagles SET player_salary='1억 8,000만원' WHERE player_back_number=1;
UPDATE eagles SET player_salary='4억' WHERE player_back_number=15;
UPDATE eagles SET player_salary='80,0000달러' WHERE player_back_number=30;
UPDATE eagles SET player_salary='14억' WHERE player_back_number=52;
UPDATE eagles SET player_salary='2억 5,000만원' WHERE player_back_number=7;
UPDATE eagles SET player_salary='7억원' WHERE player_back_number=8;
UPDATE eagles SET player_salary='3억 2,000만원' WHERE player_back_number=50;
UPDATE eagles SET player_salary='8억원' WHERE player_back_number=57;
UPDATE eagles SET player_salary='1억 5,000만원' WHERE player_back_number=22;
UPDATE eagles SET player_salary='1억 2,5000만원' WHERE player_back_number=13;
UPDATE eagles SET player_salary='8,800만원' WHERE player_back_number=14;
UPDATE eagles SET player_salary='2억 5,000만원' WHERE player_back_number=46;
UPDATE eagles SET player_salary='2억원' WHERE player_back_number=25;
UPDATE eagles SET player_salary='3억 5,000만원' WHERE player_back_number=38;

*/

select * from Eagles;