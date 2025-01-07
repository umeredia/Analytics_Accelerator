-- BASIC SQL 

-- Selecting everything from orders table
SELECT *
FROM orders;

-- Selecting specific columns from a table 
SELECT id, account_id, occurred_at
FROM orders;

-- Use LIMIT to return a specified number of rows
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

-- Order By practice (used to order data based on a colummn/s). Order by uses a default of ascending order; add "DESC" to display data from largest to smallest (latest to earliest, z-a)

  -- Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
  SELECT id, occurred_at, total_amt_usd
  FROM orders
  ORDER BY occurred_at
  LIMIT 10;

  --Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
  SELECT id, account_id, total_amt_usd
  FROM orders
  ORDER BY total_amt_usd DESC
  LIMIT 5;

  --Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
  SELECT id, account_id, total_amt_usd
  FROM orders
  ORDER BY total_amt_usd 
  LIMIT 20;

  -- Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).
  SELECT id, account_id, total_amt_usd
  FROM orders
  ORDER BY account_id, total_amt_usd DESC;

  -- Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).
  SELECT id, account_id, total_amt_usd
  FROM orders
  ORDER BY total_amt_usd DESC,  account_id;

-- Filtering with "WHERE" displays data the meets certain criteria specified in the WHERE clause. This can be used with numeric and non-numeric data

  -- Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
  SELECT *
  FROM orders
  WHERE gloss_amt_usd >= 1000
  LIMIT 5;

 -- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
  SELECT *
  FROM orders
  WHERE total_amt_usd < 500
  LIMIT 10;

  -- Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table.
  SELECT name, website, primary_poc
  FROM accounts
  WHERE name = 'Exxon Mobil';

-- Using Arithmetic operators: this can be performed in the SELECT clause to create new columns known as Derived Columns

  -- Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.
  SELECT id, 
    account_id, 
    standard_amt_usd/standard_qty AS unit_price
  FROM orders
  LIMIT 10;

  -- Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also
  SELECT id, 
    account_id, 
    (poster_amt_usd/(poster_amt_usd + standard_amt_usd + gloss_amt_usd)) * 100 AS poster_revenue_prcnt --NOTE: Solution did not include "* 100" in the derived column formula, however that would not show percentages
  FROM orders
  LIMIT 10;

-- Filtering in the where clause can also be performed using the LIKE operator to search text data. Use wildcards such as % to indicate unspecified characters

--Use the accounts table to find

--   1. All the companies whose names start with 'C'.

--  2. All companies whose names contain the string 'one' somewhere in the name.

--  3. All companies whose names end with 's'.

SELECT name
FROM accounts
WHERE name LIKE 'C%';

SELECT name
FROM accounts
WHERE name LIKE '%one%';

SELECT name
FROM accounts
WHERE name LIKE '%s';

