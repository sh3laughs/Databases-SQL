-- DSO108 - Databases
	-- Lesson 4 - Creating Tables

-- Page 1 - Table Structure

-- From Workshop

create table muppets(
MuppetName varchar(50) not null unique,
MuppetID integer primary key auto_increment,
MuppetAge integer,
EntryDate datetime default current_timestamp,
check (MuppetAge <= 44));
-- output: new muppets table created with MuppetName column which can be
	-- a max of 50 characters, must always be completed, must be unique
    -- and can be 44 or younger; a MuppetID column which is a # that is 
    -- automatically added and acts as PK (identifier) for table; and a 
    -- MuppetAge columnwhich is an auto-added timestamp (based on time 
	-- entry is added to table
    -- note: this was created in the sakila db b/c that's what I had
		-- active in sidebar when running this

create table muppet_animal(
MuppetName varchar (50) not null unique,
foreign key (MuppetName) references muppets (MuppetName),
animal nvarchar(30) not null);
-- output: a new muppet_animal table created with a MuppetName column which 
	-- can be a max of 50 characters, must always be completed, and must be 
    -- unique, a foreign key column (?) linking the data from the MuppetName
    -- column on this table with the column by the same name in the muppets
    -- table, and an animal column which can be up to 30 characters and
    -- cannot be empty
-- note: this was created in the sakila db b/c that's what I had
		-- active in sidebar when running this

insert into muppets (MuppetName, MuppetAge)
values ('Kermit', 44);
-- output: added the first row to the muppets table

insert into muppet_animal (MuppetName, animal)
values ('Kermit', 'frog');
-- output: added the first row to the muppet_animal table

select * from muppets;
-- output: viewed the muppets table and could see the data I added above
	-- in the first row, as well as the auto-added ID and timestamp

select * from muppet_animal;
-- output: viewed the muppet_animal table and could see the data I added 
	-- above in the first row, 

-- testing the NOT NULL constraint on the MuppetName column by attempting
	-- to add a new entry (row) with no name
insert into muppets (MuppetAge)
values (44);
-- output: error sayiing MuppetName has no default value, which means that
	-- b/c there's nothing auto-added AND the column cannot be empty
    -- we can't add an entry w/o a value for this column


create index MuppetIndex on muppets(MuppetName);
-- output: index created, which enables quicker queries to the MuppetName
	-- column in the muppets table


-- Page 2 - Creating Tables
create table AppUsers (
	AppUserID integer,
    FirstName varchar(50),
    LastName varchar(50),
    SignUpDate datetime
    );
-- output: new table created in sakila database

-- Page 3 - Constraints

	-- NOT NULL
create table AppUsers1 (
	AppUserID integer,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    SignUpDate datetime not null
    );
-- output: new table created in sakila database

	-- UNIQUE
create table AppUsers2 (
	AppUserID integer unique,
    FirstName varchar(50) not null,
    LastName varchar (50) not null,
    SignUpDate datetime not null
    );
-- output: new table created in sakila database


-- Page 4 - Keys

	-- Primary Key
create table AppUsers3 (
	AppUserID integer primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    SignUpDate datetime not null
    );
-- output: new table created in sakila database

	-- Autoincrement
create table AppUsers4 (
	AppUserID integer primary key auto_increment,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    SignUpDate datetime not null
    );
-- output: new table created in sakila database

-- From workshop:

	-- 1. Create a table named "TodoList" with the following columns: todo_id,
		-- name, complete, createdAt
        -- Ensure each column has the appropriate type. All columns must not 
        -- allow Null values
        -- After you have created the table, insert a new todo, then query the
        -- table to show the data
create table TodoList (
	todo_id integer primary key auto_increment,
    name varchar(100) not null,
    complete boolean not null,
    createdAt datetime default current_timestamp
    );
-- output: new table created in sakila database

insert into TodoList (name, complete)
values ('Walk the dog',0);
-- output: new entry (row) added to TodoList table

select *
from TodoList;
-- output: table retrieved with the data insterted above


-- Page 5 - Foreign Key
create table states (
	State varchar(50) not null,
    Abbreviation nvarchar(2) primary key
    );
-- output: new table created in sakila database

insert into states (State, Abbreviation)
values ('Alabama', 'AL');
insert into states (State, Abbreviation)
values ('Alaska', 'AK');
insert into states (State, Abbreviation)
values ('Arizona', 'AZ');
insert into states (State, Abbreviation)
values ('Arkansas', 'AR');
insert into states (State, Abbreviation)
values ('California', 'CA');
insert into states (State, Abbreviation)
values ('Colorado', 'CO');
insert into states (State, Abbreviation)
values ('Connecticut', 'CT');
-- output: 7 entries (rows) added to states table

create table customerExample (
	FirstName nvarchar(40),
    LastName nvarchar(30),
    State nvarchar(2),
    foreign key (State) references states (Abbreviation)
    );


-- Page 6 - Check, Default, Triggers

	-- Check
drop table customerExample;
-- output: table deleted

create table customerExample (
	FirstName nvarchar(40),
    LastName nvarchar(30),
    State nvarchar(2),
    PostalCode integer,
    foreign key (State) references states (Abbreviation),
    check (length(PostalCode) = 5)
    );
-- output: new table created

	-- Default
drop table customerExample;
-- output: table deleted

create table customerExample (
	FirstName nvarchar(40),
    LastName nvarchar(30),
    State nvarchar(2),
    PostalCode integer,
    SignUpDate datetime default current_timestamp,
    foreign key (State) references states (Abbreviation),
    check (length(PostalCode) = 5)
    );
-- output: new table created


-- Page 7 - Insert
create table actorExample (
		actor_id smallint(5) unsigned,
    first_name varchar(45),
    last_name varchar(45),
    last_update timestamp
    );
-- output: new table created

insert into actorExample
values (200, 'Jamie', 'Thomas', '2020-01-23 12:16:34');
-- output: entry added to table

select *
from actorExample;
-- output: all columns of table retrieved

	-- Try inserting the data from the actor table into the 
    -- actorExample table
insert into actorExample
select * from actor;

select * 
from actorExample
order by actor_id DESC;
-- output: all entries from actor table added to actorExample table
	-- which means two actors now have ID 200 per the actor we 
    -- added above having that ID


-- Page 8 - Drop Table
drop table actorExample;


-- Page 9 - Views
create view CurrentCustomers as
select customer_id, first_name, last_name
from customer
where active = 1;
-- output: view created

select * from CurrentCustomers;
-- output: view opened

create view ActorFilms as
select first_name, last_name, film_id
from sakila.actor
join sakila.film_actor
on sakila.actor.actor_id = sakila.film_actor.actor_id;

select *
from ActorFilms;
-- output: view created and previewed

drop view CurrentCustomers;
-- output: view deleted