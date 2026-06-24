-- LeetCode 607
-- Problem: Sales Person
-- Difficulty: Easy

/*
Solution 1: NOT IN

Approach:

Find the company ID for 'RED'.
Find all salespersons who have orders with RED.
Return salespersons whose sales_id is not in that list.
*/

SELECT sp.name
FROM SalesPerson sp
WHERE sp.sales_id NOT IN (
SELECT sales_id
FROM Orders
WHERE com_id = (
SELECT com_id
FROM Company
WHERE name = 'RED'
)
);

/*
Alternative Solution: NOT EXISTS

Approach:

For each salesperson, check whether an order exists for company 'RED'.
Return only those salespersons for whom no such order exists.
*/

SELECT sp.name
FROM SalesPerson sp
WHERE NOT EXISTS (
SELECT 1
FROM Orders o
JOIN Company c
ON o.com_id = c.com_id
WHERE o.sales_id = sp.sales_id
AND c.name = 'RED'
);