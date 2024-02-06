 /* SELECT title, score  
 FROM hacker_news
 ORDER BY score DESC
 LIMIT 5;

 SELECT SUM(score)
 FROM hacker_news;

 SELECT user, SUM(score) 
 FROM hacker_news
 GROUP by user
 HAVING SUM(score) > 200
 ORDER BY 2 DESC;

this is all the user from last select and divide wit the result from select sum(score)
SELECT (517+309+304+282) / 6366.0;

SELECT user, COUNT(*)
FROM hacker_news
WHERE url like "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
GROUP BY user
ORDER BY COUNT(*) DESC;

SELECT CASE 
WHEN url LIKE "%github.com%" THEN "GitHub"
WHEN url LIKE "%medium.com%" THEN "Medium"
WHEN url LIKE "%nytimes.com%" THEN "New York Times"
ELSE "Other"
END AS "Source"
,COUNT(*)
FROM hacker_news
GROUP BY 1;
This is standart one
SELECT timestamp 
FROM hacker_news
LIMIT 10;
this is more clean one 

SELECT timestamp, strftime("%m", timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

SELECT strftime("%H", timestamp), AVG(score), COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;
*/

SELECT strftime("%H", timestamp) AS "HOURS", ROUND(AVG(score), 2) AS " AVG SCORE", COUNT(*) AS "COUNT STORIES"
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

