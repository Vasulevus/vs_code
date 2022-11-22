USE [db_archive];

DECLARE @date_for NVARCHAR(MAX)
SET @date_for = '20220901'


/*
SELECT
 	B.[П.н.]
	,'479556726_output_form' AS [FileName]
	,'I59' AS [CellName]
	,B.[Ukraine] AS [Value1]
	,'=' AS [Condition]
	,problems
	, 'F20' AS [CellName2]
	, '16 енерго' AS [Template]
	,'input_form2' AS [FileName2]
*/
SELECT *
INTO #TempTable3
FROM 
	(
		
	SELECT
		[П.н.]
		,ISNULL([Україна (всього)], 0) AS [Ukraine]

	FROM
		(
			SELECT
				ROW_NUMBER() OVER ( ORDER BY (CAST([IF1].[F931084159] AS INT))) AS [П.н.]
				,
					CAST([IF3].[F_360781186] AS decimal(15,2)) + CAST([IF4].F_360781186 AS decimal(15,2)) +
					CAST([IF1].[F_360781186] AS decimal(15,2)) + CAST([IF2].[F1920758396] AS decimal(15,2))
					AS [Україна (всього)]
			FROM 
				[db_archive].[777].[input_form1] AS IF1
			JOIN
				[db_archive].[777].[input_form2] AS IF2
				ON IF1.F931084159 = IF2.F_2105900422
			JOIN
				[db_archive].[777].[input_form3] AS IF3
				ON IF1.F931084159 = IF3.F931084159
			JOIN
				[db_archive].[777].[input_form4] AS IF4
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
		) AS B
JOIN
	(
		SELECT  
		CAST( ROW_NUMBER() OVER ( ORDER BY [date_for]) AS INT) AS [П.н.]
		, [date_for]
     , SUM(CAST([F_509940737] AS INT)) AS problems
  FROM [db_archive].[16_enerho].[input_form2] AS M
  WHERE date_for = '2022-09-01'
  AND 
	([company_name] = 'Північне територіальне управління обслуговування мережі' 
	OR 
		[company_name] = 'Південне територіальне управління обслуговування мережі')
  AND
	[F_1517024731] <> 'ВСЬОГО:'
	GROUP BY [date_for]
	) AS N
	ON B.[П.н.] = N.[П.н.]
	WHERE B.[Україна (всього)] <> problems




USE [db_archive];

DECLARE @date_for NVARCHAR(MAX)
SET @date_for = '20220901'

DROP TABLE IF EXISTS #TempTable1_For_Basic_Check;

SELECT 
	*
INTO 
	#TempTable1_For_Basic_Check
FROM
(         SELECT
            CAST([IF1].[F931084159] AS INT) AS [npp]
			,[IF1].[date_for]
            ,[IF1].[F_58852227] AS [indicators]
            ,[IF1].[F_360781186] AS [VOU]
            ,[IF2].[F1920758396] AS [VSP]
			,CAST([IF1].[F_360781186] AS DECIMAL(15,2)) + CAST([IF2].[F1920758396] AS DECIMAL(15,2)) AS [SUM_TUOM]
			, 'Північне територіальне управління обслуговування мережі' AS TUOM
			, '254414212_output_form' AS [FileName]
        FROM 
            [db_archive].[777].[input_form1] AS IF1
        JOIN
            [db_archive].[777].[input_form2] AS IF2
            ON IF1.F931084159 = IF2.F_2105900422
        WHERE 
			[IF1].[date_for] = @date_for
		AND
			[IF2].[date_for] = @date_for
        AND 
			[IF1].[F931084159] = '53'

	UNION ALL
         SELECT
            CAST([IF3].[F931084159] AS INT) AS [npp]
			,[IF3].[date_for]
			,[IF3].[F_58852227] AS [indicators]
            ,[IF3].[F_360781186] AS [VOU]
            ,[IF4].F_360781186 AS [VSP]
			,CAST([IF3].[F_360781186] AS DECIMAL(15,2)) + CAST([IF4].[F_360781186] AS DECIMAL(15,2)) AS [SUM_TUOM]
			, 'Південне територіальне управління обслуговування мережі' AS TUOM
			, '1232856512_output_form' AS [FileName]
        FROM 
            [db_archive].[777].[input_form3] AS IF3
        JOIN
            [db_archive].[777].[input_form4] AS IF4
            ON IF3.F931084159 = IF4.F931084159
        WHERE 
			[IF3].[date_for] = @date_for
		AND
			[IF4].[date_for] = @date_for
        AND [IF3].[F931084159] = '53'
		) AS A
		


DROP TABLE IF EXISTS #TempTable2_For_Diff_Tuoms;

SELECT 
	[date_for]
	,[company_name] AS TUOMS
	,SUM(CAST([F_509940737] AS INT)) AS problems
INTO #TempTable2_For_Diff_Tuoms
FROM [db_archive].[16_enerho].input_form2 WHERE date_for = @date_for
 AND 
	([company_name] = 'Північне територіальне управління обслуговування мережі' 
	OR 
		[company_name] = 'Південне територіальне управління обслуговування мережі')
		  AND
	[F_1517024731] <> 'ВСЬОГО:'
GROUP BY
	date_for, company_name;

--SELECT * FROM #TempTable1_For_Basic_Check;

--SELECT * FROM #TempTable2_For_Diff_Tuoms;

SELECT
	[FileName]
	,TUOM
	,ISNULL(SUM_TUOM, 0) AS SUM_TUOM
	,[TUOMS] AS TUOMS_F_TEST
	,problems
FROM 
	#TempTable1_For_Basic_Check AS TT1
JOIN
	#TempTable2_For_Diff_Tuoms AS TT2
	ON
	TT1.TUOM = TT2.TUOMS
WHERE
	TT1.date_for = TT2.date_for
AND	ISNULL(SUM_TUOM, 0) <> problems



---збираємо все докупи

USE [db_archive];

DECLARE @date_for NVARCHAR(MAX)
SET @date_for = '20220901'

DROP TABLE IF EXISTS #TempTable3;

SELECT  
	Ukraine
	,date_for
	,problems
INTO #TempTable3
FROM 
	(
		
	SELECT
		[П.н.]
		,ISNULL([Ukraine], 0) AS [Ukraine]

	FROM
		(
			SELECT
				ROW_NUMBER() OVER ( ORDER BY (CAST([IF1].[F931084159] AS INT))) AS [П.н.]
				,
					CAST([IF3].[F_360781186] AS decimal(15,2)) + CAST([IF4].F_360781186 AS decimal(15,2)) +
					CAST([IF1].[F_360781186] AS decimal(15,2)) + CAST([IF2].[F1920758396] AS decimal(15,2))
					AS [Ukraine]
			FROM 
				[db_archive].[777].[input_form1] AS IF1
			JOIN
				[db_archive].[777].[input_form2] AS IF2
				ON IF1.F931084159 = IF2.F_2105900422
			JOIN
				[db_archive].[777].[input_form3] AS IF3
				ON IF1.F931084159 = IF3.F931084159
			JOIN
				[db_archive].[777].[input_form4] AS IF4
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
		) AS B
JOIN
	(
		SELECT  
		CAST( ROW_NUMBER() OVER ( ORDER BY [date_for]) AS INT) AS [П.н.]
		, [date_for]
     , SUM(CAST([F_509940737] AS INT)) AS problems
  FROM [db_archive].[16_enerho].[input_form2] AS M
  WHERE date_for = @date_for
  AND 
	([company_name] = 'Північне територіальне управління обслуговування мережі' 
	OR 
		[company_name] = 'Південне територіальне управління обслуговування мережі')
  AND
	[F_1517024731] <> 'ВСЬОГО:'
	GROUP BY [date_for]
	) AS N
	ON B.[П.н.] = N.[П.н.]
	WHERE B.[Ukraine] <> problems;





DROP TABLE IF EXISTS #TempTable1_For_Basic_Check;

SELECT 
	*
INTO 
	#TempTable1_For_Basic_Check
FROM
(         SELECT
            CAST([IF1].[F931084159] AS INT) AS [npp]
			,[IF1].[date_for]
            ,[IF1].[F_58852227] AS [indicators]
            ,[IF1].[F_360781186] AS [VOU]
            ,[IF2].[F1920758396] AS [VSP]
			,CAST([IF1].[F_360781186] AS DECIMAL(15,2)) + CAST([IF2].[F1920758396] AS DECIMAL(15,2)) AS [SUM_TUOM]
			, 'Північне територіальне управління обслуговування мережі' AS TUOM
			, '254414212_output_form' AS [FileName]
        FROM 
            [db_archive].[777].[input_form1] AS IF1
        JOIN
            [db_archive].[777].[input_form2] AS IF2
            ON IF1.F931084159 = IF2.F_2105900422
        WHERE 
			[IF1].[date_for] = @date_for
		AND
			[IF2].[date_for] = @date_for
        AND 
			[IF1].[F931084159] = '53'

	UNION ALL
         SELECT
            CAST([IF3].[F931084159] AS INT) AS [npp]
			,[IF3].[date_for]
			,[IF3].[F_58852227] AS [indicators]
            ,[IF3].[F_360781186] AS [VOU]
            ,[IF4].F_360781186 AS [VSP]
			,CAST([IF3].[F_360781186] AS DECIMAL(15,2)) + CAST([IF4].[F_360781186] AS DECIMAL(15,2)) AS [SUM_TUOM]
			, 'Південне територіальне управління обслуговування мережі' AS TUOM
			, '1232856512_output_form' AS [FileName]
        FROM 
            [db_archive].[777].[input_form3] AS IF3
        JOIN
            [db_archive].[777].[input_form4] AS IF4
            ON IF3.F931084159 = IF4.F931084159
        WHERE 
			[IF3].[date_for] = @date_for
		AND
			[IF4].[date_for] = @date_for
        AND [IF3].[F931084159] = '53'
		) AS A
		


DROP TABLE IF EXISTS #TempTable2_For_Diff_Tuoms;

SELECT 
	[date_for]
	,[company_name] AS TUOMS
	,SUM(CAST([F_509940737] AS INT)) AS problems
INTO #TempTable2_For_Diff_Tuoms
FROM [db_archive].[16_enerho].input_form2 WHERE date_for = @date_for
 AND 
	([company_name] = 'Північне територіальне управління обслуговування мережі' 
	OR 
		[company_name] = 'Південне територіальне управління обслуговування мережі')
		  AND
	[F_1517024731] <> 'ВСЬОГО:'
GROUP BY
	date_for, company_name;

--SELECT * FROM #TempTable1_For_Basic_Check;

--SELECT * FROM #TempTable2_For_Diff_Tuoms;

DROP TABLE IF EXISTS #TempTable4_For_Tuoms_Res;

SELECT
	[FileName]
	,TUOM
	,ISNULL(SUM_TUOM, 0) AS SUM_TUOM
	,[TUOMS] AS TUOMS_F_TEST
	,problems
INTO
	#TempTable4_For_Tuoms_Res
FROM 
	#TempTable1_For_Basic_Check AS TT1
JOIN
	#TempTable2_For_Diff_Tuoms AS TT2
	ON
	TT1.TUOM = TT2.TUOMS
WHERE
	TT1.date_for = TT2.date_for
AND	ISNULL(SUM_TUOM, 0) <> problems;


SELECT 
	ROW_NUMBER() OVER(ORDER BY [FileName]) AS npp
	,[FileName]
	,[CellName]
	,[Value1]
	,[Condition]
	,[problems]
	,[CellName2]
	,[Template]
	,[FileName2]
FROM
(
SELECT
	'479556726_output_form' AS [FileName]
	,'I59' AS [CellName]
	,[Ukraine] AS [Value1]
	,'=' AS [Condition]
	,problems
	, 'F20' AS [CellName2]
	, '16 енерго' AS [Template]
	,'input_form2' AS [FileName2]
FROM
	#TempTable3

UNION ALL
SELECT	
	[FileName]
	,'E59' AS [CellName]
	,[SUM_TUOM] AS [Value1]
	, '=' AS [Condition]
	,[problems]
	,'F20' AS [CellName2]
	,'16 енерго' AS Template
	,'input_form2' AS [FileName2]
FROM
	#TempTable4_For_Tuoms_Res
	) AS Y
WHERE Value1 <> problems
