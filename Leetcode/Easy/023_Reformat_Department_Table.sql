-- LeetCode 1179
-- Problem: Reformat Department Table
-- Difficulty: Easy

/*
Solution 1: Conditional Aggregation using SUM() + CASE

Approach:

Group the records by department id.

Use conditional aggregation to create a separate
revenue column for each month.

For each CASE expression:

Return the revenue if the month matches.
Otherwise, return NULL.

The SUM() function aggregates the matching revenue
for each month. Since (id, month) is the primary key,
each department has at most one revenue value per month,
so SUM() returns that value.
*/

SELECT
id,
SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
SUM(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
SUM(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
SUM(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
SUM(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
SUM(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
SUM(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
SUM(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
SUM(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
SUM(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;

/*
Alternative Solution: Conditional Aggregation using MAX() + CASE

Approach:

Group the records by department id.

Use MAX() with CASE statements to pivot the revenue
for each month into separate columns.

Since each department can have only one revenue value
for a given month, MAX() returns the same result as
SUM().
*/

SELECT
id,
MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;