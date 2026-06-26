-- LeetCode 610
-- Problem: Triangle Judgement
-- Difficulty: Easy

/*
Approach:

A valid triangle must satisfy the Triangle Inequality Theorem.

For three sides x, y, and z:
- x + y > z
- x + z > y
- y + z > x

If all three conditions are true, return 'Yes';
otherwise, return 'No'.
*/

SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z
         AND x + z > y
         AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;