#1
select title
from sakila.film
where title like "%game%";

#2
select *
from film
order by release_year DESC limit 3;

#3
select first_name, last_name
from actor
where last_name like "%queen%";

#4
select playerID
from awards_players
where year = 1989;

#5
select id
from players_teams
where year = 1998 and points > 400 and minutes < 900

#6
select name, homeWon
from teams
where name like "%Chicago%" and year = 1984;

#7
select *
from city
where Population > 1000000
order by Name ASC;

#8
select *
from country
where not LocalName = Name;