-- DSO108 - Databases
	-- Lesson 2 - Joins

-- Page 1 - SQL
SELECT title, release_year, category_id
FROM sakila.film
INNER JOIN sakila.film_category
ON sakila.film.film_id = sakila.film_category.film_id;
-- output: select columns from film and film_category tables with 1k rows 
	-- (per limit in action bar) where the film ID matches between the 
    -- two tables

SELECT title, release_year, category_id
FROM sakila.film
INNER JOIN sakila.film_category
ON sakila.film.film_id = sakila.film_category.film_id
WHERE film.film_id = 1;
-- output: select columns from film and film_category tables with 1 row 
	-- for the only film with ID 1 on both tables

SELECT first_name, last_name, film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id;
-- output: select columns from actor and film_actor tables with 1k rows 
	-- (per limit in action bar) where the actor ID matches between the 
    -- two tables


-- Page 2 - Outer Joins

-- for comparison before doing outer joins
SELECT * 
FROM sakila.film
INNER JOIN sakila.film_actor
ON sakila.film.film_id = sakila.film_actor.film_id;
-- output: all columns from film and film_category tables with 1k rows 
	-- (per limit in action bar) where the film ID matches between the 
    -- two tables

SELECT * 
FROM sakila.film
LEFT OUTER JOIN sakila.film_actor
ON sakila.film.film_id = sakila.film_actor.film_id;
-- output: all columns from film and film_actor tables with 1k rows (per
	-- limit in action bar) which include all data from film table and
    -- rows from film_actor table that have a film ID which matches that
    -- column in the film table

SELECT * 
FROM sakila.film
RIGHT OUTER JOIN sakila.film_actor
ON sakila.film.film_id = sakila.film_actor.film_id;
-- output: all columns from film and film_actor tables with 1k rows (per
	-- limit in action bar) which include all data from film_actor table 
    -- and rows from film table that have a film ID which matches that
    -- column in the film_actor table
    

-- Page 3 - using

-- for comparison before replacing ON with USING
SELECT first_name, last_name, film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id;
-- output: all columns from film and film_actor tables with 1k rows 
	-- (per limit in action bar) where the actor ID matches between the 
    -- two tables

SELECT first_name, last_name, film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
USING (actor_id);
-- output: all columns from film and film_actor tables with 1k rows 
	-- (per limit in action bar) where the actor ID matches between the 
    -- two tables (same results as query above with less typing)
    

	-- From Workshop
-- 1. Write a query to find the first and last name, and store id from the 
	-- staff table and manager staff id from the store table.
select first_name, last_name, store_id, manager_staff_id
from sakila.staff
join sakila.store
using (store_id);
-- output: select columns from staff and store tables with 2 rows where 
	-- the store ID is the same in both tables

-- 2. Write a query that finds all rentals including customer data with a
	-- customer ID of 4.
select *
from sakila.rental
join sakila.customer
using (customer_id)
where customer_id = 4;
-- output: all columns from rental and customer tables with 22 rows where 
	-- the customer ID is 4 in both tables


-- Page 4 - Aliases
SELECT title 
AS filmTitle 
FROM sakila.film;
-- output: title column from film table, renamed to filmTitle

	-- From workshop

-- Write a query to find the category name and film name for each movie
select category.name, film.title
from sakila.category
join sakila.film_category
using (category_id)
join sakila.film
using (film_id);
-- output: select columns from category and film tables with 1k rows (per
	-- limit in action bar), where the data could be matched via 
    -- film_category table which had category ID and film ID

-- Find the category name and film name for those with an ID less than 20
select category.name, film.title
from sakila.category
join sakila.film_category
using (category_id)
join sakila.film
using (film_id)
where film_id < 20;
-- output: select columns from category and film tables with 19 rows where
	-- the films had an ID lower than 20 and the data could be matched via 
    -- film_category table which had category ID and film ID

-- double check above query
select category.name, film.title, film.film_id
from sakila.category
join sakila.film_category
using (category_id)
join sakila.film
using (film_id)
where film_id < 20;
-- output: select columns from category and film tables with 19 rows where
	-- the films had an ID lower than 20 and the data could be matched via 
    -- film_category table which had category ID and film ID

-- Category and film names for films that start with letters A-C
select category.name, film.title, film.film_id
from sakila.category
join sakila.film_category
using (category_id)
join sakila.film
using (film_id)
where title 
like 'a%'
or title
like 'b%'
or title
like 'c%';
-- output: select columns from category and film tables with 19 rows where
	-- the films start with A-C and the data could be matched via 
    -- film_category table which had category ID and film ID

-- Link the payment to the particular customer, and we want to see them
	-- even if there is no amount present
select first_name, last_name, amount
from sakila.payment
right outer join sakila.customer
using (customer_id);
-- output: select columns from payment and customer tables with 1k rows (per
	-- limit in action bar) which include all data from customer table and
    -- data from payment table that matches customer table for customer ID's


-- Page 5 - Multiple Joins
SELECT * 
from sakila.actor
JOIN sakila.film_actor 
USING (actor_id)
JOIN sakila.film_category 
USING (film_id);
-- output: all columns from actor, film_actor, and film_category tables with 
	-- 1k rows (per limit in action bar) where the actor ID or film ID matched
    -- between the tables

	-- From workshop

-- 1. Write a query that lists out the title of films and the name of the
	-- category of those films
    -- Additionally, only list films with a title that stars with B or K
select title, name
from sakila.film
join sakila.film_category
using (film_id)
join sakila.category
using (category_id)
where title
like 'b%'
or title
like 'k%';
-- output: select columns from category and film tables with 75 rows where
	-- the films start with B or K and the data could be matched via 
    -- film_category table which had category ID and film ID


-- Page 7 - Walkthrough

-- Write a query to find all rental's rental_date, return_date, amount paid 
	-- for the rental, and the title of each rental.
    
    -- First, you will need a SELECT statement to choose the rental_date, 
		-- return_date, amount, and title
-- select rental_date, return_date, amount, and title

	-- Second, you need to define from where we are getting these columns. We 
		-- need to add on the FROM statement to define the table rental.
-- select rental_date, return_date, amount, and title
-- from sakila.rental

	-- Third, you want to JOIN the two tables (rental and payment) using the 
		-- rental_id, since that column exists in both tables. You can use the 
        -- keyword USING or ON for this step.
-- select rental_date, return_date, amount, and title
-- from sakila.rental
-- join sakila.payment
-- using (rental_id)

	-- Fourth, you need to JOIN the inventory table in order to utilize the 
		-- column film_id so that you can JOIN the film table to get the title 
        -- of each rental. Pay attention to the tables that have already been 
        -- joined to see which column you will need to use in order to join the 
        -- inventory table.
select rental_date, return_date, amount, title
from sakila.rental
join sakila.payment
using (rental_id)
join sakila.inventory
using (inventory_id)
join sakila.film
using (film_id);
-- output: select columns from rental, payment, and film tables with 1k rows
	-- (per limit in action bar) where data could be matched via inventory
    -- table 