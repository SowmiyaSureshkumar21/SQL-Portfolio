-- LeetCode 596
-- Problem: Classes With at Least 5 Students
-- Difficulty: Easy

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;