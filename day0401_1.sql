/*
USE world;
DROP TABLE tmp_table;
SHOW TABLES;
desc eagles;

SELECT * FROM wp_options;
rename table wp_option to wp_options; 
*/

/*
create table address_table (
	num INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(10),
	tel VARCHAR(20),
	address VARCHAR(50)
);

ALTER TABLE address_table ADD sex CHAR(2) NOT NULL;
ALTER TABLE address_table ADD info VARCHAR(20) after sex;
ALTER TABLE address_table DROP name;
DESC address_table;
DROP TABLE address_table;
ALTER TABLE address_table ADD sex char(2) NOT NULL DEFAULT '남' AFTER name;

ALTER TABLE address_table CHANGE num a_id INT(8);
ALTER TABLE address_table CHANGE a_id a_id INT(8) UNSIGNED AUTO_INCREMENT;
ALTER TABLE address_table CHANGE name name VARCHAR(10) NOT NULL;

ALTER TABLE address_table MODIFY sex CHAR(2) NOT NULL DEFAULT '남' AFTER a_id;
ALTER TABLE address_table MODIFY tel VARCHAR(20) AFTER sex;
ALTER TABLE address_table MODIFY tel VARCHAR(20) FIRST;

*/

SELECT * FROM city limit 5;
SELECT * FROM city ORDER BY ID DESC limit 5;

SELECT * FROM city WHERE CountryCode='kor';
SELECT * FROM city WHERE District='kyonggi';
SELECT Name, Population FROM city WHERE District='kyonggi';
SELECT * FROM city WHERE district='kyonggi' AND population>500000;
SELECT district FROM city where countrycode='kor';
SELECT distinct district from city where countrycode='kor';
SELECT * FROM mysql.help_relation;
USE world;
SELECT * FROM city WHERE district='chollanam' or district='chollabuk' or district='kwangju';
/* ************************************************************************************************ */
SELECT * FROM city WHERE countrycode='kor' and population>1000000 and population%2=0;
SELECT * FROM city WHERE countrycode='kor' and population between 1000000 and 2000000;
SELECT * FROM city WHERE countrycode='kor' and name like 'tae%';
SELECT * FROM city WHERE countrycode='kor' and population>1000000 and not name like 'tae%';

SELECT * FROM city WHERE district='kyonggi' order by name;
SELECT * FROM city WHERE district='kyonggi' order by name desc;
SELECT name FROM city WHERE district='kyonggi' order by population desc limit 1;
SELECT * FROM city WHERE countrycode='kor' order by district, population;
SELECT * FROM city WHERE countrycode='kor' order by district desc, population desc;
/* ************************************************************************************************ */
SELECT count(*) FROM city where countrycode='kor';
SELECT sum(population) FROM city where countrycode='kor';
SELECT avg(population) FROM city where countrycode='kor';
SELECT max(population) FROM city;
SELECT * FROM city where countrycode='kor' order by population desc limit 1;
SELECT min(population) FROM city;
SELECT min(population), max(population), avg(population), sum(population) FROM city WHERE countrycode='kor';

SELECT group_concat(name) FROM city WHERE district='chungchongnam';
SELECT group_concat(name) FROM city WHERE district='chungchongbuk';
SELECT group_concat(distinct district) FROM city WHERE countrycode='kor';
SELECT group_concat(name) FROM city WHERE countrycode='kor' and district=name;
select * from city where countrycode='kor' group by district;
SELECT district, count(*) FROM city WHERE countrycode='kor' group by district;
SELECT district, count(*) FROM city WHERE countrycode='kor' group by district having count(*)=6;
SELECT district, count(*) FROM city WHERE countrycode='kor' group by district having count(*)>=6 order by count(*) desc;
/* ************************************************************************************************ */
SELECT countrycode, count(*) FROM city group by countrycode having count(*)>=50;
SELECT countrycode, count(*) FROM city group by countrycode having count(*)>=50 order by count(*) desc;

desc country;
desc city;
SELECT city.Name, city.Population, country.Name FROM city
 inner join country on city.CountryCode = country.Code order by city.Population desc limit 10;
SELECT city.Name, city.Population, country.Name FROM city
 inner join country on city.CountryCode = country.Code WHERE city.CountryCode='JPN' order by city.Name;
SELECT city.Name, city.Population, country.Name FROM city
 inner join country on city.CountryCode = country.Code WHERE city.Population>7000000 order by city.Name;
SELECT * FROM country limit 10;
SELECT continent, sum(SurfaceArea) FROM country group by continent order by sum(SurfaceArea) desc;
SELECT * FROM city;
SELECT * FROM country;
SELECT country.name, sum(city.population) from city
 inner join country on city.CountryCode = country.Code
 group by city.countrycode order by sum(city.population) desc limit 10;
/* ************************************************************************************************ */
UPDATE city SET name='Siheung' WHERE countrycode='kor' and name='Shihung';
SELECT * FROM city WHERE  countrycode='kor' and name like 's%';
UPDATE city SET name='Siheung', population=153443 WHERE countrycode='kor' and name='Siheung'; 

INSERT INTO city VALUES (default, 'Gimpo', 'KOR', 'Kyonggi', 200001);
SELECT * FROM city WHERE district='Kyonggi' and population=200001;
INSERT INTO city (name, countrycode, district, population) values ('Hwasong', 'KOR', 'Kyonggi', 312345);
SELECT * FROM city WHERE district='Kyonggi' and population=312345;
/* ************************************************************************************************ */
CREATE TABLE citycopy like city;
desc citycopy;
SELECT * FROM citycopy;
INSERT INTO citycopy SELECT * FROM city;
INSERT INTO city (name, countrycode, district, population) values ('Osan', 'KOR', 'Kyonggi', 201234), ('Pochon', 'KOR', 'Kyonggi', 156789);
SELECT * FROM city order by id desc limit 3;
DELETE FROM city WHERE id=4082;
SELECT * FROM CITY ORDER BY id desc limit 3;

SHOW TABLES;
CREATE VIEW large_city as select * from city
 where population>7000000 with check option;
SELECT * FROM large_city;
SHOW TABLES;
/* ************************************************************************************************ */
CREATE view kor_city as select id, name, district, population from city where countrycode='kor';
SELECT * FROM kor_city;
SELECT district, name, population FROM kor_city as c1 /* as : aliasing */
 WHERE population > (SELECT avg(population) from kor_city as c2 WHERE c1.district = c2.district group by district);
