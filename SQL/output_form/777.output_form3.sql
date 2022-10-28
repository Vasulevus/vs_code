USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[output_form3]    Script Date: 28.10.2022 11:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [777].[479556726_output_form]
(
@date_for nvarchar(max)--створюємо змінну
)
AS
BEGIN

    IF OBJECT_ID('[db_depositarium].[777].[output_form3_' + @date_for + ']') IS NULL --перевіряємо, чи відсутній об'єкт

    BEGIN
        USE [db_archive] -- для тестування, закоментувати на прод
 	   SELECT
	[П.н.]
	,[Показник]
	,[ВОУ Пд ТУОМ]
	,[ВСП Пд ТУОМ]
	,CASE WHEN [П.н.] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN 
	TRY_CAST([ВОУ Пд ТУОМ] AS decimal(15,3)) + TRY_CAST([ВСП Пд ТУОМ] AS decimal(15,3))
	ELSE NULL END AS [Південний ТУОМ (всього)]
	FROM  
     (   SELECT
            [IF1].[F931084159] AS [П.н.]
            ,[IF1].[F_58852227] AS [Показник]
            ,[IF1].[F_360781186] AS [ВОУ Пн ТУОМ]
         --   ,[IF2].[F1920758396]AS [ВСП Пн ТУОМ] 
            ,[IF3].[F_360781186] AS [ВОУ Пд ТУОМ]
            ,[IF4].F_360781186 AS [ВСП Пд ТУОМ]
        FROM [777].[input_form1] AS IF1
 --       JOIN
--		[777].[input_form2] AS IF2
	--	ON IF1.F931084159 = IF2.F2105179514
		JOIN
		[777].[input_form3] AS IF3
		ON IF1.F931084159 = IF3.F931084159
		JOIN
		[777].[input_form4] AS IF4
		ON IF1.F931084159 = IF4.F931084159
		) AS A

    END
END