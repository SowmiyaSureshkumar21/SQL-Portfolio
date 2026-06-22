-- Platform: DataLemur
-- Company: Alibaba
-- Difficulty: Easy
-- Topic: Weighted Average, Aggregation, SUM, ROUND
-- Question: Compressed Mean

/* Method 1: Direct Calculation */

SELECT
    ROUND(
        SUM(item_count * order_occurrences)
        /
        SUM(order_occurrences),
        1
    ) AS mean
FROM items_per_order;


/* Method 2: Using CTE */

WITH order_summary AS (
    SELECT
        item_count * order_occurrences AS total_items,
        order_occurrences
    FROM items_per_order
)

SELECT
    ROUND(
        SUM(total_items)
        /
        SUM(order_occurrences),
        1
    ) AS mean
FROM order_summary;