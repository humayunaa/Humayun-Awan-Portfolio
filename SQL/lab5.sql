#1
select c.Name, c.Population, co.Name
from city c, country co
where c.CountryCode = co.Code and co.Name = "Italy"
order by c.Population desc
limit 3

#2
SELECT city.name AS city_name, city.population, country.name AS country_name, country.continent
FROM city, country
WHERE city.countrycode = country.code and city.population = (
    SELECT min(population)
    FROM city
);

#3
select count(*)
from payment
where amount >= (select (max(amount) - min(amount)) as differnece from payment);

#4
select f.title, f.film_id, fc.category_id, c.name as category, f.rating
from film f, film_category fc, category c
where f.film_id = fc.film_id and c.category_id = fc.category_id and
c.name = "Action" and f.title like "%Amadeus%";

## or ##

SELECT f.title, f.film_id
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
AND f.title LIKE '%Amadeus%';

# using JOIN INSTEAD OF WHERE  __ = __

#5
select c.customer_id, email, amount
from customer c
join payment p on c.customer_id = p.customer_id
where amount = (select max(amount) from payment)
order by customer_id asc
limit 3

#6
select p.playerID, p.height, pt.points, pt.year
from players p
join players_teams pt on p.playerID = pt.playerID
where height > (select height from players
where firstName = "Alaa" and lastName = "Abdelnaby") and year = 2011
order by points desc
limit 1;