-- Platform: DataLemur
-- Company: UnitedHealth Group
-- Difficulty: Easy
-- Topic: Aggregation, GROUP BY, HAVING, Subquery
-- Question: Patient Support Analysis (Part 1)

/* Method 1: Using Subquery */

SELECT
COUNT(policy_holder_id) AS member_count
FROM (
SELECT
policy_holder_id
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(*) >= 3
) c;

/* Method 2: Using CTE */

WITH frequent_callers AS (
SELECT
policy_holder_id
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(*) >= 3
)

SELECT
COUNT(*) AS member_count
FROM frequent_callers;