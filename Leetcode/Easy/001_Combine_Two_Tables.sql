/*
Problem: Combine Two Tables
Platform: LeetCode
Difficulty: Easy

Approach:
- Use a LEFT JOIN to return all records from the Person table.
- Match records from the Address table using personId.
- If a person does not have an address, city and state will be returned as NULL.

Concepts Used:
- LEFT JOIN
*/

SELECT
    P.firstName,
    P.lastName,
    A.city,
    A.state
FROM Person AS P
LEFT JOIN Address AS A
    ON P.personId = A.personId;