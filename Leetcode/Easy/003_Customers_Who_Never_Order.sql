/*
Problem: Customers Who Never Order
Platform: LeetCode
LeetCode ID: 183
Difficulty: Easy

Approach 1:
- Use a LEFT JOIN to match customers with their orders.
- Customers without orders will have NULL values in the Orders table.
- Filter those customers using WHERE O.id IS NULL.

Concepts Used:
- LEFT JOIN
- NULL Filtering
*/

SELECT
    C.name AS Customers
FROM Customers C
LEFT JOIN Orders O
    ON C.id = O.customerId
WHERE O.id IS NULL;


/*
Alternative Approach:

- Use NOT EXISTS to check whether a customer has any matching order.
- Return only customers for whom no order exists.

Concepts Used:
- Correlated Subquery
- NOT EXISTS
*/

SELECT
    C.name AS Customers
FROM Customers C
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.customerId = C.id
);