-- Platform: DataLemur
-- Company: Amazon
-- Difficulty: Easy
-- Topic: GROUP BY, Aggregation, Date Functions
-- Question: Average Review Ratings

SELECT
    MONTH(submit_date) AS mth,
    product_id,
    ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY
    MONTH(submit_date),
    product_id
ORDER BY
    mth,
    product_id;