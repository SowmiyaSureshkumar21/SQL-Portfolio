/*
Problem: Rising Temperature
Platform: LeetCode
LeetCode ID: 197
Difficulty: Easy

Approach:
- Use LAG() to get the previous day's temperature and date.
- Compare the current temperature with the previous temperature.
- Ensure the dates are consecutive using DATEDIFF().
- Return the ids where the temperature is higher than the previous day.

Concepts Used:
- LAG()
- Window Functions
- DATEDIFF()
*/

SELECT id
FROM (
    SELECT *,
           LAG(temperature) OVER (ORDER BY recordDate) AS previous_temp,
           LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date
    FROM Weather
) W
WHERE temperature > previous_temp
  AND DATEDIFF(recordDate, previous_date) = 1;