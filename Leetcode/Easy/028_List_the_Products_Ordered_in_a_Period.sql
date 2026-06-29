-- LeetCode 1327: List the Products Ordered in a Period
-- Difficulty: Easy

SELECT
    P.product_name,
    SUM(O.unit) AS unit
FROM Orders AS O
JOIN Products AS P
    ON O.product_id = P.product_id
WHERE MONTH(O.order_date) = 2
  AND YEAR(O.order_date) = 2020
GROUP BY
    P.product_name
HAVING
    SUM(O.unit) >= 100;