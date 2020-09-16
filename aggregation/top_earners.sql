
-- PROBLEM
-- We define an employee's total earnings to be their monthly SALARY X MONTHS
--   worked, and the maximum total earnings to be the maximum total earnings
--   for any employee in the Employee table. Write a query to find the maximum
--   total earnings for all employees as well as the total number of employees
--   who have maximum total earnings. Then print these values as 2
--   space-separated integers.

-- SETUP
--DROP TABLE EMPLOYEE

-- CREATE TABLE
CREATE TABLE EMPLOYEE (
  employee_id int,
  name varchar(50),
  months int,
  salary int
)

-- Populate table
INSERT INTO EMPLOYEE VALUES (12228, 'Rose', 15, 1968);
INSERT INTO EMPLOYEE VALUES (33645, 'Angela', 15, 3443);
INSERT INTO EMPLOYEE VALUES (45692, 'Frank', 17, 1608);
INSERT INTO EMPLOYEE VALUES (56118, 'Patrick', 7, 1345);
INSERT INTO EMPLOYEE VALUES (59725, 'Lisa', 11, 2330);
INSERT INTO EMPLOYEE VALUES (74197, 'Kimberly', 16, 4372);
INSERT INTO EMPLOYEE VALUES (78454, 'Bonnie', 8, 1771);
INSERT INTO EMPLOYEE VALUES (83565, 'Michael', 6, 2017);
INSERT INTO EMPLOYEE VALUES (98607, 'Todd', 5, 3396);
INSERT INTO EMPLOYEE VALUES (99989, 'Joe', 9, 3573);

-- View table
SELECT * FROM EMPLOYEE

-- SOLUTION: MS SQL, PostgreSQL
SELECT
	months * salary,
	COUNT(*)
FROM EMPLOYEE
WHERE months * salary = (
	SELECT MAX(months * salary)
	FROM EMPLOYEE
)
GROUP BY months * salary;

