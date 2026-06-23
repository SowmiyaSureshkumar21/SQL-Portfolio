/*
Problem: Customer Placing the Largest Number of Orders
Platform: LeetCode
LeetCode ID: 586
Difficulty: Easy

Approach:
- Group orders by customer_number.
- Count the number of orders placed by each customer.
- Sort customers by order count in descending order.
- Return the customer with the highest number of orders.

Concepts Used:
- GROUP BY
- COUNT()
- ORDER BY
- LIMIT
*/

SELECT
    customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;