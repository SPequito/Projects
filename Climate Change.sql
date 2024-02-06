SELECT *
FROM state_climate
limit 5;

-- how to see avg temp for each stage we can round to be more easy to read ( can see tempc or tempf)

SELECT state, year, ROUND(tempc,2) AS tempc, ROUND(AVG(tempc) OVER (
  PARTITION BY state
  ORDER BY year
),2) AS 'running_avg_temp'
FROM state_climate
LIMIT 5;

-- how to see min temp for each stage we can round to be more easy to read ( can see tempc or tempf)

SELECT state, year, ROUND(tempc,2) AS tempc, ROUND(MIN(tempc) OVER (
  PARTITION BY state
  ORDER BY tempc
),2) AS 'lowest_temp'
FROM state_climate
LIMIT 5;

-- how to see max temp for each stage we can round to be more easy to read ( can see tempc or tempf)

SELECT state, year, ROUND(tempc,2) AS tempc, ROUND(MAX(tempc) OVER (
  PARTITION BY state
  ORDER BY tempc
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
),2) AS 'highest_temp'
FROM state_climate
LIMIT 5;

-- see how the temp change for each stage ( can see tempc or tempf and without nulls)

SELECT state, year, ROUND(tempc,2) AS tempc, ROUND(LAG(tempc,1,0) OVER (
  PARTITION BY state
  ORDER BY year
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
),2) AS 'change_in_temp'
FROM state_climate
ORDER BY change_in_temp DESC
LIMIT 5;

-- rank the coldest temp record  ( can see tempc or tempf)

SELECT state, year, ROUND(tempc,2) AS tempc, RANK() OVER (
  ORDER BY tempc ASC
) AS 'coldest_rank'
FROM state_climate
LIMIT 5
;

-- rank the Warmest temp record  ( can see tempc or tempf)

SELECT state, year, ROUND(tempc,2) AS tempc, RANK() OVER (
  ORDER BY tempc DESC
) AS 'warmest_rank '
FROM state_climate
LIMIT 5
;

-- see the avg temp in quartiles instead of in rankings for each state

SELECT state, year, ROUND(tempc,2) AS tempc, NTILE(4) OVER (
  ORDER BY tempc 
) AS 'quartile'
FROM state_climate
;

-- see the avg temp in quintiles instead of in rankings for each state

SELECT state, year, ROUND(tempc,2) AS tempc, NTILE(5) OVER (
  ORDER BY tempc 
) AS 'quintile'
FROM state_climate
;