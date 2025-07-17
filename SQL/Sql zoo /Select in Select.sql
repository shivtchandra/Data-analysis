-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select name
from world
where continent = 'Europe' and gdp/ population > ( select gdp /population from world where name = 'United Kingdom')

-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
  
select name , continent 
from world
where continent = (select continent from world where name like 'Argentina' ) or continent = (select continent from world where name like 'Australia')
order by name 

-- Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.

select name,population
from world
where population > (select population from world where name = 'united kingdom') and population < (select population from world where name = 'germany')

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

select name ,concat(cast(round(population * 100/ (select population from world where name ='germany') ,0)as int), '%')as percentage
from world 
where continent = 'europe'

-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

select name
from world
where gdp > ALL( select gdp from world where continent = 'europe' and gdp > 0)

-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name,area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

