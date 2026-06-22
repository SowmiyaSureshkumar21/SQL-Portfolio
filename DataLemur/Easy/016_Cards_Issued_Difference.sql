-- Platform: DataLemur
-- Company: JPMorgan Chase
-- Difficulty: Easy
-- Topic: Aggregation, GROUP BY, MAX, MIN
-- Question: Cards Issued Difference

/* Method 1: Using Aggregation */

SELECT
    card_name,
    MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;


/* Method 2: Using CTE */

WITH card_stats AS (
    SELECT
        card_name,
        MAX(issued_amount) AS max_issued,
        MIN(issued_amount) AS min_issued
    FROM monthly_cards_issued
    GROUP BY card_name
)

SELECT
    card_name,
    max_issued - min_issued AS difference
FROM card_stats
ORDER BY difference DESC;