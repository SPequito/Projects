-- 1
-- What are the column names?
SELECT *
FROM users
LIMIT 20;

 
-- 2
-- Find the email addresses and birthdays of users whose 
-- birthday is between 1980-01-01 and 1989-12-31.
SELECT birthday, email
FROM users
WHERE birthday BETWEEN '1980-01-01' AND '1989-12-31';
   
-- 3
-- Find the emails and creation date of users 
-- whose created_at date matches this condition.
SELECT created_at, email
FROM users
WHERE created_at < '2017-05-01'
ORDER BY created_at ASC;

-- 4
-- Find the emails of the users who received the ‘bears’ test.
SELECT test, email
FROM users
WHERE test = 'bears';

-- 5
-- Find all the emails of all users who 
-- received a campaign on website BBB.
SELECT campaign, email
FROM users
WHERE campaign LIKE 'BBB%'
ORDER BY campaign ASC;

-- 6
-- Find all the emails of all users who received ad copy 2 in 
-- their campaign.
SELECT campaign, email
FROM users
WHERE campaign LIKE '%-2'
ORDER BY campaign ASC;

-- 7
-- Find the emails for all users who received both a campaign and a test. 
-- These users will have non-empty entries in the 
-- campaign and test columns.
SELECT email
FROM users
WHERE campaign IS NOT NULL AND test IS NOT NULL;

-- 8
-- Challenge
-- One of the members of the marketing team had an idea of calculating
-- how old users were when they signed up.

SELECT TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), created_at) AS age_at_signup
FROM users;
