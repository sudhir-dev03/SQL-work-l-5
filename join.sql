-------------------------------------------------------- relation in tables 
use world;

-- city table
-- city(id PK) , countrycode is a foreign key 
select * from city;
describe city;

-- country table 
select * from country;
-- country (code PK)
select count(code),count(distinct code) from country;



-- ------------------------------------------------------------------------------JOIN in SQL -- used to join two tables -----------------------------------------------------------------------------------

select c.id, c.name, c.countrycode from city as c;
select cnt.code,cnt.name,cnt.continent from country as cnt; 

select c.id, c.name, c.countrycode,cnt.continent, cnt.code, cnt.name from city as c
join 
country as cnt 
where c.countrycode = cnt.code;


-- question - find the city name, population, the country name along with the goverment form for each city.

select cy.name, cy.population, cnt.name, cnt.governmentform  from city as cy join country as cnt 
where cy.countrycode = cnt.code;

-- question - find the country name is population and the language spoken with the percentage of each nlanguage 
select * from countrylanguage;
select cnt.name, cnt.population, cl.percentage, cl.language from country as cnt join countrylanguage as cl where cnt.code = cl.countrycode;
