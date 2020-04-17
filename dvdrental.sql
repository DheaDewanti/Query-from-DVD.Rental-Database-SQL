/*A customer want to know the films about ‘astronaut’. How many reccomendation could you give for her?*/
select count(description) from film where description ilike 'Astronaut%';
select count(description) from film where description ilike '%Astronaut';
select count(description) from film where description ilike '%Astronaut%';
/*There are 78 films. This is a list of films*/
select title, description from film where description ilike '%Astronaut%';

/*How many film have a rating of ‘R’ and a replacement cost between $5 and $15?*/
select count(title) from film where rating='R' and replacement_cost >= 5 and replacement_cost <= 15;
/*There are 52 films. This is a list of films*/
select title, rating, replacement_cost from film where rating='R' and replacement_cost >= 5 and replacement_cost <= 15;

/*How many payments did each staff member handle? And how much was the total amount processed by each staff member?*/
select staff_id, name, count(amount), sum(amount)
from payment
join staff_list on payment.staff_id=staff_list.id
group by staff_id, name;

/*Corporate headquarters is auditing the store, they want to know the average replacement cost of movies by rating*/
select rating, avg(replacement_cost) from film group by rating;

/*We want to send coupons to the 5 customers who have spent the most amount of money. Get the customer name, email and their spent amount*/
select name, email, sum(amount)
from payment
join customer on payment.customer_id=customer.customer_id
join customer_list on payment.customer_id=customer_list.id
group by payment.customer_id, name, email
order by  sum(amount) desc
limit 5;

/*We went to audit our stock of films in all of our store. How many copies of each movie in each store do we have?*/
select title, store_id, count(inventory.film_id)
from inventory
join film on inventory.film_id=film.film_id
group by inventory.film_id, inventory.store_id, title
order by inventory.film_id;

/*We want to know what customers are egilible for our platinum credit card. The requirements are that the customer has at least a total 40 transaction payments. Get the customer name, email who are egilible for the credit card.*/
select name, email, count(amount)
from payment
join customer on payment.customer_id=customer.customer_id
join customer_list on payment.customer_id=customer_list.id
group by payment.customer_id, name, email
having count(amount)>=40;


