USE [db_depositarium];

DECLARE 
@date_for NVARCHAR(MAX),
@SQL NVARCHAR(MAX),
@year NCHAR(4),
@month NCHAR(2)



SET @date_for = '20220901'
SET @year = LEFT(@date_for,4)
SET @month = RIGHT(LEFT(@date_for,6),2)
SET @SQL = '
		SELECT
 	B.npp
	, ''Form_3'' AS [Назва форми]
	,''I59'' AS [Адреса клітинки / функція]
	,B.[Україна (всього)] AS [Значення в клітинці]
	,''='' AS [Умова перевірки/ отримання значення]
	,problems
	, ''F20'' AS [Адреса клітинки/ функція]
	, ''16 енерго'' AS [Макет]
	,''Form2'' AS [Назва форми зовнішньої]
FROM 
	(SELECT
		[npp]
		,ISNULL([Ukraine], 0) AS [Україна (всього)]
	FROM
		[db_depositarium].[777].[479556726_output_form_'+ @date_for +']
		) AS B
JOIN
	(
SELECT  
		CAST( ROW_NUMBER() OVER ( ORDER BY [date_for]) AS INT) AS [П.н.]
		, [date_for]
     , SUM(CAST([F_509940737] AS INT)) AS problems
  FROM [db_archive].[16_enerho].[input_form2] AS M
  WHERE date_for = '''+ @year +'-'+ @month +'-01''
  AND 
  [F_1517024731] <> ''ВСЬОГО:''
    AND 
	([company_name] = ''Північне територіальне управління обслуговування мережі'' 
	OR 
		[company_name] = ''Південне територіальне управління обслуговування мережі'')
  GROUP BY [date_for]
	) AS N
	ON B.npp = N.[П.н.]
	WHERE B.[Україна (всього)] <> problems
'

EXECUTE sp_executesql @SQL