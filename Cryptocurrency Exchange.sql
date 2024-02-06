 SELECT *
 FROM transactions;

 SELECT SUM(money_in) as 'total money in', SUM(money_out) as 'total money out'
 FROM transactions;
 /*WHERE money_in IS NOT NULL AND money_out IS NOT NULL;*/

 SELECT COUNT(money_in) AS 'money in transactions'
 FROM transactions
 WHERE money_in IS NOT NULL;

 SELECT COUNT(money_in) AS 'money in transactions are BIT'
 FROM transactions
 WHERE currency = 'BIT';

 SELECT MAX(money_in) AS 'max transaction in', MAX(money_out) AS 'max transaction out'
 FROM transactions;

SELECT AVG(money_in) AS 'AVG money in for ETH'
FROM transactions
WHERE currency = 'ETH';

SELECT date, AVG(money_in),AVG(money_out)
FROM transactions
GROUP BY date;

SELECT date, ROUND(AVG(money_in),2) AS 'AVG money in',ROUND(AVG(money_out),2) AS 'AVG money out'
FROM transactions
GROUP BY date;