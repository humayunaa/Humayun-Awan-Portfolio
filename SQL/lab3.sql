#1
select title, description, length
from film
where length > 119 and description like "%wrestler%" and title like "%agent%";

#2
SELECT count(*) AS "movies 3hrs"
FROM film
WHERE length > 179;

#3
select title, film_id, rating
from film
where film_id in (select film_id from film_category
where category_id = (select category_id from category
where name = "Children"))

#4
SELECT year, avg(won) AS awon
FROM teams
group by year
having awon > 40;

#5
select coachID, sum(won) AS wins, sum(lost) AS losses
from coaches
group by coachID
having wins > 900 
order by losses asc

#6
SELECT playerID, tmID, minutes
from players_teams
where year = 1998 and minutes > 1200 and tmID in (select tmID from teams
where name like "%Miami%")

#7
select (select Name from country where Code = CountryCode) AS Country, count(*) AS cities
from city
where CountryCode in (select Code from country
where continent = "Europe" and Population > 90000000)
group by Country;

#8
SELECT Continent, Count(*), avg(LifeExpectancy)
FROM country
where continent in (select continent from country
group by continent
having avg(LifeExpectancy) > 45)
group by Continent
having avg(LifeExpectancy) > 45;

#9
select sum(population) as total
from country
where Code in (select CountryCode from countrylanguage
where Language = "Spanish" and IsOfficial = "T");