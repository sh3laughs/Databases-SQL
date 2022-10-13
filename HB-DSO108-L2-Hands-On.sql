-- DSO108 - Databases
	-- Lesson 2 - Joins
	-- Page 9 - Hands-On

-- Part 1 – Run the following queries:
	-- 1.  Write a query to find the first and last name, customer ID and 
		-- rental ID for customers who have rented a film.
select first_name as 'First Name', last_name as 'Last Name', 
	customer_id as 'Customer ID', rental_id as 'Rental ID'
from sakila.customer
join sakila.rental
using (customer_id);
-- output: select columns from customer and rental tables with 1k rows (per
	-- limit in action bar) with customers matched by their customer ID on 
    -- both tables

	-- 2.  Write a query that finds all films with actors that have an 
		-- actor_id 5.
select title as Title, first_name as 'First Name',
	last_name as 'Last Name', actor_id as 'Actor ID'
from sakila.film
join sakila.film_actor
using (film_id)
join sakila.actor
using (actor_id)
where actor_id = 5;
-- output: select columns from film, film_actor, and actor tables with 29 
	-- rows with films starring Johnny Lollobrigida, as matched by film
    -- and actor ID's

	-- 3.  Write a query that lists out all information of every film along 
		-- with the name of the language for each film, even if a language 
        -- doesn't exist for that film.
select title as 'Film Title', name as 'Language', description  
	as 'Description', rating as Rating, release_year as 'Release Year', 
    length as Length, special_features as 'Special Features', language_id 
    as 'Language ID', original_language_id as 'Original Language ID', film_id
    as 'Film ID', rental_duration as 'Rental Duration', rental_rate 
    as 'Rental Rate', replacement_cost as 'Replacement Cost', film.last_update
    as 'Film Last Update', language.last_update as 'Language Last Update'
from sakila.film
left join sakila.language
using (language_id);
-- output: all columns from film and language tables with 1k rows (per 
	-- limit in action bar), as matched by language ID's when possible

	-- 4.  Write a query that lists out the title of films and the name of 
		-- the actors who starred in those films. Additionally, only list 
        -- films that starred artists whose first names start with a vowel.
select title as Title, first_name as 'First Name', last_name as 'Last Name'
from sakila.film 
join sakila.film_actor
using (film_id)
join sakila.actor
using (actor_id)
where first_name
like 'a%'
or first_name
like 'e%'
or first_name
like 'i%'
or first_name
like 'o%'
or first_name
like 'u%';
-- output: select columns from film and actor tables with 665 rows with 
	-- films starring actors whose first names start with a vowel, as 
    -- matched by film and actor ID's


-- Part 2
	-- You have just been hired as a Data Analyst for a company that rents 
		-- films to customers. They would like an inventory list of films 
        -- that were rented for more than $4.99.
select rental.customer_id as 'Rental Customer ID', film_id as 'Film ID', 
	amount  as 'Rental Amount', rental_date as 'Rental Date', return_date 
    as 'Return Date', rental_id as 'Rental ID', store_id as 'Store ID', 
    rental.staff_id as 'Rental Staff ID', inventory_id as 'Inventory ID', 
    payment.customer_id as 'Payment Customer ID', payment_date 
    as 'Payment Date', payment.staff_id as 'Payment Staff ID', payment_id 
    as 'Payment ID', inventory.last_update as 'Inventory Last Update', 
    rental.last_update as 'Rental Last Update', payment.last_update 
    as 'Payment Last Update'
from sakila.inventory 
join sakila.rental
using (inventory_id)
join sakila.payment
using (rental_id)
where amount > 4.99
order by amount;
-- output: all columns from inventory, rental, and payment tables with 1k
	-- rows (per limit in action bar) with films rented for more than 
    -- $4.99, as matched by inventory and rental ID's