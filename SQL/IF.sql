USE sample;

IF ( --умова
		SELECT COUNT(*)
		FROM works_on
		WHERE project_no = 'p2'
		GROUP BY project_no ) > 5
	BEGIN -- початок Block of Statements
		PRINT 'Something' -- друк в результатах
	END ---- кінець Block of Statements
	ELSE 
	BEGIN
		PRINT 'List of workers'
		SELECT emp_fname, emp_lname
		FROM employee
	END