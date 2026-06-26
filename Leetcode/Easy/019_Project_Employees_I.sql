-- LeetCode 1075
-- Problem: Project Employees I
-- Difficulty: Easy

/*
Solution 1: GROUP BY

Approach:

Join the Project and Employee tables using employee_id.
Group the records by project_id and calculate the average
experience years of employees working on each project.
Round the result to two decimal places.
*/

SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;

/*
Alternative Solution: Window Function

Approach:

Calculate the average experience years for each project
using the AVG() window function partitioned by project_id.

Since the window function returns the same average for every
employee within a project, DISTINCT is used to return one row
per project.
*/

SELECT DISTINCT
    p.project_id,
    ROUND(
        AVG(e.experience_years) OVER (PARTITION BY p.project_id),
        2
    ) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id;