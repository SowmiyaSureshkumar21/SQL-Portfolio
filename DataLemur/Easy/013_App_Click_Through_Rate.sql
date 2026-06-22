-- Platform: DataLemur
-- Company: Facebook
-- Difficulty: Easy
-- Topic: Conditional Aggregation, CASE WHEN, CTE
-- Question: App Click-through Rate (CTR)

/* Method 1: Using CTE + COUNT */

WITH impression_click_count AS (
    SELECT
        app_id,
        COUNT(
            CASE
                WHEN event_type = 'impression' THEN 1
            END
        ) AS impression_count,
        COUNT(
            CASE
                WHEN event_type = 'click' THEN 1
            END
        ) AS click_count
    FROM events
    WHERE YEAR(timestamp) = 2022
    GROUP BY app_id
)

SELECT
    app_id,
    ROUND(100.0 * click_count / impression_count, 2) AS ctr
FROM impression_click_count;


/* Method 2: Using Conditional Aggregation */

SELECT
    app_id,
    ROUND(
        100.0 *
        SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END)
        /
        SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),
        2
    ) AS ctr
FROM events
WHERE YEAR(timestamp) = 2022
GROUP BY app_id;