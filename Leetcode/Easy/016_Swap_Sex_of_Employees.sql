-- LeetCode 627
-- Problem: Swap Sex of Employees
-- Difficulty: Easy

/*
Solution 1: CASE

Approach:

Use a CASE expression to swap the values of the 'sex' column
in a single UPDATE statement.

- Change 'm' to 'f'.
- Change 'f' to 'm'.

The CASE expression evaluates the original value of each row
before performing the update, allowing all values to be swapped
without using a temporary table.
*/

UPDATE Salary
SET sex = CASE
            WHEN sex = 'm' THEN 'f'
            ELSE 'm'
          END;

/*
Alternative Solution: IF (MySQL)

Approach:

Use the IF() function to check the current value of 'sex'.

- If it is 'm', change it to 'f'.
- Otherwise, change it to 'm'.
*/

UPDATE Salary
SET sex = IF(sex = 'm', 'f', 'm');