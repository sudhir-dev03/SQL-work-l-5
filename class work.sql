USE WORLD;
SELECT*FROM COUNTRY WHERE INDEPYEAR = 1991; 
SELECT NAME,CONTINENT FROM COUNTRY WHERE INDEPYEAR = 1991;
SELECT*FROM COUNTRY WHERE CONTINENT IN ('ASIA','AFRICA');
SELECT*FROM COUNTRY WHERE INDEPYEAR NOT BETWEEN 1960 AND 1991;
SELECT*FROM COUNTRY WHERE INDEPYEAR NOT IN (1960,1991);


SHOW TABLES;
SELECT*FROM COUNTRY;
-- COUNTRY NAME AND CONTINENT WHERE THE REGION IS NOT SOUTH EUROPE 
SELECT*FROM COUNTRY WHERE REGION != 'SOUTHERN EUROPE';  
-- GET THE COUNTRY NAME ,CONTINENT,POPULATION, ALONG WITH 10% INCREMENT IN THE POPULATION 
SELECT*FROM COUNTRY WHERE POPULATION*1.1;
-- GET ALL THE COLUMNS THE WHERE THE LIFE EXPENTANCY IS EITHER 75.1 OR 77.8 OR 63.7 
SELECT*FROM COUNTRY WHERE LifeExpectancy IN (75.1,77.8,63.7);
-- GET THE COUNTRY NAME ,POLPULATION,REGION,WHERE THE POPULATION SHOULD NOT BE FROM 5000 TO 300000
select*from country where population between 5000 and 300000;


-- like operator 
-- match a pattern\
-- % : it is a special character / wild card character 
-- % : zero or more character 
-- _(underscore) : used for single character 

select * from country where name like 'an%'; 

-- get the country name and the continent where the conti start with the letter n 
SELECT NAME,CONTINENT FROM COUNTRY WHERE NAME LIKE 'N%';

-- get the name an d the continent where second last letter character is p 
SELECT NAME , CONTINENT FROM COUNTRY WHERE NAME LIKE '%P_';

-- get the countries which have where a continnent have min 4 chracter 
SELECT NAME FROM COUNTRY WHERE NAME LIKE '____';

-- get the name and cont where the 2 letter is a and second last letter is a from the region column
SELECT NAME,CONTINENT FROM COUNTRY WHERE NAME LIKE 'A%A_';

-- in region whre the third character is c and the last the 3 character is sia
SELECT*FROM COUNTRY WHERE REGION LIKE '__C%SIA';

-- get the name and region where the continent is north america or south america 

SELECT NAME,REGION FROM COUNTRY WHERE CONTINENT IN ('SOUTH AMERICA', 'NORTH AMERICA');




-- day - 4 ------
-- FUNCTIONS IN SQL 

-- CASE CONVERSION FUNCTION -- THIS FUNCTION IS USED TO CONVERT THE CASE (UPPER CASE OR LOWER CASE )
USE WORLD;
SELECT NAME, UPPER(NAME),LOWER(NAME) FROM COUNTRY; -- TO SHOW THE 
SELECT NAME, CODE, CONCAT(NAME,'--',CODE) FROM COUNTRY; -- TO SEPRATE TWO COLUMNS 
SELECT NAME ,CODE, CONCAT_WS('-',NAME,CODE,'SUDHIR') FROM COUNTRY;  -- CONCATE_WS IS USED TO SHOW THAT WITH SAPERATOR
SELECT NAME ,CODE, CONCAT(NAME,' ',CODE) FROM COUNTRY WHERE CONCAT(NAME, ' ' , CODE) = 'AFGHANISTAN AFG';

-- NAME , CONTI , REGION WHERE CONTINENT IN THE REGION THE CONTINENT NAME SHOULD BE PRESENT 

SELECT NAME, REGION, CONTINENT FROM COUNTRY WHERE REGION LIKE CONCAT('%',CONTINENT);

-- FIND THE COUNTRY NAME WHERE THE COUNTRY NAME IS SAME AS REGION 

SELECT NAME, REGION FROM COUNTRY WHERE NAME LIKE REGION;

-- NAME CONTI AND POP WHERE THE FIRST CHARACTER OF CONTINENT SHOULD BE SAME AS OF COUNTRY 

-- LEFT STRING FUNCTION USED TO FIND THE SAME CHARACTER IN DIFFRENT 
SELECT NAME, CONTINENT, POPULATION FROM COUNTRY WHERE LEFT(CONTINENT,1) = LEFT(NAME,1);

SELECT name, capital, continent
  FROM world
 WHERE name like capital;
 
 use world;
 -- sub string fuction 
 select name, substr(name,2),substr(name,2,4) from country;

select name, substr(name,2),substr(name,-4,2) from country;

-- give the country name where the countries first character is same as continents first character

select name , substr(name,1,1) , substr(continent,1,1) from country where substr(name,1,1) = substr(continent,1,1);

-- get the country name and popyulation where the staring three char of the country is alg 

select name ,population from country where substr(name,1,3) = 'alg';

-- instr == it means to find inside the string 

select name, instr(name,'e') from country;

-- char_length = used to find the length of the string

select name, char_length(name) from country;


-- trim == used to remove spaces
-- there are various alternatives of trim 1. rtrim     2. ltrim 

select char_length ('      tushar     ');
select char_length(trim('    tushar   '));

select name , trim(both 'a' from name) from country ;

select name , trim(both 'A' from trim(both 'a' from name) ) from country ;

-- lpad or rpad ==  when we want to define a column with fixed size 

SELECT NAME , POPULATION, LPAD(POPULATION , 9 ,'0' ) FROM COUNTRY;

use world;
select lifeexpectancy ,round(lifeexpectancy) from country;

select 6.0012 , round(637.0172,3);

-- truncate == to extract the value it only removes the the value

select 456.68 , truncate(3657.765,1);

-- mod
select mod(10,3);

-- ceil
select ciel(4.000001);
-- floor\

-- pow(2,4)
select pow(2,4);

-- *** date function == now()
select now(),current_date(),current_time(),current_timestamp();

-- ** add date function == by default date add (month,year,time)
select now(), adddate( now() , 2); -- to add date or we can use -2 for minus the date 
select now(), adddate( now() , interval 2 month); -- to add month or year for year use use year instead of month

-- extract function == we use it to get everything by one function 
-- extract( year / month / hour / minute / week )
select now(), extract( week from now() );

-- date_format function == extract but with a string (message)
select now(), extract(year from now()),date_format(now(), 'year is %h');



-- distinct keyword

select distinct continent from country;
select distinct continent, region from country;

-- aggrigate function ( multi line function ) = > will give ypu some result 
-- to apply some calculation in the set of rows
use world;
select * from country;
select indepyear from country;

-- count 
select count(indepyear) from country;
select count(*) from country;
select count(population) from country;

-- sum 
select sum(population) from country;

-- average
select avg(population) from country;

-- maximum
select max(population) from country;

-- minimum
select min(population) from country;


-- in asia continent the countries which are indepent 
select count(*) from country where continent = 'Asia';


-- get the total country and total region along with the avg lifeexpantancy and the total population for the country is who have the independence after 1947 and before 1998 
select * from country;
select count(name) , count(region), avg(lifeexpectancy),sum(population), indepyear from country where indepyear > 1947 and indepyear < 1998 ; 


-- get the total number of countries the unique regions along with the total population and the highest life expectancy rate with the the total capitals for the countries starting with the letter a and d 
select count(name) , count(distinct region) , sum(population) , max(lifeexpectancy) , sum(capital) from country where name like 'A%' or name like 'D%';


-- group by -- it collect the similar values in a group

select continent, count(name) from country group by continent ;
select count(name) from country where continent = 'Asia';


select * from country;

-- find out the total countries and the total population for each indepent year 
select count(name) , sum(population) ,indepyear from country group by indepyear; 

-- we cannot use any other column with the groupby clause it should be same 
use world;
select continent , count(name) from country group by continent ;  -- we can use anothe column with any agggregate function 


select continent , count(name ) from country where indepyear > 1950 group by continent ;

-- HAVING CLAUSE -- HAVING WILL ONLY USE WITH GROUP BY AND WHEN WE HAVE TO FILTER THE CALCULATED DATA 
SELECT CONTINENT , COUNT(NAME) FROM COUNTRY GROUP BY CONTINENT HAVING COUNT(NAME) > 30 ;

-- FIND OUT TOTAL POPULATION IN EACH CONTINENT 
SELECT CONTINENT , sum(POPULATION) FROM COUNTRY group by CONTINENT HAVING sum(POPULATION) > 78447500;

-- FIND EACH YEAR HOW MANY COUNTRIES INDEPENDENT WHO GOT THE INDEPENDENCE AFTER 1930

SELECT INDEPYEAR , COUNT(INDEPYEAR) FROM COUNTRY WHERE INDEPYEAR > 1930 group by INDEPYEAR HAVING COUNT(INDEPYEAR) > 2;

-- GET GOVERMENTFORM  AND THE TOTAL  NUMBER OF COUNTRIES FOR EACH GOV FORM WHERE THE TOTAL COUNTRIES SHOULD BE GREATER THEN 20 

select GovernmentForm , count(name) from country group by GovernmentForm having count(name) > 20 ;

-- GET GOVERMENTFORM  AND THE TOTAL NUMBER OF COUNTRIES WHERE THE COUNTRY SHOULD HAVE CAPITAL GREATER THEN 30

select GovernmentForm , count(Capital) , count(name)  from country group by GovernmentForm having count(Capital) > 30  ; 

-- GET THE NUMBER OF COUNTRIES REGIONS AND THE TOTAL POPULATION WHERE LIFEEXPECTANCY SHOULD BE GRATER THEN 38 AND THE POPULATIONS IN EACH CONTINENT SHOULD BE GRATER THEN 3 LAK

select continent ,count(name) , count(region) , sum(population) from country where lifeexpectancy > 38 group by continent having sum(population) > 300000 ;

