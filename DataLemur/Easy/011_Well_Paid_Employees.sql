-- Platform: DataLemur
-- Company: FAANG
-- Difficulty: Easy
-- Topic: Self Join, Correlated Subquery
-- Question: Well Paid Employees

/* Method 1: Using Self Join */

SELECT
    E.employee_id,
    E.name
FROM employee E
JOIN employee M
    ON E.manager_id = M.employee_id
WHERE E.salary > M.salary;


/* Method 2: Using EXISTS */

SELECT
    E.employee_id,
    E.name
FROM employee E
WHERE EXISTS (
    SELECT 1
    FROM employee M
    WHERE M.employee_id = E.manager_id
      AND M.salary < E.salary
);
