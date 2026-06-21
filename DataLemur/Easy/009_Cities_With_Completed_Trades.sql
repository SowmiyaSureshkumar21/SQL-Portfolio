-- Platform: DataLemur
-- Company: Robinhood
-- Difficulty: Easy
-- Topic: JOIN, GROUP BY, Aggregation
-- Question: Cities With Completed Trades

SELECT
    u.city,
    COUNT(*) AS total_orders
FROM trades t
JOIN users u
    ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;