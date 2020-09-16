
-- PROBLEM
-- Query the smallest Northern Latitude (LAT_N) from STATION that is
--   greater than 38.7780. Round your answer to  decimal places.

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

-- SOLUTION: MS SQL, PostgreSQL, Oracle
SELECT
  CAST(MIN(lat_n) AS numeric(10,4))
FROM STATION
WHERE lat_n > 38.778;
