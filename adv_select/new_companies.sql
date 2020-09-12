
-- SETUP -----------------------
-- Create the tables
CREATE TABLE COMPANY (
	company_code varchar(2),
	founder varchar(20)
)

CREATE TABLE LEAD_MANAGER (
	lead_manager_code varchar(3),
	company_code varchar(2)
)

CREATE TABLE SENIOR_MANAGER (
	senior_manager_code varchar(3),
	lead_manager_code varchar(3),
	company_code varchar(2)
)

CREATE TABLE MANAGER (
	manager_code varchar(2),
	senior_manager_code varchar(3),
	lead_manager_code varchar(3),
	company_code varchar(2)
)

CREATE TABLE EMPLOYEE (
	employee_code varchar(2),
	manager_code varchar(2),
	senior_manager_code varchar(3),
	lead_manager_code varchar(3),
	company_code varchar(2)
)

-- Populate the tables
INSERT INTO COMPANY VALUES ('C1', 'Monika');
INSERT INTO COMPANY VALUES ('C2', 'Samantha');

INSERT INTO LEAD_MANAGER VALUES ('LM1', 'C1');
INSERT INTO LEAD_MANAGER VALUES ('LM2', 'C2');

INSERT INTO SENIOR_MANAGER VALUES ('SM1', 'LM1', 'C1');
INSERT INTO SENIOR_MANAGER VALUES ('SM2', 'LM1', 'C1');
INSERT INTO SENIOR_MANAGER VALUES ('SM3', 'LM2', 'C2');

INSERT INTO MANAGER VALUES ('M1', 'SM1', 'LM1', 'C1');
INSERT INTO MANAGER VALUES ('M2', 'SM3', 'LM2', 'C2');
INSERT INTO MANAGER VALUES ('M3', 'SM3', 'LM2', 'C2');

INSERT INTO EMPLOYEE VALUES ('E1', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO EMPLOYEE VALUES ('E2', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO EMPLOYEE VALUES ('E3', 'M2', 'SM3', 'LM2', 'C2');
INSERT INTO EMPLOYEE VALUES ('E4', 'M3', 'SM3', 'LM2', 'C2');

-- View tables
SELECT * FROM COMPANY
SELECT * FROM LEAD_MANAGER
SELECT * FROM SENIOR_MANAGER
SELECT * FROM MANAGER
SELECT * FROM EMPLOYEE

-- SOLUTION: MS SQL, Postgres
SELECT
	c.company_code,
	c.founder,
	l.count_l_mgr,
	sm.count_sr_mgr,
	m.count_mgr,
	e.count_e
FROM COMPANY AS c
JOIN (
	SELECT
		l.company_code,
		COUNT(*) AS count_l_mgr
	FROM (
		SELECT DISTINCT
			lead_manager_code,
			company_code
		FROM LEAD_MANAGER
	) AS l
	GROUP BY l.company_code
) AS l
ON l.company_code = c.company_code
JOIN (
  SELECT
  	company_code,
  	COUNT(*) AS count_sr_mgr
  FROM (
  SELECT DISTINCT
  	senior_manager_code,
  	lead_manager_code,
  	company_code
  FROM SENIOR_MANAGER
  ) sr_mgr
  GROUP BY company_code
) AS sm
ON sm.company_code = c.company_code
JOIN (
  SELECT
  	company_code,
  	COUNT(*) AS count_mgr
  FROM (
  	SELECT DISTINCT
  		manager_code,
  		company_code
  	FROM MANAGER
  ) AS m
  GROUP BY m.company_code
) AS m
ON m.company_code = c.company_code
JOIN (
  SELECT
  	company_code,
  	COUNT(*) AS count_e
  FROM (
  SELECT DISTINCT
  	employee_code,
  	company_code
  FROM EMPLOYEE
  ) AS e
  GROUP BY e.company_code
) AS e
ON e.company_code = c.company_code
ORDER BY c.company_code
