-- Platform: DataLemur
-- Company: CVS Health
-- Difficulty: Easy
-- Topic: Aggregation, GROUP BY, Filtering, Calculated Columns
-- Question: Pharmacy Analytics (Part 2)

/* Method 1: Using Subquery */

SELECT
    manufacturer,
    COUNT(drug) AS drug_count,
    SUM(loss) AS total_loss
FROM (
    SELECT
        manufacturer,
        drug,
        (cogs - total_sales) AS loss
    FROM pharmacy_sales
) ps
WHERE loss > 0
GROUP BY manufacturer
ORDER BY total_loss DESC;


/* Method 2: Direct Aggregation */

SELECT
    manufacturer,
    COUNT(drug) AS drug_count,
    SUM(cogs - total_sales) AS total_loss
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY total_loss DESC;