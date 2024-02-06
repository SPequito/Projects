 SELECT *
 FROM subscriptions
 LIMIT 10;

 SELECT MAX(subscription_start) as start_max, MIN(subscription_start) as start_min,MAX(subscription_end) as end_max, MIN(subscription_end) as end_min
 FROM subscriptions;

 months AS (
   SELECT
    '2017-01-01' AS first_day,
    '2017-01-31' AS last_day
  UNION
  SELECT
    '2017-02-01' AS first_day,
    '2017-02-28' AS last_day
  UNION
  SELECT
    '2017-03-01' AS first_day,
    '2017-03-30' AS last_day
 ),
 cross_join AS (
  SELECT *
  FROM subscriptions 
  CROSS JOIN months
 ),
 status AS (
  SELECT id, first_day as month, CASE
  WHEN (segment = '87')
  THEN 1
  ELSE 0
  END AS is_active_87,
  CASE
   WHEN (segment = '30')
  THEN 1
  ELSE 0
  END AS is_active_30,
   CASE
   WHEN subscription_end BETWEEN first_day AND last_day THEN 1
      ELSE 0
    END AS is_canceled
FROM cross_join
 ),
 status_aggregate AS (
  SELECT
    month,
    SUM(is_active_87) AS active_87,
    SUM(is_active_30) AS active_30,
    SUM(is_canceled) AS canceled
  FROM status
  GROUP BY month
)
SELECT
  month,
  1.0 * canceled / active_87 + active_30 AS churn_rate
FROM status_aggregate;