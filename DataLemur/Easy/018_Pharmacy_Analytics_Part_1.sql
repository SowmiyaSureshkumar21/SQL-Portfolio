-- Platform: DataLemur
-- Company: CVS Health
-- Difficulty: Easy
-- Topic: Calculated Columns, ORDER BY, LIMIT, Subquery
-- Question: Pharmacy Analytics (Part 1)

/* Method 1: Direct Calculation */

SELECT
    drug,
    (total_sales - cogs) AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;


/* Method 2: Using Subquery */

SELECT
    drug,
    total_profit
FROM (
    SELECT
        drug,
        (total_sales - cogs) AS total_profit
    FROM pharmacy_sales
) ps
ORDER BY total_profit DESC
LIMIT 3;