-- DSO108 - Databases
	-- Lesson 4 - Creating Tables
    -- Page 11 - Hands-On

-- Part 1 – Run the following queries
	-- 1.  Create a view named "initialCustomers" that shows the first name, 
    -- last name, and email address of customers that have an id of less 
    -- than 100. 
CREATE VIEW sakila.initialCustomers AS
SELECT first_name, last_name, email
FROM sakila.customer
WHERE customer_id < 100;
-- output: new initialCustomers view created in sakila database
    
	-- 2.  Once that is complete, select and view your newly created view.
SELECT *
FROM sakila.initialCustomers;
-- output: view previewed
	-- note: a little wonky in a case like this that b/c the customer_id
    -- column isn't present (per requirements from step 1) I can't order
    -- by that column to ensure the WHERE condition was accurately 
    -- executed


-- Part 2 – Complete the following
	-- 1.  Create a table named "ProductList". 
		-- Include the following columns:
			-- ProductId
            -- ProductName
			-- Price
			-- DateAdded
			-- EmployeeSupportId
		-- Include the following requirements:
			-- Every product should have an automatically generated id 
				-- number that should be unique for each product.
			-- Give each column a data type that would apply
			-- Give the DateAdded column a default value for the current 
				-- local time.
			-- All columns CANNOT be null.
CREATE TABLE sakila.ProductList (
	ProductId INT PRIMARY KEY AUTO_INCREMENT,
	ProductName VARCHAR(100) NOT NULL,
	Price NUMERIC(65,2) NOT NULL,
	DateAdded DATETIME DEFAULT CURRENT_TIMESTAMP,
	EmployeeSupportId INT NOT NULL
    );
-- output: table created
	-- note: played around with limit for Price column and learned from
    -- error response that the max is 65

	-- 2.  Next, insert one product into the table following the given 
		-- guidelines when the table was created. When inserting the data, 
        -- don't include the ProductId or the DateAdded. 
INSERT INTO sakila.ProductList (ProductName, Price, EmployeeSupportID)
VALUES ('MySQL Workbench Tutorial', 99.99, 123);
-- output: new entry added to ProductList table

	-- 3.  Finally, run a query to see the single product in your table.
SELECT *
FROM sakila.ProductList;
-- output: ProductList table previewed with the single entry added above