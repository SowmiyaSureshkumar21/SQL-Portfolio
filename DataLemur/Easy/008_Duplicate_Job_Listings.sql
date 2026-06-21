-- Platform: DataLemur
-- Company: LinkedIn
-- Difficulty: Easy
-- Topic: Aggregation, GROUP BY, Subquery
-- Question: Duplicate Job Listings

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
    SELECT
        company_id,
        title,
        description,
        COUNT(*) AS job_count
    FROM job_listings
    GROUP BY company_id, title, description
) AS job_count_cte
WHERE job_count > 1;