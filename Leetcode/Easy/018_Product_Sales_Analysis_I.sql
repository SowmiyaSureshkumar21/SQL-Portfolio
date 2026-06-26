-- LeetCode 1068
-- Problem: Product Sales Analysis I
-- Difficulty: Easy

/*
Approach:

Join the Sales and Product tables using product_id.
Retrieve the product name along with the year and price
for each sale.
*/

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;