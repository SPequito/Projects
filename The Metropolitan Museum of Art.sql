 SELECT *
 FROM met
 LIMIT 10;

 SELECT COUNT(*) as 'total'
 FROM met ;

SELECT COUNT(*)
FROM met
WHERE category LIKE '%celery%';

/*me version*/
SELECT title, medium
FROM met 
ORDER BY date asc
LIMIT 10;

SELECT date, title, medium
FROM met
WHERE date LIKE '%1600%';

SELECT country, COUNT(*) as 'Total'
FROM met
WHERE country IS NOT NULL
GROUP BY country
ORDER by Total DESC
LIMIT 10;

SELECT category
FROM met
GROUP By 1
HAVING COUNT(*) > 100;

SELECT medium, COUNT(*) as 'Total'
FROM met
WHERE medium LIKE '%gold%' OR medium LIKE '%silver%'
GROUP BY medium
ORDER BY Total DESC;