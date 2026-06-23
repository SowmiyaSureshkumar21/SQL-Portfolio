/*
Problem: Delete Duplicate Emails
Platform: LeetCode
LeetCode ID: 196
Difficulty: Easy

Approach:
- Use ROW_NUMBER() to assign a rank to each email group.
- Partition the data by email and order by id.
- Keep the row with the smallest id (rn = 1).
- Delete all duplicate rows (rn > 1).

Concepts Used:
- DELETE
- ROW_NUMBER()
- Window Functions
- PARTITION BY
*/

DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (
                   PARTITION BY email
                   ORDER BY id
               ) AS rn
        FROM Person
    ) P
    WHERE rn > 1
);