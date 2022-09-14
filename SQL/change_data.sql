USE sample;
--INSERT

INSERT INTO employee VALUES (10101, 'Max', 'Black', 'd4')


DELETE FROM employee WHERE emp_no = '10101';

SELECT 
	*
INTO emp_d1_d2
FROM employee
WHERE dept_no IN ('d1', 'd2');


CREATE TABLE emp_d1_d2_2
	(
		emp_no NVARCHAR(10) NOT NULL,
		emp_fname NVARCHAR(20) NOT NULL,
		emp_lname NVARCHAR(20) NOT NULL,
		dept_no NCHAR(2) NULL
	);

INSERT INTO emp_d1_d2_2 
	SELECT *
	FROM employee
	WHERE dept_no IN ('d1', 'd2');

SELECT * FROM emp_d1_d2_2;
--CLEAR TABLE
TRUNCATE TABLE emp_d1_d2_2;


USE sample;
SELECT 
	 e.emp_no AS number
	,e.emp_fname AS name
	,e.emp_lname AS surname
	,e.dept_no
	,d.dept_name
	,d.location
INTO empANDdep
FROM employee AS e
JOIN
department AS d
ON e.dept_no = d.dept_no
WHERE e.dept_no IN ('d1','d2');


SELECT * FROM empANDdep;

CREATE TABLE empANDdep2
	(
		[number] NVARCHAR(10) NOT NULL
		,[name] NVARCHAR(15) NOT NULL
		,[surname] NVARCHAR(15) NOT NULL
		,[dept_no] NCHAR(2) NULL
		,[dept_name] NVARCHAR(15) NULL
		,[location] NVARCHAR(15) NULL
	);

INSERT INTO empANDdep2
SELECT
	e.emp_no
	, e.emp_fname
	, e.emp_lname
	, e.dept_no
	, d.dept_name
	, d.location
FROM
	employee AS e
JOIN
	department AS d
ON d.dept_no = e.dept_no

SELECT * FROM empANDdep2;

--UPDATE
UPDATE project
SET budget = NULL;


UPDATE department
SET dept_name = 'Sales' FROM department AS d
JOIN
employee AS e
ON d.dept_no = e.dept_no WHERE e.emp_fname = 'James';


--Delete

DELETE works_on FROM works_on AS w JOIN employee AS e ON w.emp_no = e.emp_no JOIN department AS d ON e.dept_no = d.dept_no WHERE d.location = 'Dallas'