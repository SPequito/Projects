ELECT *
FROM users
LIMIT 10;

SELECT *
FROM posts
LIMIT 10;

SELECT *
FROM subreddits
LIMIT 10;

SELECT COUNT(*) as 'Total subreddits'
FROM subreddits;

SELECT username, MAX(score)
FROM users;

SELECT title , MAX(score)
FROM posts;

SELECT *
FROM subreddits
ORDER BY subscriber_count DESC
LIMIT 5;

SELECT users.username, COUNT(posts.user_id) AS 'post'
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.id
ORDER BY 2 DESC;

SELECT *
FROM posts
JOIN  users
ON posts.user_id = users.id;

SELECT * 
FROM posts 
UNION
SELECT *
FROM posts2;

WITH temp_score AS (
  SELECT *
  FROM posts
  WHERE score >= 5000
)
SELECT subreddits.name, temp_score.title, temp_score.score
FROM subreddits
INNER JOIN temp_score
  ON subreddits.id = temp_score.subreddit_id
ORDER BY temp_score.score DESC;

SELECT posts.title, subreddits.name AS 'sub_name', MAX(posts.score) AS 'MAX_SCOre'
FROM posts
JOIN subreddits
  on subreddits.id = posts.subreddit_id
GROUP BY subreddits.id;

SELECT subreddits.name, ROUND(AVG(posts.score), 2) AS 'AVG_SCORE'
FROM subreddits
JOIN posts
ON subreddits.id = posts.subreddit_id
GROUP BY subreddits.name
ORDER BY 2 DESC;