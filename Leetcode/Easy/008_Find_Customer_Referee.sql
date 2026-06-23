/*
Problem: Find Customer Referee
Platform: LeetCode
LeetCode ID: 584
Difficulty: Easy

Approach:
- Return customers who were not referred by customer with id = 2.
- Include customers whose referee_id is NULL.
- Handle NULL explicitly because comparisons with NULL return UNKNOWN.

Concepts Used:
- WHERE Clause
- NULL Handling
- Logical Operators
*/

SELECT
    name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;