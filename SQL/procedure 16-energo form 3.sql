USE [db_archive]
GO

/****** Object:  StoredProcedure [16_еnеrho].[output_form3]    Script Date: 17.10.2022 16:57:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER PROCEDURE [16_еnеrho].[output_form3]
    @yearQ NCHAR(4),
    @monthQ NVARCHAR(2)


AS




SET NOCOUNT ON
BEGIN
DECLARE @SQL nvarchar(max)
IF OBJECT_ID('[db_depositarium].[16_еnеrho].[output_form3_' + @yearQ +'_' + @monthQ + ']') IS NULL

      BEGIN
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
            FROM [db_archive].[16_еnеrho].[input_form3];

            UPDATE #input_3_form
            SET [F1268613809] = '0' WHERE [F1268613809] = '-';
            
            UPDATE #input_3_form
            SET [F_1515326174] = '0' WHERE [F_1515326174]  = '-';
            
            UPDATE #input_3_form
            SET [F_388169605] = '0' WHERE [F_388169605]  = '-';
            
            UPDATE #input_3_form   
            SET [F_398454515] = '0' WHERE [F_398454515]  = '-';  
            
            UPDATE #input_3_form
            SET [F_1948051532] = '0' WHERE [F_1948051532]   = '-';
            
            UPDATE #input_3_form 
            SET [F_591333549] = '0' WHERE [F_591333549]  = '-';
            
            UPDATE #input_3_form   
            SET [F608712032] = '0' WHERE [F608712032]  = '-';

            UPDATE #input_3_form
            SET [F1268613809] = '0' WHERE [F1268613809] = 'уточнюється';
            
            UPDATE #input_3_form
            SET [F_1515326174] = '0' WHERE [F_1515326174]  = 'уточнюється';
            
            UPDATE #input_3_form
            SET [F_388169605] = '0' WHERE [F_388169605]  = 'уточнюється';
            
            UPDATE #input_3_form   
            SET [F_398454515] = '0' WHERE [F_398454515]  = 'уточнюється';  
            
            UPDATE #input_3_form
            SET [F_1948051532] = '0' WHERE [F_1948051532]   = 'уточнюється';
            
            UPDATE #input_3_form 
            SET [F_591333549] = '0' WHERE [F_591333549]  = 'уточнюється';
            
            UPDATE #input_3_form   
            SET [F608712032] = '0' WHERE [F608712032]  = 'уточнюється';
            
            UPDATE #input_3_form
            SET [F_1948051532] = '2' WHERE [F_1948051532]   = '2 (решта визначити не можливо)';
            
            UPDATE #input_3_form
            SET [F_591333549] = '6.36' WHERE [F_591333549]   = '6,36 (решта визначити не можливо)';
            
            DROP TABLE IF EXISTS #M;
            
            SELECT 
                  [company_name]
                  ,SUM(CAST([F_957837583] AS INT)) AS [Відмови І категорії всього]
                  ,0 AS [Відмови І категорії всього нак]
                  ,SUM(CAST([F_1515326174]AS INT)) AS [Відмови І категорії з вини персоналу]
                  , 0 AS [Відмови І категорії з вини персоналу нак]
                  ,SUM(CAST([F_388169605]AS FLOAT)) AS [Відмови І категорії Недовідпуск тис.кВг год] 
                  , 0 AS [Відмови І категорії Недовідпуск тис.кВг год нак] 

                  ,SUM(CAST([F_95506163]AS INT)) AS [Відмови ІI категорії всього]
                  ,0 AS [Відмови ІI категорії всього нак]
                  ,SUM(CAST([F_1948051532]AS INT)) AS [Відмови ІІ категорії з вини персоналу]
                  ,0  AS [Відмови ІІ категорії з вини персоналу нак]
                  ,SUM(CAST(TRIM([F_591333549])AS FLOAT)) AS [Відмови ІI категорії Недовідпуск тис.кВг год]
                  , 0  AS [Відмови ІI категорії Недовідпуск тис.кВг год нак]
            INTO #M
            FROM 
                  #input_3_form AS M
            WHERE       [date_for] = @yearQ + '-' + @monthQ + '-01' --місяць
            GROUP BY 
                  [company_name];



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
            WHERE [date_for] >= @yearQ + '-01-01' AND [date_for] <= @yearQ + '-' + @monthQ + '-01'
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
				  ,ROW_NUMBER() OVER(ORDER BY [company_name]) AS Number_Of_Row
            INTO #P
            FROM #B
            GROUP BY [company_name];

            DROP TABLE IF EXISTS #F;

            

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
				  , 5 AS Number_Of_Row
            INTO #F
            FROM #B;


      EXEC('      SELECT *
            INTO [db_depositarium].[16_еnеrho].[output_form3_' + @yearQ +'_' + @monthQ + '] 
            FROM(

            SELECT * FROM #P
            UNION ALL
            SELECT * FROM #F

            ) AS Z ');


            SET @SQL=' SELECT * FROM [db_depositarium].[16_еnеrho].[output_form3_' + @yearQ +'_' + @monthQ + ']'
            EXECUTE sp_executesql  @SQL
      END;
	              SET @SQL=' SELECT * FROM [db_depositarium].[16_еnеrho].[output_form3_' + @yearQ +'_' + @monthQ + ']'
            EXECUTE sp_executesql  @SQL
END
GO


