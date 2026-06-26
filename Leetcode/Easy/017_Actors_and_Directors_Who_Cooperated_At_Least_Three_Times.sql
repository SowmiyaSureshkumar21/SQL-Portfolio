-- LeetCode 1050
-- Problem: Actors and Directors Who Cooperated At Least Three Times
-- Difficulty: Easy

/*
Approach:

Group the records by actor_id and director_id.
Count the number of collaborations for each actor-director pair.
Return only those pairs that have worked together at least three times.
*/

SELECT
    actor_id,
    director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;