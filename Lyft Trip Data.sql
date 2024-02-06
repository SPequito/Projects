/*

SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

all the data its join
SELECT *
  FROM riders
    CROSS JOIN cars;

or with last data we use this 
SELECT riders.first,
   riders.last,
   cars.model
FROM riders, cars;

we are puting a new table call rider_id a right
SELECT *
 FROM trips
  LEFT JOIN riders
  ON trips.rider_id = riders.id ;

we join at position id from trips to the same car id
SELECT *
FROM trips 
INNER JOIN cars on trips.car_id = cars.id;

we union to tables together
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

see the avg cost from trip table
SELECT AVG(cost)
FROM trips;


we see all trips less that 500
SELECT *
FROM riders
WHERE total_trips < 500;

we see all the actives car avalable
SELECT SUM(id)
FROM cars
WHERE status = "active"
;


we select the two cars with more trip 
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2; 
*/



