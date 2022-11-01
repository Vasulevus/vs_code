USE [db_archive];

DECLARE @date_for NVARCHAR(MAX)
SET @date_for = '20220901'

SELECT
    ROW_NUMBER() OVER(ORDER BY [П.н.]) AS [П.н.]
	,'Україна всього' AS [Назва файлу]
	,'I15' AS [Адреса клітинки / функція]
	,[Україна (всього)] AS [Значення в клітинці]
	,'<=' AS [Умова перевірки/ отримання значення]
	,'1,00' AS [Значення для перевірки]
	
FROM
(
    SELECT
        [IF1].[F931084159] AS [П.н.]
        ,[IF1].[F_58852227] AS [Показник]
        ,[IF1].[F_360781186] AS [ВОУ Пн ТУОМ]
        ,[IF2].[F1920758396]AS [ВСП Пн ТУОМ] 
        ,[IF3].[F_360781186] AS [ВОУ Пд ТУОМ]
        ,[IF4].F_360781186 AS [ВСП Пд ТУОМ]
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
        [IF1].F931084159 = '9') AS A
WHERE [Україна (всього)] > 1;