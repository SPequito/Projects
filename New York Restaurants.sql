SELECT * ,
/*SELECT DISTINCT neighborhood */
/*SELECT DISTINCT cuisine*/
CASE
    WHEN review > 4.5 THEN "is Extraordinary"
    WHEN review > 4 THEN "is Excellent"
    WHEN review > 3 THEN "is Good"
    WHEN review > 2 THEN "is Fair"
  ELSE "is Poor"
END AS "my_review"
FROM nomnom;
/*WHERE review < 4;*/
/*WHERE cuisine = "Italian" AND price = "$$$";*/
/*WHERE name LIKE  "%meatball%";*/
/*WHERE neighborhood = "Midtown"
OR neighborhood = "Downtown "
OR neighborhood = "Chinatown";*/
/*WHERE health IS null; */

/*ORDER BY review desc
LIMIT 10;*/


