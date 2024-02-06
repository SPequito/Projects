SELECT *
 FROM survey
 LIMIT 5;

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

SELECT question, COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

SELECT question, COUNT(DISTINCT user_id), 100 *  COUNT(DISTINCT user_id) / 500 AS 'percent'
FROM survey
GROUP BY 1;

SELECT DISTINCT quiz.user_id,
 home_try_on.user_id IS NOT NULL AS 'is_home_try_on', 
 home_try_on.number_of_pairs,
 purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
 LEFT JOIN home_try_on
ON quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase
ON purchase.user_id = quiz.user_id
LIMIT 10;

