-- Platform: DataLemur
-- Company: IBM
-- Difficulty: Easy
-- Topic: LEFT JOIN, Aggregation, GROUP BY, CTE, Date Filtering
-- Question: IBM DB2 Product Analytics

/* Method 1: Using CTE */

WITH employee_queries AS (
    SELECT
        E.employee_id,
        COUNT(Q.query_id) AS unique_queries
    FROM employees E
    LEFT JOIN queries Q
        ON E.employee_id = Q.employee_id
       AND Q.query_starttime >= '2023-07-01 00:00:00'
       AND Q.query_starttime < '2023-10-01 00:00:00'
    GROUP BY E.employee_id
)

SELECT
    unique_queries,
    COUNT(*) AS employee_count
FROM employee_queries
GROUP BY unique_queries
ORDER BY unique_queries;


/* Method 2: Using Subquery */

SELECT
    unique_queries,
    COUNT(*) AS employee_count
FROM (
    SELECT
        E.employee_id,
        COUNT(Q.query_id) AS unique_queries
    FROM employees E
    LEFT JOIN queries Q
        ON E.employee_id = Q.employee_id
       AND Q.query_starttime >= '2023-07-01 00:00:00'
       AND Q.query_starttime < '2023-10-01 00:00:00'
    GROUP BY E.employee_id
) employee_queries
GROUP BY unique_queries
ORDER BY unique_queries;