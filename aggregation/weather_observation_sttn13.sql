
-- PROBLEM
-- Query the sum of Northern Latitudes (LAT_N) from STATION having values
--   greater than 137.2345 and less than 38.788. Truncate your answer to 
--   4 decimal places.

-- View the data
SELECT * FROM STATION p1 WHERE p1.city = 'McKinney'
SELECT * FROM STATION p2 WHERE p2.city = 'San Diego'

-- SOLUTION
SELECT
  CAST(SUM(lat_n) AS numeric(10,4))
FROM STATION
WHERE lat_n BETWEEN 38.788 AND 137.2345
