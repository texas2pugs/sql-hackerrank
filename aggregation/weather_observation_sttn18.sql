
-- PROBLEM
-- Let P1(a,b) and P2(c,d) be two points on a 2D plane.
-- a: Minimum value in the Northern Latitude (lat_n in STATION)
-- b: Minimum value in the Western Longitude (long_w in STATION)
-- c: Maximum value in the Northern Latitude (lat_n in STATION)
-- d: Maximum value in the Western Longitude (long_w in STATION)

-- View the data
SELECT * FROM STATION p1 WHERE p1.city = 'McKinney'
SELECT * FROM STATION p2 WHERE p2.city = 'San Diego'

-- SOLUTION
SELECT
  cast(abs(min(lat_n) - max(lat_n)) + abs(min(long_w) - max(long_w)) AS numeric(10,4))
FROM STATION

-- View distance given two IDs
SELECT
p1.city,
p2.city,
cast(abs(p1.lat_n - p2.lat_n) + abs(p1.long_w - p2.long_w) AS numeric(10,4)) AS "Manhattan distance"
FROM STATION p1
JOIN STATION p2
ON p2.id != p1.id
AND p2.id = 2
WHERE p1.id = 1
