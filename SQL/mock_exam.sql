#1
select title, description, rental_rate, special_features
from film
where release_year >= 2006 and release_year <= 2008;

#2
select c.first_name, c.last_name, c.email, c.customer_id, a.phone, c.store_id
from customer c
join address a on a.address_id = c.customer_id
where c.store_id = 1
order by first_name asc;

#3
select Name, Population
from city
where Name like "%re%" and CountryCode in (select Code from country
where Continent = "Asia")
order by Population desc;

#4
select Language, sum((Population * (Percentage / 100))) as population, count(c.Name) as countries
from country c
join countrylanguage cl on c.Code = cl.CountryCode
group by Language
order by population desc
limit 10;

#5
select c.Name, count(Language) as languages
from country c
join countrylanguage cl on c.Code = cl.CountryCode
where Code in (select CountryCode from city
where Population >= 8000000)
group by c.Name
order by languages;

#6
select ac.ID, ac.coachID, ac.award, ac.year, c.won
from awards_coaches ac
join coaches c on ac.coachID = c.coachID and ac.year = c.year
where ac.year = 2000 and award = "NBA Coach of the Year";

#7
select t.name, c.coachID, t.won, t.year, t.tmID
from teams t
join coaches c on t.tmID = c.tmID and t.year = c.year
where t.year = 2000 and t.won > (select max(won) from coaches
where year = 1950)
order by t.name asc
limit 3;