 /* ************************************************************************************************ */
SELECT now();
use world;
CREATE TABLE date_table(
	id int auto_increment primary key,
	datetime datetime default now()
) auto_increment=101;
SELECT * FROM date_table;
INSERT INTO date_table (datetime) VALUES ('2017-08-28 17:22:21'), ('2017-02-15 10:22:24'), ('2017-12-09 22:13:24'), ('2018-07-08 20:15:18');
INSERT INTO date_table VALUES (default, default);

SELECT datetime FROM date_table where id=101;
SELECT date_format(datetime, '%Y-%m-%d %r') FROM date_table WHERE id=101;
SELECT date_format(datetime, '%Y년 %m월 %d일 %W, %H시 %i분 %s초') FROM date_table WHERE id=101;
SELECT date_format(datetime, '%p %h:%i:%s') FROM date_table where id=103;

SELECT now(), curdate(), curtime();
SELECT date_add(now(), interval 2 MONTH); /* 오늘부터 2달 후 날짜 */
SELECT date_sub(now(), interval 5 MONTH);
SELECT to_days('2019-11-14') - to_days(now());	/* to_daye : AD 기원전후 기준으로 몇일인지 */
SELECT dayofweek(datetime) FROM date_table;	/* 일요일 : 1 */
SELECT date(datetime), time(datetime) FROM date_table;
/* 시간 필드 */
 /* ************************************************************************************************ */
SELECT * FROM countrylanguage;
desc countrylanguage;
SELECT countrylanguage.*, country.name FROM countrylanguage
 inner join country on countrylanguage.countrycode=country.code
 where language='korean';
SELECT city.*, country.Name FROM city left outer join country
 on city.CountryCode=country.code where city.countrycode='kor';
 /* same as */
SELECT city.*, co.Name FROM city left outer join country as co
 on city.CountryCode=co.code where city.countrycode='kor';
/* ************************************************************************************************ */
CREATE TABLE girl_group (
	_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL,
	debut DATE NOT NULL,
	hit_song_id INT
) DEFAULT CHARSET=UTF8;
 
CREATE TABLE song(
	_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(32) NOT NULL,
	lyrics VARCHAR(32)
) DEFAULT CHARSET=UTF8; 
 
INSERT INTO song(_id, title, lyrics) VALUES (101, 'Tell Me', 'tell me tell me tetetete tell me');
INSERT INTO song(title, lyrics) VALUES ('GEE', 'GEE GEE GEE GEE GEE BABY BABY'),
 ('미스터', '이름이 뭐야 미스터'), ('Abracadabra', '이러다 미쳐 내가 여리여리'), 
 ('8282', 'Give me a call Baby baby'), ('기대해', '기대해'),
 ('I Don\'t car', '다른 여자들의 다리를'), ('Bad Girl Good Girl', '앞에선 한 마디 말도'),
 ('피노키오', '뉴예삐오'), ('별빛달빛', '너는 내 별빛 내 마음의 별빛'), 
 ('A', 'A 워오우 워오우워 우우우'), ('나혼자', '나 혼자 밥을 먹고 나 혼자 영화 보고'),
 ('LUV', '설레이나요'), ('짧은치마', '짧은 치마를 입고 내가 길을 걸으면'),
 ('위아래', '위 아래 위위 아래'), ('Dumb Dumb', '너 땜에 하루종일');
INSERT INTO girl_group(name, debut, hit_song_id) VALUES ('원더걸스', '2007-09-12', 101),
 ('소녀시대', '2009-06-03', 102), ('카라', '2009-07-30', 103),
 ('브라운아이드걸스', '2008-01-17', 104), ('다비치', '2009-02-27', 105),
 ('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
 ('시크릿', '2011-01-06', 110), ('레인보우', '2010-08-12', 111);
INSERT INTO girl_group(name, debut) VALUES
 ('에프터 스쿨', '2009-11-25'), ('포미닛', '2009-08-28');
 
SELECT * FROM girl_group;
SELECT * FROM song;

UPDATE girl_group SET debut='2007-02-10' WHERE _id=1;
UPDATE girl_group SET debut='2007-08-02' WHERE _id=2;
/*
DELETE FROM girl_group WHERE hit_song_id=112;
DELETE FROM girl_group WHERE hit_song_id=113;
*/
SELECT gg._id, gg.name, s.title FROM girl_group AS gg
 INNER JOIN song AS s ON s._id=gg.hit_song_id;

/* A(girl_group) 다 출력(B(song) 정보 가져와서) : A U B 에서 A left join B */
SELECT gg._id, gg.name, s.title FROM girl_group AS gg
 LEFT OUTER JOIN song AS s ON s._id=gg.hit_song_id;

SELECT gg._id, gg.name, s.title FROM girl_group AS gg
 RIGHT OUTER JOIN song AS s ON s._id=gg.hit_song_id;

/* ************************************************************************************************ */
/* 1 */
SELECT * FROM girl_group WHERE debut BETWEEN '2009-01-01' AND '2009-12-31';

/* 2 */
SELECT gg.name, gg.debut, s.title FROM song AS s
 INNER JOIN girl_group AS gg
 ON s._id=gg.hit_song_id AND gg.debut>'2009-01-01' AND gg.debut<'2009-12-31';

/* 3 대륙별로 국가숫자, GNP의 합, 평균 국가별 GNP는? */
SELECT * FROM country;
SELECT Continent, count(Name), sum(GNP), avg(GNP) FROM country group by Continent;

/* 4 아시아 대륙에서 인구가 가장 많은 도시 10개를 내림차순으로 보여줄 것 (대륙명, 국가명, 도시명, 인구수) */
SELECT * FROM country;
SELECT * FROM city;
SELECT co.Continent, co.Name, ci.Name, ci.Population FROM country  AS co 
 INNER JOIN city AS ci ON co.Continent='Asia' and co.Code=ci.CountryCode order by ci.Population desc limit 10;

/* 5 전 세계에서 인구가 가장 많은 10개 도시에서 사용하는 공식언어는? (도시명, 인구수, 언어명) */
SELECT * FROM city;
SELECT * FROM countrylanguage;
SELECT countrycode, group_concat(language) FROM countrylanguage group by CountryCode;

SELECT ci.Name, ci.Population, group_concat(DISTINCT col.language) FROM city AS ci
 INNER JOIN countrylanguage AS col
 ON ci.CountryCode=col.CountryCode and col.isOfficial='T'
 GROUP BY col.CountryCode 
 order by ci.Population desc limit 10;
SELECT * FROM date_table;