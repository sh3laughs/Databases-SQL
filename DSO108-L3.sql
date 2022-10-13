-- DSO108 - Databases
	-- Lesson 3 - CRUD in SQL

-- Page 2 - Insert Examples

	-- Example 1: Specify Columns and Values
insert into sakila.actor (first_name, last_name, last_update)
values ('Johnny', 'Smith', '2019-01-17 08:43:11');
-- output: new row added to actor table (I assume.. no way to see it)

insert into sakila.actor (first_name, last_name, last_update)
values ('Johnny', 'Smith', '2019-01-17 08:43:11');

select * from sakila.actor;
-- output: new row added to actor table and table viewed, with 202 rows -
	-- note that b/c I ran the INSERT again, another, identical row
    -- was added

insert into sakila.actor (first_name, last_name, last_update)
values ('Johnny', 'Smith', '2019-01-17 08:43:11');

select * from sakila.actor
where last_name = 'Smith';
-- output: new row added to actor table and 3 rows of new table viewed -
	-- note that b/c I ran the INSERT again, a third, identical row
    -- was added

delete from sakila.actor
where actor_id = 202
or actor_id = 203;

select *
from sakila.actor
order by actor_id DESC;
-- output: I deleted the extras to be able to keep moving (by jumping 
    -- ahead to learn the DELETE keyword), and viewed the table to confirm,
    -- sorted by actor ID with highest ID at the top to make the 
    -- confirmation speedy

	-- Example 2: Specify Just Values
insert into sakila.actor
values (202, 'Kermit', 'DaFrog', '2019-01-19 08:56:12');

select *
from sakila.actor
order by actor_id DESC;
-- output: new row added to actor table, as confirmed by viewing sorted
	-- by actor ID with newest ID at top of list

	-- Example 3: Insert Data when Some is Missing
insert into sakila.actor (first_name, last_name)
values ('Miss', 'Piggy');

select *
from sakila.actor
where first_name = 'Miss';
-- output: new row added to actor table, as confirmed by viewing table
	-- with new row only
    -- note that the last_update column auto-added timestamp from when
    -- this statement ran


-- Page 3 - What is Null?
select * 
from sakila.address
where address2 is null;
-- output: all columns from actor table with 4 rows that have null 
	-- values for the address2 column

select * 
from sakila.address
where address2 is not null;
-- output: all columns from actor table with 599 rows that have non-null
	-- values for the address2 column
    -- note: what's weird is that the column is empty (I expected it
    -- to have real values in place of null...

select *
from sakila.staff
where picture is null
and password is null;
-- output: all columns of staff table with 1 row with the one staff
	-- person who has null values in picture and password columns

select *
from sakila.staff
where picture is null
and store_id = 2;
-- output: all columns of staff table with 1 row with the one staff
	-- person who has null values in picture a store ID 2 - 
    -- cooincidentally this is the same person as query above
    

-- Page 4 - Update
update sakila.actor
set first_name = 'Jonathan'
where actor_id = 201;

select *
from sakila.actor
where actor_id = 201;
-- output: first name updated for actor with ID 201 and confirmed 
	-- by viewing all columns of table with 1 row with only this 
    -- actor ID

update sakila.customer
set active = 1
where store_id = 2;

select *
from sakila.customer
where store_id =2;
-- output: active (status?) updated to 1 (active?) for all 
	-- customers from store with ID 2 and confirmed by viewing 
    -- all columns of table with 273 rows for customers from
    -- store 2

-- update customer
-- set active = 1;
-- I don't want to run this ;) but the output would be to update
	-- the active status to 1 for all rows in the table, b/c 
    -- there is no WHERE condition

-- Page 5 - Delete
delete from sakila.actor
where actor_id = 201;

select *
from sakila.actor
order by actor_id DESC;
-- output: actor with ID 201 was deleted from the actor table and
	-- confirmed by viewing table sorted from high to low by 
    -- actor ID