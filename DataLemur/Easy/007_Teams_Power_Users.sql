-- Platform: DataLemur
-- Company: Microsoft
-- Difficulty: Easy
-- Topic: GROUP BY, Date Functions
-- Question: Teams Power Users

SELECT sender_id,
       COUNT(message_id) AS message_count
FROM messages
WHERE MONTH(sent_date) = 8
  AND YEAR(sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;