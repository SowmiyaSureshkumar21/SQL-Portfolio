-- LeetCode 3436: Find Valid Emails
-- Difficulty: Easy

SELECT
    user_id,
    email
FROM Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
ORDER BY user_id;

-- REGEXP Breakdown:
-- ^                 : Start of the string
-- [A-Za-z0-9_]+     : One or more letters (A-Z, a-z), digits (0-9), or underscores (_)
-- @                 : Exactly one '@' symbol
-- [A-Za-z]+         : One or more letters for the domain name
-- \\.               : Escaped dot (.) to match a literal period
-- com               : Matches the text "com"
-- $                 : End of the string