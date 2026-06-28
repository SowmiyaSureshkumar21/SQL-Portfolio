-- LeetCode 1084
-- Problem: Sales Analysis III
-- Difficulty: Easy

/*
Solution 1: GROUP BY + HAVING

Approach:

Join the Sales and Product tables using product_id.
Group the records by product_id and product_name.
Find the earliest (MIN) and latest (MAX) sale date
for each product.

If the earliest sale is on or after '2019-01-01'
and the latest sale is on or before '2019-03-31',
then all sales for that product occurred within the
specified date range.
*/

SELECT
p.product_id,
p.product_name
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
GROUP BY
p.product_id,
p.product_name
HAVING
MIN(s.sale_date) >= '2019-01-01'
AND MAX(s.sale_date) <= '2019-03-31';

/*
Alternative Solution: IN + NOT IN

Approach:

First, select products that have at least one sale
using the IN clause.

Then, exclude any product that has a sale outside
the required date range using NOT IN.

The remaining products are those that were sold
only between '2019-01-01' and '2019-03-31'.
*/

SELECT
p.product_id,
p.product_name
FROM Product p
WHERE p.product_id IN (
SELECT product_id
FROM Sales
)
AND p.product_id NOT IN (
SELECT product_id
FROM Sales
WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
);
