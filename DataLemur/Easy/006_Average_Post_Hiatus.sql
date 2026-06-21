-- Platform: DataLemur
-- Company: Facebook
-- Difficulty: Easy
-- Topic: Date Functions, Aggregation
-- Question: Average Post Hiatus (Part 1)

SELECT user_id,
       DATEDIFF(MAX(post_date), MIN(post_date)) AS days_between
FROM posts
WHERE YEAR(post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) >= 2;