/*
Problem: Big Countries
Platform: LeetCode
LeetCode ID: 595
Difficulty: Easy

Approach:
- Retrieve the required columns: name, population, and area.
- Filter countries that satisfy at least one of the following conditions:
  - Area is greater than or equal to 3,000,000.
  - Population is greater than or equal to 25,000,000.

Concepts Used:
- WHERE Clause
- Logical Operators (OR)
- Filtering
*/

SELECT
    name,
    population,
    area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;