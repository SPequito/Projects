--we have a column call time is datetime formate, device_id is id, login, channel, country, player, game, stream_format, subscriber

SELECT *
FROM stream
LIMIT 20;


--we have a column call time is date format, device_id is id, login, channel, country, player, game

SELECT *
FROM chat
LIMIT 20;

--see the unique game in stream table

SELECT DISTINCT game
FROM stream;

--see the unique channel in stream table

SELECT DISTINCT channel
FROM stream;

-- most pupolar game in stream table and group by game

SELECT game, COUNT(*) AS 'quantity'
FROM stream
GROUP BY game
ORDER BY quantity;

-- list of countries and there views to LOL league of legends

SELECT country, COUNT(*) AS 'view'
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY view DESC;

-- list of players and there views 

SELECT player, COUNT(*) AS 'num_streamers'
FROM stream
GROUP BY player
ORDER BY num_streamers DESC;

-- create a new column call genre and group the games using case: lol / DOTA 2/ Heroes of the Storm --> MOBA ; counter-strike: global offensive --> FPS; DayZ/ ARK: Survival Evolved --> Survival and the other --> Other

SELECT game, CASE
WHEN game = 'League of Legends' THEN 'MOBA'
WHEN game = 'Dota 2' THEN 'MOBA'
WHEN game = 'Heroes of the Storm' THEN 'MOBA'
WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
WHEN game = 'DayZ' THEN 'Survival'
WHEN game = 'ARK: Survival Evolved' THEN 'Survival'
ELSE 'Other'
END AS 'genre', COUNT(*) AS 'quantity'
FROM stream
GROUP BY game
ORDER BY quantity DESC;

-- return hour from time column and see how much views we have per hour and filter for user from my country

SELECT strftime('%H', time) AS 'hour', COUNT(*) AS 'views'
FROM stream
WHERE country = 'NZ'
GROUP BY hour;

-- join stream and chat tables using device_id key

SELECT *
FROM stream 
JOIN chat
ON stream.device_id = chat.device_id;
