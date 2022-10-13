-- DSO108 - Databases
	-- Lesson 3 - CRUD in SQL
    -- Page 8 - Practice Hands-On

-- Part 1 - Run the following queries:

	-- 1. Write a query that Inserts a new actor into the database. Once 
		-- you have completed the insert, write a query to view all 
        -- information for that specific actor.
insert into sakila.actor (first_name, last_name)
values ('Hi Ho', 'Silver');

select *
from sakila.actor
where first_name = 'Hi Ho';
-- output: new actor added to table and confirmed by viewing all columns
	-- in table for this new actor

	-- 2. Write a query to Update the actor that you just inserted. Give your 
		-- new actor a first_name of Emmy and a last_name of Rock. When you 
        -- have completed that update, run another query to see your updated 
        -- actor.
	-- Tip! Make sure only to update your specific actor. Don't update all 
		-- actors!
update sakila.actor
set first_name = 'Emmy', last_name = 'Rock'
where actor_id = 206;

select *
from sakila.actor
where actor_id = 206;
-- output: updated name for newly c