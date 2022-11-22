USE db_archive;

DECLARE 
      @year NVARCHAR(50),
      @month NVARCHAR(50)
SET @year = '2021'
SET @month = '05'
IF OBJECT_ID('[db_depositarium].[16_enerho].[output_form3_' + @year +'_' + @month + ']') IS NULL

BEGIN
EXEC   ( 'CREATE TABLE [db_depositarium].[16_enerho].[output_form3_' + @year +'_' + @month + '] (A INT NOT NULL)')
PRINT 'DONE'
END
ELSE

SELECT 1