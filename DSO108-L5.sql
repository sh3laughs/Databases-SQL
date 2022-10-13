-- DSO108 - Databases
	-- Lesson 5 - Indexes and Project

-- Page 1 - SQL
CREATE INDEX filmListing
ON sakila.film (film_id);
-- output: index created

SELECT film_id
FROM sakila.film;
-- output: index previewed


-- Page 2 - Common SQL functions

	-- From workshop:
-- find the most that a video was ever rented for
select max(amount)
from sakila.payment;
-- output: 11.99 max previewed

-- find the cheapest cost a video was ever rented for
select min(amount)
from sakila.payment;
-- output: 0.00 min previewed

-- what is the total profits derived from renting videos
select sum(amount)
from sakila.payment;
-- output: 67,406.56 total previewed

-- what is the avg. rental price?
select avg(amount)
from sakila.payment;
-- output: 4.20 avg. previewed

-- how many times has any video been rented?
select count(rental_id)
from sakila.payment;
-- output: 16,044 total previewed

-- how many records are in the payment table, regardless of wjether 
	-- they're complete?
select count(*)
from sakila.payment;
-- output: 16,044 total previewed

-- how many prices are there for video rentals?
select count(distinct amount)
from sakila.payment;
-- output: 19 unique prices previewed

-- how many prices are there for video rentals?
select count(distinct amount) as "Number of Price Points"
from sakila.payment;
-- output: 19 unique prices previewed with pretty title

-- how does the price differ by category / genre?
select avg(amount) as AvgPrice, name
from sakila.payment
join sakila.rental using (rental_id)
join sakila.inventory using (inventory_id)
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name;
-- output: list of genres printed with average price for each

-- what if you want to order the above info by price?
select avg(amount) as AvgPrice, name
from sakila.payment
join sakila.rental using (rental_id)
join sakila.inventory using (inventory_id)
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name
order by AvgPrice;
-- output: list of genres printed with average price for each, and
	-- ordered by price (low to high)
    
-- how about the max price by category and by state?
select max(amount) as HighestPrice, name, district as State
from sakila.payment
join sakila.rental using (rental_id)
join sakila.customer on rental.customer_id = customer.customer_id
join sakila.inventory using (inventory_id)
join sakila.film_category using (film_id)
join sakila.category using (category_id)
join sakila.address using (address_id)
group by name, district
order by HighestPrice;
-- output: list of genres printed with highest price for each genre per, 
	-- and state, ordered by price (low to high)

-- which genre is most popular?
select name, count(name) as GenreFrequency
from sakila.payment
join sakila.rental using (rental_id)
join sakila.inventory using (inventory_id)
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name
having GenreFrequency
order by GenreFrequency;
-- output: list of genres printed with # (frequency) of rentals each, 
	-- ordered by frequency of rentals

-- what genre has the most variability in pricing?
select name, count(distinct amount) as PriceVariability
from sakila.payment
join sakila.rental using (rental_id)
join sakila.inventory using (inventory_id)
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name
having PriceVariability
order by PriceVariability;
-- output: list of genres printed with # of diff. rental prices for 
	-- each, ordered by # of diff. rental prices

	-- from lesson:

-- find the smallest amount paid within the payment table
select min(amount)
from sakila.payment;
-- output: 0.00 previewed

-- see the most spent
select max(amount)
from sakila.payment;
-- output: 11.99 previewed

-- find the sum of all totals paid
select sum(amount)
from sakila.payment;
-- output: 67,406.56 previewed

-- find the average
select avg(amount)
from sakila.payment;
-- output: 4.20 previewed

-- return the number of rows that match certain criteria
select count(amount)
from sakila.payment
where amount < 4.00;
-- output: 8,298 previewed


-- Page 3 - Group by

-- list the number of addresses in each district
select count(address_id), district
from sakila.address
group by district
order by count(address_id) desc;
-- output: number of addresses per district previewed, ordered by that #
	-- per district

-- ex: 1
select sakila.customer.customer_id, sakila.customer.first_name, 
sakila.customer.last_name, count(rental_id)
from sakila.rental
inner join sakila.customer using (customer_id)
group by sakila.customer.customer_id;
-- output: # of rentals per customer previewed with their first and 
	-- last names and ID's

-- ex: 2
select customer_id, sum(amount) as TotalRentalAmount
from sakila.payment
group by customer_id;
-- output: total cost of all rentals per customer ID with pretty name 
	-- for cost

-- ex: 3
select customer_id, sum(amount) AS Total, count(rental_id) as NoOfRentals
from sakila.payment
group by customer_id
having count(rental_id) > 40;
-- output: total cost of all rentals per customer ID only for customers 
	-- with more than 40 rentals, with pretty name for cost


-- Page 6 - Final Project

	-- From Workshop
create table Students(
	StudentID int primary key AUTO_INCREMENT,
    FullName varchar(50) not null,
    Email varchar(50) not null
    );
-- output: table created
	-- refeshing database confirms, and viewing info validates columns
    -- were correctly addeed

insert into Students (FullName, Email)
values 
	('Chris Brim', 'cbrim@mail.com'),
	('Britt Stew', 'bstew@mail.com'),
	('Cass Matos', 'cmatos@mail.com');
-- output: 3 entries added

select *
from Students;
-- output: new table with 3 rows previewed


create table Courses(
	CourseID int primary key AUTO_INCREMENT,
    Name varchar(50) not null,
    StudentID int,
    foreign key (StudentID) references Students(StudentID)
    );
-- output: table created
	-- refeshing database confirms, and viewing info validates columns
    -- were correctly addeed
    
select *
from Courses;
-- output: empty table previewed

insert into Courses(Name, StudentID)
values 
	('Databases', 3),
    ('Python', 1),
    ('Programming', 2);
-- output: 3 entries added

select *
from Courses;
-- output: new table with 3 rows previewed

select *
from Students;
-- output: prior table with 3 rows previewed


select *
from Students
join Courses
using (StudentID);
-- output: joined table prints - but not user friendly

select FullName, Name as Course
from Students
join Courses
using (StudentID)
order by FullName desc;
-- output: joined data previewed - student names with course names,
	-- ordered by student name