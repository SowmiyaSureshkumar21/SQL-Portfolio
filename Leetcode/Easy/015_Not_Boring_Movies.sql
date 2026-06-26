-- LeetCode 620
-- Problem: Not Boring Movies
-- Difficulty: Easy

/*
Approach:

Select movies that:
- Have an odd-numbered ID.
- Have a description other than 'boring'.

Finally, sort the results by rating in descending order.
*/

SELECT *
FROM Cinema
WHERE id % 2 <> 0
  AND description <> 'boring'
ORDER BY rating DESC;