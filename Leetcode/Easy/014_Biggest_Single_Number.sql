-- LeetCode 619
-- Problem: Biggest Single Number
-- Difficulty: Easy

/*
Approach:

Group the numbers and keep only those that appear exactly once.
From the remaining unique numbers, return the largest value using MAX().

If there is no single number, MAX() automatically returns NULL.
*/

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS mn;