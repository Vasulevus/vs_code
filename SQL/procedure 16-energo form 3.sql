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

SELECT * FROM #input_3_form 




/****** Script for SelectTopNRows command from SSMS  
SELECT 
		[company_name]
      ,SUM(CAST([F_957837583] AS INT)) AS [Відмови І категорії всього]
      ,SUM(CAST([F_1515326174]AS INT)) AS [Відмови І категорії з вини персоналу]
      ,SUM(CAST([F_388169605]AS FLOAT)) AS [Відмови І категорії Недовідпуск тис.кВг год] 
      ,SUM(CAST([F_398454515] AS FLOAT)) AS [Відмови І категорії Гкал]
      ,SUM(CAST([F_95506163]AS INT)) AS [Відмови ІI категорії всього]
      ,SUM(CAST([F_1948051532]AS INT)) AS [Відмови ІІ категорії з вини персоналу]
--      ,SUM([F_591333549])
 --     ,SUM([F608712032])
  FROM [db_archive].[m16_energo].[input_form3] WHERE date_for = '20220801'
  GROUP BY [company_name]


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