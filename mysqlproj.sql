use sakila;
select * from actor;

SELECT CONCAT(first_name, ' ', last_name) AS ActorName FROM actor;

select * from actor where first_name = 'Joe';
select * from actor where last_name = 'GEN';
select * from actor where last_name = 'LI';

SELECT country_id,  country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor ADD description BLOB(30);
ALTER TABLE actor drop column description;

SELECT last_name, COUNT(*) AS `Count`FROM actor GROUP BY last_name;
SELECT last_name, COUNT(*) AS `Count`FROM actor GROUP BY last_name having count >2;

update actor set first_name = 'HARPO' where first_name = 'GROUCHO' and last_name = 'WILLIAMS';
update actor set first_name = 'GROUCHO' where first_name = 'HARPO' and last_name = 'WILLIAMS';

select * from address;
select * from staff;

select s.first_name, s.last_name, a.address, a.district, a.city_id 
from staff s, address a
where a.address_id = s.address_id;

select s.first_name, s.last_name, p.amount,p.payment_date 
from staff s, payment p
where p.staff_id = s.staff_id;

select s.first_name, s.last_name, sum(p.amount) 
from staff s, payment p
where p.staff_id = s.staff_id group by first_name, last_name;

select f.title, count(a.actor_id) as Total
from film f, film_actor a
where f.film_id = a.film_id group by f.title;

select f.film_id, title, count(1) from film f,inventory i 
where f.film_id = i.film_id
and  title ="Hunchback Impossible"
group by f.film_id, title;

select c.first_name,c.last_name,sum(p.amount)
from customer c, payment p
where c.customer_id = p.customer_id
group by first_name,last_name
order by c.last_name;

select title from film
where (title like 'K' or title like 'Q')
AND language_id=(SELECT language_id FROM language where name='English')



