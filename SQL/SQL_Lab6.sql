#1
select c.Name, c.Population, cl.Language, co.Name
from city c, country co, countrylanguage cl
where c.CountryCode = co.Code and co.Code = cl.CountryCode and cl.IsOfficial = "T" and
co.Continent = "North America" and c.ID = co.Capital
order by c.Population desc;

#2
select co.HeadOfState, count(c.Name) as cities
from city c, country co
where c.CountryCode = co.Code and GovernmentForm like "%monarch%"
group by HeadOfState
order by count(*) desc
limit 3;

#3
select c.Name, count(film_id) as films
from film_category fc
join category c on fc.category_id = c.category_id
group by name
order by films desc
limit 3;

#4
select email, sum(amount) as total, count(payment_id) as transactions, avg(amount) as avg_spend
from customer c
join payment p on c.customer_id = p.customer_id
group by email
having total > 120 and transactions > 28 and transactions < 35 and avg_spend > 5
order by total desc;