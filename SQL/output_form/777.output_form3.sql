USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[output_form3]    Script Date: 28.10.2022 11:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [777].[479556726_output_form_flat]
(
@date_for nvarchar(max)--створюємо змінну
)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    --SET @date_for = '2022-11-01' --лише для тестування, пізніше закоментити або видалити

    IF OBJECT_ID('[db_depositarium].[777].[output_form3_' + @date_for + ']') IS NULL --перевіряємо, чи відсутній об'єкт

    BEGIN

        DROP TABLE IF EXISTS #TempTable1_For_Additional_Calc;

        SELECT
            [IF1].[F931084159] AS [npp]
            ,[IF1].[F_58852227] AS [indicators]
            ,[IF1].[F_360781186] AS [VOU_PN_ТUOM]
            ,[IF2].[F1920758396]AS [VSP_PN_TUOM] 
            ,[IF3].[F_360781186] AS [VOU_PD_ТUOM]
            ,[IF4].F_360781186 AS [VSP_PD_TUOM]
        INTO
            #TempTable1_For_Additional_Calc --створюємо базову тимчасову таблицю для групування всіх вхідних форм
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
			[IF4].[date_for] = @date_for;
        --SELECT * FROM #TempTable1_For_Additional_Calc
        DROP TABLE IF EXISTS #TempTable2_With_All_Calc;

	    SELECT
            [npp]
            ,[indicators]
            ,[VOU_PN_ТUOM]
            ,[VSP_PN_TUOM]
            ,CASE WHEN [npp] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN 
                TRY_CAST([VOU_PN_ТUOM] AS decimal(15,3)) + TRY_CAST([VSP_PN_TUOM] AS decimal(15,3))
                ELSE NULL END AS [Північний ТУОМ (всього)] --сума по Північному ТУОМУ лише по потрібних пунктах
            ,[VOU_PD_ТUOM]
            ,[VSP_PD_TUOM]
            ,CASE WHEN [npp] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN 
                TRY_CAST([VOU_PD_ТUOM] AS decimal(15,3)) + TRY_CAST([VSP_PD_TUOM] AS decimal(15,3))
                ELSE NULL END AS [Південний ТУОМ (всього)] --сума по Південному ТУОМУ лише по потрібних пунктах
            ,CASE WHEN [npp] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN 
				TRY_CAST([VOU_PD_ТUOM] AS decimal(15,3)) + TRY_CAST([VSP_PD_TUOM] AS decimal(15,3)) +
				TRY_CAST([VOU_PN_ТUOM] AS decimal(15,3)) + TRY_CAST([VSP_PN_TUOM] AS decimal(15,3))
				ELSE NULL END AS [Україна (всього)] --сума по Україні лише по потрібних пунктах
        INTO
            #TempTable2_With_All_Calc
        FROM  
        #TempTable1_For_Additional_Calc;
/*  Виконоуємо динамічний запит для того, щоб в назву таблиці додати дату */
        EXEC('
            SELECT 
                *
            INTO 
                [db_depositarium].[777].[output_form3_' + @date_for + '] 
            FROM
                #TempTable2_With_All_Calc');
        
        DROP TABLE IF EXISTS #TempTable1_For_Additional_Calc; --видаляємо непотрібну таблицю

        DROP TABLE IF EXISTS #TempTable2_With_All_Calc; --видаляємо непотрібну таблицю

        SET @SQL = 'SELECT * FROM [db_depositarium].[777].[output_form3_' + @date_for + ']'; --змінну SQL встановлюємо для виконання через процедуру

        EXECUTE sp_executesql  @SQL --виконуємо запит, що знаходиться в змінній
    END;
    SET @SQL = 'SELECT * FROM [db_depositarium].[777].[output_form3_' + @date_for + ']'; --Якщо об'єкт пристуній, то переходимо одразу до встановлення значення змінної ...

    EXECUTE sp_executesql  @SQL -- ... та виконання запиту
END



