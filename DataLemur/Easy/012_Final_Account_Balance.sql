-- Platform: DataLemur
-- Company: PayPal
-- Difficulty: Easy
-- Topic: CASE WHEN, Conditional Aggregation, CTE
-- Question: Final Account Balance

/* Method 1: Using Conditional Aggregation */

SELECT
    account_id,
    SUM(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount
            WHEN transaction_type = 'Withdrawal' THEN -amount
        END
    ) AS final_balance
FROM transactions
GROUP BY account_id;


/* Method 2: Using CTE */

WITH transaction_amounts AS (
    SELECT
        account_id,
        CASE
            WHEN transaction_type = 'Deposit' THEN amount
            WHEN transaction_type = 'Withdrawal' THEN -amount
        END AS adjusted_amount
    FROM transactions
)

SELECT
    account_id,
    SUM(adjusted_amount) AS final_balance
FROM transaction_amounts
GROUP BY account_id;