-- LeetCode 1141
-- Problem: User Activity for the Past 30 Days I
-- Difficulty: Easy

/*
Approach:

Filter activities that occurred during the last 30 days
(inclusive of 2019-07-27).

Group the records by activity_date and count the distinct
users active on each day.
*/

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN
      '2019-07-27' - INTERVAL 29 DAY
      AND '2019-07-27'
GROUP BY activity_date;