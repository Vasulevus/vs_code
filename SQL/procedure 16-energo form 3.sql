USE db_archive;

GO
DROP TABLE IF EXISTS  #input_3_form;

SELECT [date_for]
      ,[company_name]
      ,[file_name]
      ,[F1268613809]
      ,[F_957837583]
      ,[F_1515326174]
      ,[F_388169605]
      ,[F_398454515]
      ,[F_95506163]
      ,[F_1948051532]
      ,[F_591333549]
      ,[F608712032]
INTO #input_3_form
  FROM [db_archive].[m16_energo].[input_form3];
GO

UPDATE #input_3_form
SET [F1268613809] = '0' WHERE [F1268613809] = '-';
GO 
UPDATE #input_3_form
SET [F_957837583] = '0' WHERE [F_957837583]  = '-';
GO 
UPDATE #input_3_form
SET [F_1515326174] = '0' WHERE [F_1515326174]  = '-';
GO 
UPDATE #input_3_form
SET [F_388169605] = '0' WHERE [F_388169605]  = '-';
GO 
UPDATE #input_3_form   
SET [F_398454515] = '0' WHERE [F_398454515]  = '-';  
GO 
UPDATE #input_3_form 
SET [F_95506163] = '0' WHERE [F_95506163]  = '-';
GO 
UPDATE #input_3_form
SET [F_1948051532] = '0' WHERE [F_1948051532]   = '-';
GO 
UPDATE #input_3_form 
SET [F_591333549] = '0' WHERE [F_591333549]  = '-';
GO 
UPDATE #input_3_form   
SET [F608712032] = '0' WHERE [F608712032]  = '-';


UPDATE #input_3_form
SET [F1268613809] = '0' WHERE [F1268613809] = 'уточнюється';
GO 
UPDATE #input_3_form
SET [F_957837583] = '0' WHERE [F_957837583]  = 'уточнюється';
GO 
UPDATE #input_3_form
SET [F_1515326174] = '0' WHERE [F_1515326174]  = 'уточнюється';
GO 
UPDATE #input_3_form
SET [F_388169605] = '0' WHERE [F_388169605]  = 'уточнюється';
GO 
UPDATE #input_3_form   
SET [F_398454515] = '0' WHERE [F_398454515]  = 'уточнюється';  
GO 
UPDATE #input_3_form 
SET [F_95506163] = '0' WHERE [F_95506163]  = 'уточнюється';
GO 
UPDATE #input_3_form
SET [F_1948051532] = '0' WHERE [F_1948051532]   = 'уточнюється';
GO 
UPDATE #input_3_form 
SET [F_591333549] = '0' WHERE [F_591333549]  = 'уточнюється';
GO 
UPDATE #input_3_form   
SET [F608712032] = '0' WHERE [F608712032]  = 'уточнюється';
GO
UPDATE #input_3_form
SET [F_1948051532] = '2' WHERE [F_1948051532]   = '2 (решта визначити не можливо)';
GO
UPDATE #input_3_form
SET [F_591333549] = '6.36' WHERE [F_591333549]   = '6,36 (решта визначити не можливо)';
--GO
--SELECT * FROM #input_3_form;
GO 
DROP TABLE IF EXISTS #M;
GO
SELECT 
	[company_name]
      ,SUM(CAST([F_957837583] AS INT)) AS [Відмови І категорії всього]
      ,0 AS [Відмови І категорії всього нак]
      ,SUM(CAST([F_1515326174]AS INT)) AS [Відмови І категорії з вини персоналу]
      , 0 AS [Відмови І категорії з вини персоналу нак]
      ,SUM(CAST([F_388169605]AS FLOAT)) AS [Відмови І категорії Недовідпуск тис.кВг год] 
      , 0 AS [Відмови І категорії Недовідпуск тис.кВг год нак] 
 --     ,SUM(CAST([F_398454515] AS FLOAT)) AS [Відмови І категорії Гкал]
      ,SUM(CAST([F_95506163]AS INT)) AS [Відмови ІI категорії всього]
      ,0 AS [Відмови ІI категорії всього нак]
      ,SUM(CAST([F_1948051532]AS INT)) AS [Відмови ІІ категорії з вини персоналу]
      ,0  AS [Відмови ІІ категорії з вини персоналу нак]
      ,SUM(CAST(TRIM([F_591333549])AS FLOAT)) AS [Відмови ІI категорії Недовідпуск тис.кВг год]
      , 0  AS [Відмови ІI категорії Недовідпуск тис.кВг год нак]
 --     ,SUM(CAST([F608712032]AS FLOAT)) AS [Відмови ІI категорії Гкал]
INTO #M
FROM 
      #input_3_form AS M
--WHERE       [date_for] = '20220801'
GROUP BY 
      [company_name];

--SELECT * FROM #M

DROP TABLE IF EXISTS #G;

SELECT 
		[company_name]
      , 0 AS [Відмови І категорії всього]
      ,SUM(CAST([F_957837583] AS INT)) AS [Відмови І категорії всього нак]
      , 0  AS [Відмови І категорії з вини персоналу]
      ,SUM(CAST([F_1515326174]AS INT)) AS [Відмови І категорії з вини персоналу нак]
      , 0  AS [Відмови І категорії Недовідпуск тис.кВг год] 
      ,SUM(CAST([F_388169605]AS FLOAT)) AS [Відмови І категорії Недовідпуск тис.кВг год нак] 
--      ,SUM(CAST([F_398454515] AS FLOAT)) AS [Відмови І категорії Гкал]
      , 0  AS [Відмови ІI категорії всього]
      ,SUM(CAST([F_95506163]AS INT)) AS [Відмови ІI категорії всього нак]
      , 0  AS [Відмови ІІ категорії з вини персоналу]
      ,SUM(CAST([F_1948051532]AS INT)) AS [Відмови ІІ категорії з вини персоналу нак]
      , 0  AS [Відмови ІI категорії Недовідпуск тис.кВг год] 
      ,SUM(CAST(TRIM([F_591333549])AS FLOAT)) AS [Відмови ІI категорії Недовідпуск тис.кВг год нак] 
--      ,SUM(CAST([F608712032]AS FLOAT)) AS [Відмови ІI категорії Гкал]
INTO #G
FROM 
      #input_3_form AS G
--WHERE [date_for] >= '20220101'
GROUP BY 
      [company_name];



DROP TABLE #input_3_form;
DROP TABLE IF EXISTS #B;

SELECT *
INTO #B
FROM
(

SELECT * FROM #M 
UNION ALL
SELECT * FROM #G
) AS B;

--SELECT * FROM #B;

DROP TABLE IF EXISTS #M;
DROP TABLE IF EXISTS #G;

DROP TABLE IF EXISTS #P;
GO
DROP TABLE IF EXISTS #F;

SELECT 
      [company_name]
      ,SUM([Відмови І категорії всього]) AS [I всього]
      ,SUM([Відмови І категорії всього нак]) AS [I всього нак]
      ,SUM([Відмови І категорії з вини персоналу]) AS [I вина персоналу]
      ,SUM([Відмови І категорії з вини персоналу нак]) AS [I вина персоналу нак]
      ,SUM([Відмови І категорії Недовідпуск тис.кВг год]) AS [I недовідпуск]
      ,SUM([Відмови І категорії Недовідпуск тис.кВг год нак])  AS [I недовідпуск нак]
      ,SUM([Відмови ІI категорії всього]) AS [II всього]
      ,SUM([Відмови ІI категорії всього нак]) AS [II всього нак]
      ,SUM([Відмови ІІ категорії з вини персоналу]) AS [II вина персоналу]
      ,SUM([Відмови ІІ категорії з вини персоналу нак]) AS [II вина персоналу нак]
      ,SUM([Відмови ІI категорії Недовідпуск тис.кВг год]) AS [II недовідпуск]
      ,SUM([Відмови ІI категорії Недовідпуск тис.кВг год нак])  AS [II недовідпуск нак]
INTO #P
FROM #B
GROUP BY [company_name];

DROP TABLE IF EXISTS #F;

GO

SELECT 
      'Всього по НЕК' AS [company_name]
      ,SUM([Відмови І категорії всього]) AS [I всього]
      ,SUM([Відмови І категорії всього нак]) AS [I всього нак]
      ,SUM([Відмови І категорії з вини персоналу]) AS [I вина персоналу]
      ,SUM([Відмови І категорії з вини персоналу нак]) AS [I вина персоналу нак]
      ,SUM([Відмови І категорії Недовідпуск тис.кВг год]) AS [I недовідпуск]
      ,SUM([Відмови І категорії Недовідпуск тис.кВг год нак])  AS [I недовідпуск нак]
      ,SUM([Відмови ІI категорії всього]) AS [II всього]
      ,SUM([Відмови ІI категорії всього нак]) AS [II всього нак]
      ,SUM([Відмови ІІ категорії з вини персоналу]) AS [II вина персоналу]
      ,SUM([Відмови ІІ категорії з вини персоналу нак]) AS [II вина персоналу нак]
      ,SUM([Відмови ІI категорії Недовідпуск тис.кВг год]) AS [II недовідпуск]
      ,SUM([Відмови ІI категорії Недовідпуск тис.кВг год нак])  AS [II недовідпуск нак]
INTO #F
FROM #B;

GO

DROP TABLE IF EXISTS #Z;

SELECT *
INTO #Z
FROM(

SELECT * FROM #P
UNION ALL
SELECT * FROM #F

) AS Z;

SELECT * FROM #Z;


/**
--просто запит
SELECT TOP (1000) [date_for]
      ,[company_name]
      ,[file_name]
      ,[F1268613809] -- назва підприємства
      ,[F_957837583] -- Відмови І категорії всього
      ,[F_1515326174] -- Відмови І категорії з вини персоналу
      ,[F_388169605] -- Відмови І категорії Недовідпуск тис.кВг год
      ,[F_398454515] -- Відмови І категорії Гкал
      ,[F_95506163] -- Відмови ІІ категорії всього
      ,[F_1948051532]  --  Відмови ІІ категорії з вини персоналу
      ,[F_591333549] --  Відмови ІІ категорії Недовідпуск тис.кВг год
      ,[F608712032] -- Відмови ІІ категорії Гкал
  FROM [db_archive].[m16_energo].[input_form3] WHERE date_for = '20220801'******/
  