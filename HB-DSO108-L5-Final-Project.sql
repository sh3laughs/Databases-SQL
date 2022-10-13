-- DSO108 - Databases
	-- Lesson 5 - Indexes and Project
	-- Page 6 - Final Project

-- Part 1
	-- 1. Run a query that creates a table named Authors that has the 
			-- following columns: AuthorID, FullName, BirthCountry.
		-- AuthorID is the primary key and auto increments.
create table Authors(
	AuthorID int primary key auto_increment,
    FullName varchar(50) not null,
    BirthCountry varchar(50) not null
    );
-- output: Authors table created
	-- refeshing database confirms, and viewing info validates columns
    -- were correctly addeed

	-- 2. Add the following Authors table
		-- FullName			BirthCountry
		-- Jane Austen		England
		-- Charles Dickens	England
		-- Mark Twain		United States
insert into Authors (FullName, BirthCountry)
values
	('Jane Austen', 'England'),
	('Charles Dickens', 'England'),
	('Mark Twain', 'United States');
-- output: 3 new entries added to Authors table

    -- 3. Run a query to see all of the authors within the database.
select *
from Authors;
-- output: Authors table previewed with 3 entries added above


-- Part 2
	-- 1. Run a query that creates a table named Books that has the 
			-- following columns: BookID, Name, AuthorID.
		-- BookID is the primary key and auto increments.
		-- AuthorID is a foreign key that referenced the Authors table 
			-- on the AuthorID column.
create table Books(
	BookID int primary key auto_increment,
    Name varchar(50) not null,
    AuthorID int,
    foreign key (AuthorID) references Authors(AuthorID)
    );
-- output: Books table created
	-- refeshing database confirms, and viewing info validates columns
    -- were correctly addeed

	-- 2. Add the following the Books table:
		-- Name						AuthorID
		-- Pride and Prejudice		1
		-- Sense and Sensibility	1
		-- The Pickwick Papers		2
insert into Books (Name, AuthorID)
values
	('Pride and Prejudice', 1),
	('Sense and Sensibility', 1),
	('The Pickwick Papers', 2);
-- output: 3 new entries added to Books table

	-- 3. Run a query to see all of the books within the database.
select *
from Books;
-- output: Books table previewed with 3 entries added above


-- Part 3
	-- 1. Run a query that joins the Authors and Books table together 
		-- using the AuthorID foreign key.
select *
from Authors
join Books
using (AuthorID);
-- output: joined table previewed - but not user friendly

	-- 2. Next, create a view named AuthorBooks using the join query 
			-- created in step 1 adding the following parameters:
		-- Show only the Authors full name and book name.
		-- Rename the column name results using the AS keyword.
			-- The Authors FullName should display as AuthorName.
			-- The Books Name should display as BookName.
		-- Order the results alphabetically by the authors full name.
create view AuthorBooks as
select FullName as 'AuthorName', Name as 'BookName'
from Authors
join Books
using (AuthorID)
order by AuthorName;
-- output: view created

	-- 3. Lastly, run a query to see the view you just created.
select *
from AuthorBooks;
-- output: view previewed with 3 rows and 2 columns, as expected