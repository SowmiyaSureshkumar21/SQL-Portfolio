-- LeetCode 1148
-- Problem: Article Views I
-- Difficulty: Easy

/*
Solution 1: WHERE + DISTINCT

Approach:

Select the author_id from the Views table.
Filter only those rows where the author viewed
their own article by checking whether author_id
and viewer_id are the same.

Use DISTINCT to remove duplicate authors and
sort the result in ascending order.
*/

SELECT DISTINCT
    author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;


/*
Alternative Solution: EXISTS

Approach:

For each row in the Views table, use a correlated
subquery to check whether the same author has viewed
their own article.

If such a record exists, return the author_id.

Use DISTINCT to remove duplicate authors and
sort the result in ascending order.
*/

SELECT DISTINCT
    v.author_id AS id
FROM Views v
WHERE EXISTS (
    SELECT 1
    FROM Views vs
    WHERE vs.author_id = v.author_id
      AND vs.viewer_id = v.author_id
)
ORDER BY id;