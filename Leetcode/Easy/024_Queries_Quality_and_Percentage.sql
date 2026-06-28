-- LeetCode 1211: Queries Quality and Percentage
-- Difficulty: Easy

SELECT
    query_name,
    quality,
    ROUND((poor_query * 100.0) / total_queries, 2) AS poor_query_percentage
FROM
(
    SELECT
        query_name,
        ROUND(AVG(rating / position), 2) AS quality,
        COUNT(*) AS total_queries,
        SUM(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) AS poor_query
    FROM Queries
    GROUP BY query_name
) AS query_status;