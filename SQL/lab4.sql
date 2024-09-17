#1
select max(c.Population), min(c.Population)
from city c, country co
where CountryCode = Code and co.Name = "Italy";

#2
select sum(co.Population) as total
from countrylanguage cl, country co
where CountryCode = Code and cl.Language = "Spanish" and cl.IsOfficial = "T";

#3
select Name, Population, (select Name from country where country.Code = city.CountryCode) AS country,
(select Region from country where Country.Code = city.CountryCode) AS region
from city
order by Population desc limit 1

#4
SELECT pt.points, p.lastName, pt.year
FROM players_teams pt, players p
WHERE pt.playerID = p.playerID and p.lastName LIKE '%ire%' and year = 1998
and points > (select avg(points) from players_teams where year = 1998);

#5
select c.coachID, award, c.year, won
from coaches c, awards_coaches ac
where c.coachID = ac.coachID and ac.year = 1995 and c.year = 1995 and award = "NBA Coach of the Year"

#6
select *
from actor
where actor_id in (select actor_id from film_actor
where film_id in (select film_id from film
where title like "%pirates%"));

## or ##

select *
from actor a, film f, film_actor fa
where a.actor_id = fa.actor_id and
f.film_id = fa.film_id and
title like "%pirate%";

#7
select email, c.customer_id, sum(amount) as total
from customer c, payment p
where c.customer_id = p.customer_id
group by c.customer_id
having total > 220

#8
select a.first_name, a.last_name, count(title) as movies
from actor a, film f, film_actor fa
where a.actor_id = fa.actor_id and
fa.film_id = f.film_id
group by a.actor_id
order by movies desc
limit 1;