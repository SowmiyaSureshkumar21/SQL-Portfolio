-- Platform: DataLemur
-- Company: CVS Health
-- Difficulty: Easy
-- Topic: Aggregation, GROUP BY, SUM, ROUND, CONCAT, String Formatting
-- Question: Pharmacy Analytics (Part 3)

/* Method 1: Direct Aggregation */

SELECT
manufacturer,
CONCAT(
'$',
ROUND(SUM(total_sales) / 1000000, 0),
' million'
) AS sale_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;

/* Method 2: Using CTE */

WITH manufacturer_sales AS (
SELECT
manufacturer,
ROUND(SUM(total_sales) / 1000000, 0) AS sales_million
FROM pharmacy_sales
GROUP BY manufacturer
)

SELECT
manufacturer,
CONCAT('$', sales_million, ' million') AS sale_mil
FROM manufacturer_sales
ORDER BY sales_million DESC, manufacturer;