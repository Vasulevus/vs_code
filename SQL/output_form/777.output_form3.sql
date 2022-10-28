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
             [F931084159] AS [П.н.]
            ,[F_58852227] AS [Показник]
            ,[F_360781186] AS [ВОУ Пн ТУОМ]
            , NULL AS [ВСП Пн ТУОМ]
            , NULL AS [ВОУ Пд ТУОМ]
            , NULL AS [ВСП Пд ТУОМ]
        FROM [777].[input_form1]
        UNION ALL
        SELECT
             [F_2105900422] AS [П.н.]
            ,[F2105179514] AS [Показник]
            ,NULL AS [ВОУ Пн ТУОМ]
            , [F1920758396]AS [ВСП Пн ТУОМ]
            , NULL AS [ВОУ Пд ТУОМ]
            , NULL AS [ВСП Пд ТУОМ]
        FROM [777].[input_form2]
        UNION ALL
        SELECT
             [F931084159] AS [П.н.]
            ,[F_58852227] AS [Показник]
            ,NULL AS [ВОУ Пн ТУОМ]
            , NULL AS [ВСП Пн ТУОМ]
            ,[F_360781186] AS [ВОУ Пд ТУОМ]
            , NULL AS [ВСП Пд ТУОМ]
        FROM [777].[input_form3] 
        UNION ALL
        SELECT
             [F931084159] AS [П.н.]
            ,[F_58852227] AS [Показник]
            ,NULL AS [ВОУ Пн ТУОМ]
            , NULL AS [ВСП Пн ТУОМ]
            ,NULL AS [ВОУ Пд ТУОМ]
            ,[F_360781186] AS [ВСП Пд ТУОМ]
        FROM [777].[input_form4] 
    END
END