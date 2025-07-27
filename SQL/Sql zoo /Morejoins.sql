-- 1. List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962


-- 2.Give year of 'Citizen Kane'.

select yr
from movie
where title = 'Citizen Kane'

-- 3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

select id,title,yr
from movie
where title like 'Star Trek%'
order by yr

-- 4.What id number does the actor 'Glenn Close' have?

select id
from actor 
where name = 'Glenn Close'

-- 5.What is the id of the film 'Casablanca'

select id 
from movie
where title = 'Casablanca'

-- 6.Obtain the cast list for 'Casablanca'.

select name
from casting join actor on (id=actorid)
where movieid = '11768'

-- 7.Obtain the cast list for the film 'Alien'

select name
from casting join movie on (movieid=id)
and join actor on (movieid=id)
where title = 'Alien'

--
