-- DSO108 - Databases
	-- Lesson 1 - Getting Started With SQL

-- Page 7 - SELECT
SELECT film_id, title, description, release_year, language_id 
FROM sakila.film;
-- output: selected columns from film table returned with 1k rows (per limit set 
	-- in action bar)

SELECT * 
FROM sakila.film;
-- output: all columns from film table returned with 1k rows (per limit set in
	-- action bar)

SELECT title 
FROM sakila.film;
-- output: title column from film table returned with 1k rows (per limit set in
	-- action bar)

SELECT title, description, release_year 
FROM sakila.film;
-- output: select columns from film table returned with 1k rows (per limit set 
	-- in action bar)

-- Page 8 - LIMIT
SELECT title, description, release_year 
FROM sakila.film 
LIMIT 5;
-- output: select columns from film table returned with 5 rows

-- Page 9 - WHERE
SELECT * 
FROM sakila.film 
WHERE length < 90;
-- output: all columns from film table returned with 320 rows with films longer
	-- than 90 min

SELECT * 
FROM sakila.film 
WHERE title = 'ALONE TRIP';
-- output: all columns from film table returned with 1 row with Alone Trip 
	-- film

SELECT * 
FROM sakila.film 
WHERE replacement_cost > 28.99;
-- output: all columns from film table returned with 53 rows with films with a 
	-- replacement cost over $28.99

-- Page 10 - AND, OR, NOT
SELECT title, rating, length, release_year 
FROM sakila.film
WHERE rating = 'PG' 
AND length < 100 
AND replacement_cost < 19.99;
-- output: select columns from film table returned with 43 rows with films with  
	-- a PG rating, less than 100 min long, and a replacement cost less than 
    -- $19.99

SELECT title, rating, length, release_year 
FROM sakila.film
WHERE rating = 'PG' 
OR length < 100 
OR replacement_cost < 19.99;
-- output: select columns from film table returned with 720 rows with films with 
	-- any combo of a PG rating, less than 100 min long, and/ or a replacement 
    -- cost less than $19.99

SELECT title, rating 
FROM sakila.film
WHERE rating != 'PG';
-- output: select columns from film table returned with 806 rows with films with 
	-- any rating other than PG

-- Page 11 - String Functions
SELECT UPPER('sql is super fun!') AS UpperCase;
-- output: single UpperCase colum with single row with this text in uppercase

SELECT LOWER('I LOVE LEARNING SQL') AS LowerCase;
-- output: single LowerCase colum with single row with this text in lowercase


-- From Workshop
select * 
from sakila.actor;
-- output: all columns from actor table returned with all 200 rows

select * 
from sakila.actor 
limit 5;
-- output: all columns from actor table returned with 5 rows
 
select first_name, last_name 
from sakila.actor 
limit 5;
-- output: selected columns from actor table with 5 rows

select last_name, first_name 
from sakila.actor 
limit 5;
-- output: selected columns from actor table with 5 rows

select last_name, first_name 
from sakila.actor
where first_name = 'johnny';
-- output: selected columns from actor table with 2 rows with actors whose 
	-- first name is Johnny

select last_name, first_name 
from sakila.actor
where first_name != 'johnny';
-- output: selected columns from actor table with 198 rows with actors whose 
	-- first name is not Johnny

select * 
from sakila.actor
where actor_id < 10;
-- output: all columns from actor table with 9 rows with actors with an ID
	-- lower than 10

select * 
from sakila.actor
where actor_id <= 10;
-- output: all columns from actor table with 10 rows with actors with an ID
	-- 10 or lower

select * 
from sakila.actor
where actor_id > 10;
-- output: all columns from actor table with 190 rows with actors with an ID
	-- higher than 10
    
select * 
from sakila.actor
where actor_id >= 10;
-- output: all columns from actor table with 191 rows with actors with an ID
	-- 10 or higher

select *
from sakila.actor
where actor_id < 10
or actor_id > 12;
-- output: all columns from actor table with 187 rows with actors with an ID
	-- lower than 10 or higher than 12

select *
from sakila.actor
where actor_id < 6
and first_name = 'johnny';
-- output: all columns from actor table with 1 row with the only actor with 
	-- an ID lower than 6 whose first name is Johnny

select *
from sakila.actor
where first_name 
LIKE 'j%';
-- output: all columns from actor table with 23 rows with the actors whose
	-- first names start with j

select *
from sakila.actor
where first_name 
LIKE 'ja%';
-- output: all columns from actor table with 6 rows with the actors whose
	-- first names start with "ja..."

select *
from sakila.actor
where first_name 
LIKE '%j';
-- output: all columns from actor table with 0 rows per there being no 
	-- actors whose first names end with j
    
select *
from sakila.actor
where first_name 
LIKE '%a';
-- output: all columns from actor table with 30 rows with the actors whose
	-- first names end with a

select *
from sakila.actor
where first_name 
LIKE '%a%';
-- output: all columns from actor table with 104 rows with the actors whose
	-- first names contain an a

select *
from sakila.actor
where first_name 
LIKE '___f';
-- output: all columns from actor table with 1 row with the only actor whose
	-- first names has an f as the 4th and last character

select *
from sakila.actor
where first_name 
LIKE '___f%';
-- output: all columns from actor table with 2 rows with the actors whose
	-- first names have an f as the 4th character and any characters after
    -- that f

select *
from sakila.actor
where first_name 
LIKE 'j_%_%';
-- output: all columns from actor table with 23 rows with the actors whose
	-- first names begin with j and are at least 3 characters long
    
select *
from sakila.actor
where first_name 
not like 'j%';
-- output: all columns from actor table with 177 rows with the actors whose
	-- first names do not begin with j

select *
from sakila.actor
where first_name 
in ('penelope', 'nick', 'grace');
-- output: all columns from actor table with 8 rows with the actors whose
	-- first names are Penelope, Nick, or Grace

select *
from sakila.actor
where first_name 
in ('penelope', 'nick', 'grace')
order by first_name;
-- output: all columns from actor table with 8 rows with the actors whose
	-- first names are Penelope, Nick, or Grace, ordered by first name
    -- A-Z
    
select *
from sakila.actor
where first_name 
in ('penelope', 'nick', 'grace')
order by first_name desc;
-- output: all columns from actor table with 8 rows with the actors whose
	-- first names are Penelope, Nick, or Grace, ordered by first name
    -- Z-A

select *
from sakila.actor
where first_name 
in ('penelope', 'nick', 'grace')
order by actor_id desc;
-- output: all columns from actor table with 8 rows with the actors whose
	-- first names are Penelope, Nick, or Grace, ordered by actor ID from
    -- high to low

select *
from sakila.actor
where first_name 
in ('penelope', 'nick', 'grace')
order by actor_id;
-- output: all columns from actor table with 8 rows with the actors whose
	-- first names are Penelope, Nick, or Grace, ordered by actor ID from
    -- low to high


-- Page 12 - LIKE Syntax
SELECT title 
FROM sakila.film
WHERE title 
LIKE 'the%';
-- output: title column from film table with 1 row with the only film with a
	-- title that starts with "the..."

SELECT title 
FROM sakila.film
WHERE title 
LIKE '%en';
-- output: title column from film table with 13 rows with the films with titles
	-- that end with "...en"

SELECT title 
FROM sakila.film
WHERE title 
LIKE '%or%';
-- output: title column from film table with 119 rows with the films with titles
	-- that contain "...or..."

SELECT title 
FROM sakila.film
WHERE title 
LIKE '_r%';
-- output: title column from film table with 94 rows with the films with titles
	-- with r as the second letter

SELECT title 
FROM sakila.film
WHERE title 
LIKE 'h_%_%';
-- output: title column from film table with 56 rows with the films with titles
	-- that begin with h and have at least 3 characters

SELECT title 
FROM sakila.film
WHERE title 
LIKE 'b%y';
-- output: title column from film table with 3 rows with the films with titles
	-- that begin with b and end with y

SELECT title 
FROM sakila.film
WHERE title 
NOT LIKE 'e%';
-- output: title column from film table with 969 rows with the films with titles
	-- that do not begin with e

-- Page 13 - IN Syntax
SELECT title, rating 
FROM sakila.film
WHERE rating 
IN ("G", "PG", "PG-13");
-- output: title column from film table with 595 rows with the films with a
	-- rating of G, PG, or PG-13

SELECT title 
FROM sakila.film
WHERE language_id
IN (SELECT language_id FROM sakila.language WHERE name = "english");
-- output: title column from film table with 595 rows with the films with a
	-- language ID that means English, according to the language table


-- Page 14 - Order By
SELECT title 
FROM sakila.film
ORDER BY title;
-- output: title column from film table returned with 1k rows (per limit set in
	-- action bar), ordered A-Z

SELECT title 
FROM sakila.film
ORDER BY title DESC;
-- output: title column from film table returned with 1k rows (per limit set in
	-- action bar), ordered Z-A

SELECT title 
FROM sakila.film
WHERE length < 100
ORDER BY title;
-- output: title column from film table returned with 378 rows with films longer
	-- than 100 min, ordered A-Z


-- Page 16
select *
from sakila.actor
where actor_id < 20;
-- output: all columns from actor table returned with 19 rows with actors whose
	-- ID is lower than 20