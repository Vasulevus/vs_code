USE [db_depositarium];
DECLARE @SQL NVARCHAR(MAX)
DROP TABLE IF EXISTS #A1;
DROP TABLE IF EXISTS #A2;
DROP TABLE IF EXISTS #A3;
CREATE TABLE #A1
(
	[9] FLOAT NOT NULL
)

SELECT
	'INSERT INTO #A1 SELECT [9] FROM [db_depositarium].[777].[' + [name] + ']'  AS [queries]
INTO #A2
FROM 
	sys.tables AS T 
WHERE 
	T.name LIKE '479556726_output_form_%'
AND
	T.name NOT LIKE '%flat%'

--	SELECT * FROM #A2;
	SET @SQL = (SELECT STRING_AGG([queries],';') AS cmd FROM #A2);
	EXECUTE (@SQL);
--	SELECT * FROM #A1;
	SELECT ROW_NUMBER() OVER(ORDER BY [9]) AS [П.н.], [9] INTO #A3 FROM #A1;
--	SELECT * FROM #A3;

	SELECT
    ROW_NUMBER() OVER(ORDER BY [9]) AS [П.н.]
	,'Розширений макет для проведення дослідної експлуатації по Україні' AS [Назва файлу]
	,'I15' AS [Адреса клітинки / функція]
	,[9] AS [Значення в клітинці]
	,'<=' AS [Умова перевірки/ отримання значення]
	,'1,00' AS [Значення для перевірки]
	,'-' AS [Адреса клітинки / функція 2]
	FROM
		#A1
	WHERE
	[9] > 1