--CREATE VARIABLE



--CREATE TRIGGER



--variable and if and begin/end
 USE AdventureWorksDW2019;
 DECLARE @FIRST DECIMAL(10,3)
 SELECT @FIRST = AVG(SalesAmount) FROM FactInternetSales;
 IF (
		SELECT MIN(SalesAmount) FROM FactInternetSales WHERE UnitPrice < 50
	) > @FIRST * 2
BEGIN
	PRINT 'BIG NUMBER OF SALES '
END
ELSE
	PRINT @FIRST

--CREATE PROCEDURE
USE [Sample]
GO

/****** Object:  StoredProcedure [dbo].[modify_num]    Script Date: 20.09.2022 11:27:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[modify_num] (@old_no INTEGER, @new_no INTEGER)
	AS UPDATE employee
		SET emp_no = @new_no
		WHERE emp_no = @old_no
	UPDATE works_on
		SET emp_no = @new_no
		WHERE emp_no = @old_no
GO


--Execution of procedure
USE Sample;
GO
EXECUTE [dbo].[modify_num] @old_no 10102, @new_no 3456

--another variant of procedure

USE [Sample]
GO

SET ANSI_NULLS ON
GO

SET NOCOUNT ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE delete_employee @employee INT, @counter INT OUTPUT
	AS SELECT @counter = COUNT(*)
		FROM works_on
		WHERE emp_no = @employee
	DELETE FROM employee
		WHERE emp_no = @employee
	DELETE FROM works_on
		WHERE emp_no = @employee

--exec
USE [Sample]
GO
DECLARE @quantity INT;
EXECUTE delete_employee  @employee = 1108,  @counter = @quantity OUTPUT;
GO


-- with result sets

EXECUTE Count_b @dept = 'd3'
	WITH RESULT SETS
	(
		( [number] NVARCHAR(10),
			[name] NVARCHAR(20),
			[surname] NVARCHAR(20),
			[department] NVARCHAR(20)
			)
	)