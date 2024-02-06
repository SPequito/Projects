/*
Here's the first-touch query, in case you need it
*/
SELECT COUNT(DISTINCT utm_campaign) AS 'campaigns_count'
FROM page_visits;

SELECT COUNT (DISTINCT utm_source) As 'source_count'
FROM page_visits;

SELECT DISTINCT utm_campaign AS 'campaign', utm_source As 'source'
FROM page_visits;

SELECT DISTINCT page_name
FROM page_visits;

-- many firts touch, organizer counting the number of firts touches each campaign
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT 	pv.utm_campaign,
    pv.utm_source,
    count(first_touch_at) as 'first_count_touch'
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
GROUP BY 1
ORDER BY 3 DESC;

-- many last touch, organizer counting the number of firts touches each campaign

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT 	pv.utm_campaign,
    pv.utm_source,
    count(last_touch_at) as 'last_count_touch'
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY 1
ORDER BY 3 DESC;

-- try to see how many people make a purchase
SELECT COUNT(DISTINCT user_id) AS 'count_purchase'
FROM page_visits
WHERE page_name = '4 - purchase';


-- try to find how many lasttouches have purchase campaign 

With last_touch AS (
  SELECT user_id,MAX(timestamp) as last_touch_at
  FROM page_visits
  WHERE page_name = '4 - purchase'
  GROUP BY user_id
)
SELECT pv.utm_campaign, pv.utm_source, COUNT(lt.last_touch_at) AS 'last_touch', pv.page_name
FROM last_touch AS 'lt'
JOIN page_visits AS 'pv'
ON lt.user_id = pv.user_id AND lt.last_touch_at = pv.timestamp
GROUP BY 1
ORDER BY 3 DESC;


WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
		pv.utm_campaign
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp;


