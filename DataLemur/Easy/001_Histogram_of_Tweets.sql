-- Platform: DataLemur
-- Company: Twitter
-- Difficulty: Easy
-- Topic: Aggregation
-- Question: Histogram of Tweets

/* Method 1: Using CTE */

WITH tweet_counts AS (
    SELECT
        user_id,
        COUNT(tweet_id) AS tweet_bucket
    FROM tweets
    WHERE YEAR(tweet_date) = 2022
    GROUP BY user_id
)

SELECT
    tweet_bucket,
    COUNT(user_id) AS users_num
FROM tweet_counts
GROUP BY tweet_bucket;


/* Method 2: Using Subquery */

SELECT
    tweet_bucket,
    COUNT(user_id) AS users_num
FROM (
    SELECT
        user_id,
        COUNT(tweet_id) AS tweet_bucket
    FROM tweets
    WHERE YEAR(tweet_date) = 2022
    GROUP BY user_id
) t
GROUP BY tweet_bucket;