-- Platform: DataLemur
-- Company: New York Times
-- Difficulty: Easy
-- Topic: CASE WHEN, Conditional Aggregation
-- Question: Laptop vs. Mobile Viewership

SELECT
    SUM(
        CASE
            WHEN device_type = 'Laptop' THEN 1
            ELSE 0
        END
    ) AS laptop_views,
    SUM(
        CASE
            WHEN device_type IN ('Phone', 'Tablet') THEN 1
            ELSE 0
        END
    ) AS mobile_views
FROM viewership;