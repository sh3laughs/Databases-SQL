#DSO108 - Databases
	#Lesson 1 - Getting Started With SQL
    #Page 17 - Practice Hands-On

-- Part 1 - Run the following queries:
	-- 1. Query all columns for actors with the first name of "Cuba".
select * from sakila.actor where first_name = 'Cuba';
-- output: all columns from actor table with 3 rows for actors whose first name
	-- is Cuba

	-- 2. Query the film title and film id that has an film_id greater than 5 and 
    -- less than 20.
select title, film_id from sakila.film where film_id > 5 and film_id < 20;
-- output: title column of film table with 14 rows for films that have an ID
	-- between 6-19

	-- 3. Query the first and last name, and email of customers who have the last 
    -- name "Rodriguez" or their last name begins with a "Mc".
select first_name, last_name, email from sakila.customer 
where last_name = 'Rodriquez' or last_name like 'mc%';
-- output: first name, last name, and email columns for customer table with 12
	-- rows with customers whose last name is Rodriguez and/ or whose last
    -- name starts with "Mc..."
-- Note: confession that I hadn't understood from lesson content that LIKE
    -- can be combined wtih AND or OR arguments, so I looked ahead to solution
    -- to figure this one out

	-- 4. Query all columns of the films with a title that begins with "a".
select * from sakila.film where title like 'a%';
-- output: all columns from film table with 46 rows with films that have a title
	-- that starts with "A"

	-- 5. Query all titles of films that are not in the language of English or 
    -- Japanese.
select title from sakila.film 
where language_id in (
select language_id from sakila.language where name != 'english')
and language_id in (
select language_id from sakila.language where name != 'japanese');
-- output: title column from film table with 0 rows, indicating there are no films 
	-- with a language ID that means something other than English or Japanese, 
    -- according to the language table

	-- Wasn't sure if this was right, so I looked ahead at solution again and
	-- it was using NOT IN, which we hadn't technically learned
select title from sakila.film 
where language_id not in (
select language_id from sakila.language where name = 'english' 
or name != 'japanese');
-- output: title column from film table with 0 rows, indicating there are no films 
	-- with a language ID that means something other than English or Japanese, 
    -- according to the language table
-- So it turns out my initial solution worked, even though it wasn't how it was
	-- expected / recommeneded.. glad to learn that NOT IN is a thing ;)
    

-- Part 2 - Run 2 queries
	-- You were just hired at a company as a data analyst, and your company needs 
	-- some information from the database. They would like to see all payments that 
    -- had a rental amount is over .99 cents. However, they only want to see the 
    -- rental id and payment date that is attached to that payment
select rental_id, payment_date from sakila.payment
where amount > 0.99;
-- output: rental ID and payment date columns for payment table with 1k rows (per
	-- limit set in action bar) with all transactions over $0.99

    -- Once you have finished that, they would like to see the staff id and customer 
    -- id from the payments that have an amount over .99 cents.
select staff_id, customer_id from sakila.payment
where amount > 0.99;
-- output: staff and customer ID columns for payment table with 1k rows (per limit
	-- set in action bar) with all transactions over $0.99