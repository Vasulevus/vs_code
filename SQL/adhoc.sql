
--пошук загублених запитів
SELECT *
FROM sys.dm_exec_cached_plans AS p
CROSS APPLY sys.dm_exec_sql_text(p.plan_handle) AS t
WHERE objtype = 'Adhoc'
AND
text LIKE '%@schemaname1%'


USE db_depositarium;  DECLARE @schemaname1 NVARCHAR(MAX) = '16_enerho' -- назва схеми  
,@schemaname2 NVARCHAR(MAX) = '777' -- назва схеми  
,@sqlcmd VARCHAR(MAX)      
DROP TABLE IF EXISTS #AAA;    
SELECT    
	'DROP TABLE IF EXISTS [' + T.[name] + ']' AS [TABLES] -- формуємо запит для видалення всередині таблиці  
INTO   
	#AAA  
FROM    
	sys.tables AS T  
JOIN   
	sys.schemas AS S  
ON   
	T.schema_id = S.schema_id 
WHERE   
	S.name = @schemaname2      

SELECT    
	STRING_AGG([TABLES],';') AS [TABLES]
FROM    
	#AAA;    
/*  SET @sqlcmd = ( SELECT    STRING_AGG([TABLES],';') AS [TABLES]   FROM    #AAA)      EXECUTE(@sqlcmd);  */

USE db_archive;
CREATE OR ALTER PROCEDURE dropping
DECLARE @title NVARCHAR(MAX) = '777'
AS
BEGIN
    DECLARE @sql
    SET @sql = 'DELETE FROM [ms-reports].[dbo].[in_report] WHERE title LIKE ''%' + @title + '%'
    EXECUTE @sql
END