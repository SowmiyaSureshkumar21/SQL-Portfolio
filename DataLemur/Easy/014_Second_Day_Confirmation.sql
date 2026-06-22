-- Platform: DataLemur
-- Company: TikTok
-- Difficulty: Easy
-- Topic: JOIN, Date Functions, Filtering, CTE
-- Question: Second Day Confirmation

/* Method 1: Using JOIN + Subquery */

SELECT
    user_id
FROM (
    SELECT
        user_id,
        DATEDIFF(action_date, signup_date) AS date_difference
    FROM texts T
    JOIN emails E
        ON T.email_id = E.email_id
    WHERE signup_action = 'Confirmed'
) TE
WHERE date_difference = 1;


/* Method 2: Using CTE */

WITH confirmation_days AS (
    SELECT
        user_id,
        DATEDIFF(action_date, signup_date) AS date_difference
    FROM texts T
    JOIN emails E
        ON T.email_id = E.email_id
    WHERE signup_action = 'Confirmed'
)

SELECT
    user_id
FROM confirmation_days
WHERE date_difference = 1;


/* Method 3: Without Subquery or CTE */

SELECT
    user_id
FROM texts T
JOIN emails E
    ON T.email_id = E.email_id
WHERE signup_action = 'Confirmed'
  AND DATEDIFF(action_date, signup_date) = 1;