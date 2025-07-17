 // SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world


// Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population >= 200000000


//Give the name and the per capita GDP for those countries with a population of at least 200 million.

select name, gdp / population 
from world
where population >= 200000000

//Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

select name , population/ 1000000
from world
where continent like 'South America'

//Show the name and population for France, Germany, Italy

SELECT name, population
  FROM world
 WHERE name IN ('France', 'Germany', 'Italy');

// Show the countries which have a name that includes the word 'United'


select name
from world
where name like 'United%';

//Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.



select name,population,area 
from world
where population > 250000000 or
 area > 3000000 ;

//Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

select name,population,area 
from world
where population > 250000000 xor
 area > 3000000 ;

// Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

select name , round(population/1000000,2),round(gdp/1000000000,2)
from world
where continent = 'South America'

// Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

select name , round(gdp/population,-3)
from world
where gdp >= 1000000000000

// Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
  FROM world
 WHERE length(name) = length(capital)

// Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
where left(name,1) = left(capital,1) and
name <> capital


//Find the country that has all the vowels and no spaces in its name.

SELECT name
   FROM world
WHERE name LIKE '%e%'
  AND name LIKE '%a%' and
name LIKE '%i%' and name NOT LIKE '% %' and name LIKE '%u%' and name LIKE '%o%'






