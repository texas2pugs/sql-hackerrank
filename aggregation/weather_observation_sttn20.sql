
-- PROBLEM
-- A median is defined as a number separating the higher half of a data set
--   from the lower half. Query the median of the Northern Latitudes (LAT_N)
--   from STATION and round your answer to 4 decimal places.

-- SETUP
-- CREATE TABLE
CREATE TABLE STATION (
  id smallint,
  city varchar(21),
  state varchar(2),
  lat_n double precision,
  long_w double precision
)

-- Populate table
INSERT INTO STATION VALUES ('1','McKinney','TX','33.1983','96.6389');
INSERT INTO STATION VALUES ('2','San Diego','CA','32.7157','117.1611');
INSERT INTO STATION VALUES ('3','New York City','NY','40.7128','74.0060');

-- View table
SELECT * FROM STATION

-- SOLUTION: MS SQL, PostgreSQL
SELECT
	CAST(lat_n AS numeric(10,4))
FROM STATION s
WHERE (
	SELECT COUNT(lat_n)
	FROM STATION
	WHERE lat_n < s.lat_n
) = (
	SELECT COUNT(lat_n)
	FROM STATION
	WHERE lat_n > s.lat_n
);
