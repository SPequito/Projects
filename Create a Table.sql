CREATE TABLE friends (
id INTEGER,
name TEXT,
birthday DATE
);

INSERT INTO friends (id, name, birthday)
VALUES (1, "Ororo Munroe", "30-5-1940");

INSERT INTO friends (id, name, birthday)
VALUES (2, "Jasmine Meijer", "06-5-1988");

INSERT INTO friends (id, name, birthday)
VALUES (3, "Rafael Pequito", "26-6-1997");

UPDATE friends
SET name = "Storm"
WHERE id = 1;

ALTER TABLE friends
ADD email TEXT;

UPDATE friends
SET email = "storm@codecademy.com"
WHERE id = 1;

DELETE FROM friends
WHERE name = "Storm";

SELECT * 
FROM friends;