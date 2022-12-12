DECLARE @SQL nvarchar(max),
@date_for nvarchar(max) = '20221131',
@date_for_cut nchar(6)

			DROP TABLE IF EXISTS #Calenda
			SELECT 
				[Dates]
			,[YM]
			,RIGHT([Dates],2) AS [Day]
			, MAX(RIGHT([Dates],2)) OVER (PARTITION BY [YM]) AS MAXDate
			INTO #Calenda
			FROM
			(SELECT 
				convert(nvarchar(MAX), cast(date_for as date) , 112) AS Dates,
				LEFT(convert(nvarchar(MAX), cast(date_for as date) , 112),6) AS [YM]

			FROM
				[db_archive].[16_enerho].[input_form3]) AS DateA

			SELECT * FROM #Calenda
				
--			SET @date_for_cut = LEFT(@date_For,6);

--			EXEC(@date_for_cut);

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
            FROM [db_archive].[16_enerho].[input_form3];

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
            WHERE       
				LEFT(convert(nvarchar(MAX), cast(date_for as date) , 112),6) <=  LEFT(@date_for,6)
				AND
				LEFT(convert(nvarchar(MAX), cast(date_for as date) , 112),4) = YEAR(GETDATE())--місяць
            GROUP BY 
                  [company_name];
--		SELECT * FROM #M;
		

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
           WHERE       
				LEFT(convert(nvarchar(MAX), cast(date_for as date) , 112),6) <=  LEFT(@date_for,6)
				AND
				LEFT(convert(nvarchar(MAX), cast(date_for as date) , 112),4) = YEAR(GETDATE())--місяць
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
            INTO #F
            FROM #B;

			DROP TABLE IF EXISTS #Q;

			SELECT *
			INTO #Q
			FROM
            (SELECT * 
            FROM #P
            UNION ALL
            SELECT *
            FROM #F) AS GRIM;

			SELECT 
				[company_name]
				,[I всього] AS [F_1483422437]
				,[I всього нак] AS [F1493600066]
				,[I вина персоналу] AS [F_1900265575]
				,[I вина персоналу нак] AS [F_59656269]
				,[I недовідпуск] AS [F_900885895]
				,[I недовідпуск нак] AS [F522876730]
				,[II всього] AS [F_789359902]
				,[II всього нак] AS [F1655390479]
				,[II вина персоналу] AS [F1652551633]
				,[II вина персоналу нак] AS [F_1662192221]
				,[II недовідпуск] AS [F1250546635]
				,[II недовідпуск нак] AS [F_1273454092]
				,ROW_NUMBER() OVER (ORDER BY company_name DESC) AS [F_1060990867]
			INTO #Z
			FROM #Q;

      EXEC('      SELECT *
            INTO [db_depositarium].[16_enerho].[687815595_output_form_' + @date_for + '] 
            FROM #Z WHERE [F_1483422437] IS NOT NULL
			AND [F_789359902] IS NOT NULL');


            SET @SQL=' SELECT * FROM [db_depositarium].[16_enerho].[687815595_output_form_' + @date_for + ']'
            EXECUTE sp_executesql  @SQL
      END;
	              SET @SQL=' SELECT * FROM [db_depositarium].[16_enerho].[687815595_output_form_' + @date_for + ']'
            EXECUTE sp_executesql  @SQL
END
