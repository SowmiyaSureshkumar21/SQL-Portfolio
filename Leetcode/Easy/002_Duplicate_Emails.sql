/*
Problem: Duplicate Emails
Platform: LeetCode
LeetCode ID: 182
Difficulty: Easy

Approach:
- Group records by email.
- Count the occurrences of each email.
- Return only emails that appear more than once.

Concepts Used:
- GROUP BY
- HAVING
- COUNT()
*/

SELECT
    email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;