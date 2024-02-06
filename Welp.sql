SELECT *
FROM places;

SELECT *
FROM reviews;

SELECT *
FROM places 
WHERE price_point <= '$$';

SELECT *
FROM places
JOIN reviews
  ON reviews.place_id = places.id;

SELECT places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note
FROM places
JOIN reviews
  ON reviews.place_id = places.id;

SELECT places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note
FROM places
LEFT JOIN reviews
  ON reviews.place_id = places.id;

SELECT places.id, reviews.id, places.name
FROM places 
LEFT JOIN reviews
  ON reviews.place_id = places.id
  WHERE reviews.place_id IS NULL;

WITH review_20 AS(
  SELECT * 
  FROM reviews
  WHERE strftime("%Y", review_date) = '2020'
  )
  SELECT * 
  FROM places
  JOIN review_20
    ON places.id = review_20.place_id;

SELECT username, count(total_reviews), rating
FROM reviews
JOIN places
  ON reviews.place_id = places.id
WHERE rating < average_rating
GROUP BY username
ORDER BY 2 desc
LIMIT 10;

