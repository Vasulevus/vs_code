USE [db_archive];

DECLARE @date_for NVARCHAR(MAX)
SET @date_for = '20220901'



SELECT
 A.[П.н.]
	, 'Form_3' AS [Назва форми]
	,'I59' AS [Адреса клітинки / функція]
	,A.[Україна (всього)] AS [Значення в клітинці]
	,'=' AS [Умова перевірки/ отримання значення]
	,problems
	, 'F20' AS [Адреса клітинки/ функція]
	, '16 енерго' AS [Макет]
	,'Form2' AS [Назва форми зовнішньої]
FROM (
	SELECT
		ROW_NUMBER() OVER ( ORDER BY (CAST([IF1].[F931084159] AS INT))) AS [П.н.]
		,CAST([IF3].[F_360781186] AS decimal(15,2)) + CAST([IF4].F_360781186 AS decimal(15,2)) +
		CAST([IF1].[F_360781186] AS decimal(15,2)) + CAST([IF2].[F1920758396] AS decimal(15,2)) AS [Україна (всього)]
	FROM 
		[777].[input_form1] AS IF1
	JOIN
		[777].[input_form2] AS IF2
		ON IF1.F931084159 = IF2.F_2105900422
	JOIN
		[777].[input_form3] AS IF3
		ON IF1.F931084159 = IF3.F931084159
	JOIN
		[777].[input_form4] AS IF4
		ON IF1.F931084159 = IF4.F931084159
	WHERE 
		[IF1].[date_for] = @date_for
	AND
		[IF2].[date_for] = @date_for
	AND
		[IF3].[date_for] = @date_for
	AND
		[IF4].[date_for] = @date_for
	AND
		[IF1].F931084159 = '53' ) AS A
JOIN
	(
		SELECT  
		CAST( ROW_NUMBER() OVER ( ORDER BY [date_for]) AS INT) AS [П.н.]
		, [date_for]
     , SUM(CAST([F_509940737] AS INT)) AS problems
  FROM [16_enerho].[input_form2] AS M
  WHERE date_for = '2022-09-01'
  AND 
	([company_name] = 'Північне територіальне управління обслуговування мережі' 
	OR 
		[company_name] = 'Південне територіальне управління обслуговування мережі')
  AND
	[F_1517024731] <> 'ВСЬОГО:'
	GROUP BY [date_for]
	) AS B
	ON A.[П.н.] = B.[П.н.]