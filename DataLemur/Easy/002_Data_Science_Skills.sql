-- Platform: DataLemur
-- Company: LinkedIn
-- Difficulty: Easy
-- Topic: GROUP BY, HAVING
-- Question: Data Science Skills

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;