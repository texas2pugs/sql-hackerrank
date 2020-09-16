
-- PROBLEM
-- Query the greatest value of the N Latitudes (lat_n)
-- from STATION that is less than 137.2345.  Truncate
-- the answer to 4 decimal places

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
  CAST(MAX(LAT_N) AS numeric(10,4))
FROM STATION
WHERE LAT_N < 137.2345
