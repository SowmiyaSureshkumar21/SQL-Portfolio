/*
Problem: Employee Bonus
Platform: LeetCode
LeetCode ID: 577
Difficulty: Easy

Approach:
- Use a LEFT JOIN to include all employees.
- Match employee records with their bonus information.
- Return employees whose bonus is less than 1000 or who have not received a bonus.

Concepts Used:
- LEFT JOIN
- NULL Handling
- Filtering with WHERE
*/

SELECT
    name,
    bonus
FROM Employee E
LEFT JOIN Bonus B
    ON E.empId = B.empId
WHERE bonus < 1000
   OR bonus IS NULL;