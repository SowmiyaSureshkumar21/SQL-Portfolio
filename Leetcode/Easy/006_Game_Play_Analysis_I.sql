/*
Problem: Game Play Analysis I
Platform: LeetCode
LeetCode ID: 511
Difficulty: Easy

Approach 1:
- Use ROW_NUMBER() to rank login dates for each player.
- Keep only the first login date (rn = 1).

Concepts Used:
- ROW_NUMBER()
- Window Functions
- PARTITION BY
*/

SELECT
    player_id,
    event_date AS first_login
FROM (
    SELECT
        player_id,
        event_date,
        ROW_NUMBER() OVER (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS rn
    FROM Activity
) A
WHERE rn = 1;


/*
Alternative Approach:

- Find the earliest login date for each player using MIN().
- Group records by player_id.

Concepts Used:
- GROUP BY
- MIN()
- Aggregation
*/

SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;