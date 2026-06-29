-- LeetCode 1251: Average Selling Price
-- Difficulty: Easy

SELECT
    P.product_id,
    ROUND(
        IFNULL(
            SUM(P.price * U.units) * 1.0 / SUM(U.units),
            0
        ),
        2
    ) AS average_price
FROM Prices AS P
LEFT JOIN UnitsSold AS U
    ON P.product_id = U.product_id
   AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;