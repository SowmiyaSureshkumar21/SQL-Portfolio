-- Platform: DataLemur
-- Company: Facebook
-- Difficulty: Easy
-- Topic: LEFT JOIN, Anti Join
-- Question: Page With No Likes

SELECT P.page_id
FROM pages P
LEFT JOIN page_likes PL
    ON P.page_id = PL.page_id
WHERE PL.page_id IS NULL
ORDER BY P.page_id;